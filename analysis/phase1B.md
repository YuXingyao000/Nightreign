# Phase 1-B 全景图（v4 · 按 SetCoolTime 分类重构）

**触发条件**：`HasSE(60547)` — Act18 超大球首次释放后进入

**进入时机**：
- P1-A 内部 HP 分层：
  - HP > 0.9 → 只有普攻和走位
  - HP < 0.9 → 加入乱舞 slot 14 和吸球 slot 15
  - HP < 0.6 → 强制推 slot 18（超大球）→ 首发时加 60547 → 进入 P1-B
- **60% 是硬阈值**（`< 0.6`）

---

## 分类标准

**普攻类（有 SetCoolTime，走权重抽签）** — 策划管理的常规招式
**特殊类（无 CD 或 CD=0）** — SE 强制触发，不走权重池的招式
**走位类** — 位移/转身，不造成伤害

---

## 全景图 · 顶层判定优先级（分类树）

```mermaid
%%{init: {'flowchart': {'curve': 'stepBefore'}}}%%
flowchart TB
    IN[/"Battle Decision"/]
    Q1{"HasSE(60566)?<br>吸球第一段已完成"}
    Q2{"HasSE(60553)?<br>超大球触发条件"}
    Q3{"HasSE(60551)?<br>红刀链启动"}
    NORMAL["【普攻类池 · 权重抽签】<br>1-5 近战 · 14 乱舞 · 15 吸球启动<br>40-42 走位<br>+ HP 阈值调整"]

    A1["🔵 特殊-吸球第二段<br>slot 16 或 17"]
    A2["🔴 特殊-超大球<br>slot 18"]
    A3["🔴 特殊-红刀链推进<br>slot 10 → 12 → 11/13"]

    IN --> Q1
    Q1 -->|是| A1
    Q1 -->|否| Q2
    Q2 -->|是| A2
    Q2 -->|否| Q3
    Q3 -->|是| A3
    Q3 -->|否| NORMAL

    classDef q fill:#fff7d6,stroke:#cc9966
    classDef sp fill:#ffd8e0,stroke:#cc3366,stroke-width:2px
    classDef ball fill:#d8e0ff,stroke:#3366cc,stroke-width:2px
    classDef n fill:#dff5d8,stroke:#7ab97a,stroke-width:2px
    class Q1,Q2,Q3 q
    class A1 ball
    class A2,A3 sp
    class NORMAL n
```

**顶层机制**：**特殊类的优先级永远高于普攻类**——boss 一旦身上有 combo SE，权重池被无视。玩家看到红刀抬手就知道"接下来必然按 combo 走完"，无法用距离引诱 boss 换招。

---

## 一、普攻类（自回环连通图）

普攻类的核心是"抽签 → 起手 → Interrupt 派生 → AfterAttack → 回到抽签"的循环。同时**有些招式起手后会通过 SE 转成特殊类**（例如吸球启动加 60566 → 下次 Activate 走特殊分支）。

### 招式清单

| Slot | 招式 | AttackID | CD | 派生行为 |
|------|------|----------|-----|---------|
| 1 | 近战A | 3000 | 10s | 5025 帧派生 |
| 2 | 近战B | 3001 | 20s | 5026 帧派生（含唯一 Final）|
| 3 | 横扫 | 3005/3010 | 20s | 5027/5028/5029 帧派生 |
| 4 | 重攻击 | 3012 | 20s | 5030 帧派生 |
| 5 | 近战收尾 | 3013 | 10s | 5031 帧派生 |
| 14 | 乱舞 | 3024 | 30s | 无派生 |
| 15 | 吸球启动 | 3025 | 20s | **打完加 60566 → 转特殊类**|

### 状态图（普攻循环 + 派生）

```mermaid
%%{init: {'flowchart': {'curve': 'stepBefore'}}}%%
flowchart TB
    HUB{{"⚙ Battle Decision<br>抽签"}}

    subgraph startups ["起手池"]
        S1["近战A<br>slot 1 · 3000"]
        S2["近战B 🎭<br>slot 2 · 3001"]
        S3["横扫<br>slot 3 · 3005"]
        S4["重击<br>slot 4 · 3012"]
        S5["收尾<br>slot 5 · 3013"]
        S14["乱舞<br>slot 14 · 3024"]
        S15["吸球启动<br>slot 15 · 3025"]
    end

    subgraph derivs ["派生招（Repeat）"]
        D8["3008<br>重击追击"]
        D7["3007<br>横扫近距"]
        D6["3006<br>横扫中距"]
        D14["3014<br>二段重击"]
    end

    S2_FIN["🛑 3001 Final<br>唯一句号"]
    AA["🌬 AfterAttack"]
    TO_SPECIAL[/"→ 转特殊类<br>下次 Activate 走 60566 分支"/]

    HUB --> S1
    HUB --> S2
    HUB --> S3
    HUB --> S4
    HUB --> S5
    HUB --> S14
    HUB --> S15

    S1 -->|"5025帧近"| D8
    S1 -->|"5025帧中"| S2
    S2 -->|"5026帧近"| D8
    S2 ==>|"5026帧中"| S2_FIN
    S3 -->|"5027/5028帧近"| D7
    S3 -->|"5027帧中"| D6
    S3 -->|"5029帧近"| D8
    S3 -->|"5029帧中"| S2
    S4 -->|"5030帧近"| D8
    S4 -->|"5030帧中"| S2
    S5 -->|"5031帧近"| D14

    S15 -.->|"打完加 60566"| TO_SPECIAL

    D8 -.-> AA
    D7 -.-> AA
    D6 -.-> AA
    D14 -.-> AA
    S1 -.-> AA
    S2 -.-> AA
    S3 -.-> AA
    S4 -.-> AA
    S5 -.-> AA
    S14 -.-> AA
    S2_FIN -.-> AA
    AA -.->|"回到抽签"| HUB

    classDef hub fill:#fff7d6,stroke:#cc9966,stroke-width:2px
    classDef pure fill:#dff5d8,stroke:#7ab97a,stroke-width:2px
    classDef dual fill:#f5ecd8,stroke:#cc3333,stroke-width:3px
    classDef repeat fill:#ffd8d8,stroke:#cc3333,stroke-width:2px
    classDef fin fill:#ff9090,stroke:#cc3333,stroke-width:3px
    classDef aa fill:#e8f8ff,stroke:#4477bb
    classDef xfer fill:#ffd8e0,stroke:#cc3366

    class HUB hub
    class S1,S3,S4,S5,S14,S15 pure
    class S2 dual
    class D8,D7,D6,D14 repeat
    class S2_FIN fin
    class AA aa
    class TO_SPECIAL xfer
```

**关键观察**：
- **AfterAttack 回到 HUB 形成完整循环**——这就是"自回环连通图"
- **吸球启动 (slot 15) 是一条"逃逸边"**：打完不回 HUB，而是通过 SE 60566 跳转到特殊类
- **两栖招 3001（近战B）**：既能起手也能被派生（近战A 5025帧中距、横扫 5029帧中距、重击 5030帧中距都会派生成 3001）——**图上表现为"派生边指回起手池"**
- **只有一处 Final**：3001 的 5026帧中距——玩家学习的锚点

---

## 二、特殊类 · 红刀链

**入口**：外部加 SE 60551（授予时机在 lua 内没找到，可能由动画 track 或引擎事件触发）
**特点**：**无 SetCoolTime**（除 slot 13 追击有 CD 5s），完全不受冷却限制
**推进**：SE 60565/60567 作为进度位

### 严格代码分支

```
elseif HasSE(60551):
    if HasSE(60565):
        if HasSE(60567):
            if dist > 15:
                slot 11 = 100  slot 13 = 300 (远距高权重追击)
            else:
                slot 11 = 100
        else:
            slot 12 = 100
    else:
        slot 10 = 100
```

⚠️ **语义待你实测校准**：注释里 slot 10=抬手 / slot 11=架势 / slot 12=释放 / slot 13=追击拉近，但代码流程是 **slot 10 → slot 12 → slot 11/13**，与"抬手→架势→释放"直觉不完全对应。图按代码严格逻辑画：

```mermaid
%%{init: {'flowchart': {'curve': 'stepBefore'}}}%%
flowchart LR
    ENTRY[/"⚡ 外部加 SE 60551"/]
    R10["slot 10 · 3015<br>注释: 红刀抬手"]
    HUB1{{"BD · 60565 ✓ 60567 ✗"}}
    R12["slot 12 · 3017<br>注释: 红刀释放"]
    HUB2{{"BD · 60565 ✓ 60567 ✓"}}
    R11["slot 11 · 3016<br>注释: 红刀架势"]
    R13["slot 13 · 3018<br>注释: 红刀走位拉近<br>P1 独有 · CD 5s"]
    EXIT[/"清 SE，回归自由抽签"/]

    ENTRY --> R10
    R10 -.->|"打完加 60565"| HUB1
    HUB1 ==>|"权重 100"| R12
    R12 -.->|"打完加 60567"| HUB2
    HUB2 ==>|"dist ≤ 15<br>slot 11 权重 100"| R11
    HUB2 ==>|"dist > 15<br>slot 13 权重 300 优先"| R13
    HUB2 -.->|"dist > 15<br>slot 11 权重 100 备选"| R11
    R11 -.-> EXIT
    R13 -.-> EXIT

    classDef entry fill:#fff0d0,stroke:#cc9966
    classDef hub fill:#fff7d6,stroke:#cc9966,stroke-width:2px
    classDef combo fill:#ffd8e0,stroke:#cc3366,stroke-width:2px
    classDef exit fill:#e8f8ff,stroke:#4477bb

    class ENTRY,EXIT entry
    class HUB1,HUB2 hub
    class R10,R11,R12,R13 combo
```

---

## 三、特殊类 · 超大球

**入口**：3 种触发路径，都跟 HP 阈值或 60553 相关
**特点**：`SetCoolTime(3032, 0)`——**冷却 0**，靠触发条件本身限流
**双重身份**：首次释放是转阶段仪式（加 60547），之后作为常规大招

```mermaid
%%{init: {'flowchart': {'curve': 'stepBefore'}}}%%
flowchart TB
    E1[/"P1-A 时 HP<0.6<br>line 722"/]
    E2[/"P1-B 时 HP<0.6<br>line 722（重复触发）"/]
    E3[/"HasSE(60553)<br>line 561/75<br>P1-B 或 P2-B 内触发"/]

    S18["🔵 超大球<br>slot 18 · 3032<br>SetCoolTime = 0"]

    R1[/"首次：动画 track 加 60547<br>→ 从此进入 P1-B<br>（转阶段仪式）"/]
    R2[/"之后：作为常规大招<br>回到自由抽签"/]

    E1 ==>|"权重强制 100"| S18
    E2 ==>|"权重强制 100"| S18
    E3 ==>|"权重强制 100"| S18

    S18 -.->|"首次时"| R1
    S18 -.->|"之后"| R2

    classDef entry fill:#fff0d0,stroke:#cc9966
    classDef bigball fill:#c8d0ff,stroke:#3366cc,stroke-width:3px
    classDef result fill:#e8f8ff,stroke:#4477bb

    class E1,E2,E3 entry
    class S18 bigball
    class R1,R2 result
```

---

## 四、普攻类中的"短 combo" · 吸球

**吸球是普攻类**（slot 15 有 CD 20s），但它有一段短 combo 通过 SE 60566 强制推进。这段 combo 起手在普攻权重池，但推进阶段短暂进入"顶层判定优先级"分支。

```mermaid
%%{init: {'flowchart': {'curve': 'stepBefore'}}}%%
flowchart LR
    ENTRY[/"🟢 从普攻权重池抽到<br>slot 15（需 dist>10）"/]
    B15["吸球启动<br>slot 15 · 3025 · CD 20s<br><br>播放中: track 加 60566"]
    HUB1{{"BD · 60566 上身<br>顶层最高优先级"}}
    B16["吸球释放-远丢<br>slot 16 · 3026<br>dist > 12.5 时选此"]
    B17["吸球释放-近砸<br>slot 17 · 3027<br>dist ≤ 12.5 时选此"]
    EXIT[/"清 60566<br>回归自由抽签"/]

    ENTRY --> B15
    B15 -.->|"打完加 60566"| HUB1
    HUB1 ==>|"dist > 12.5"| B16
    HUB1 ==>|"dist ≤ 12.5"| B17
    B16 -.-> EXIT
    B17 -.-> EXIT

    classDef entry fill:#fff0d0,stroke:#cc9966
    classDef hub fill:#fff7d6,stroke:#cc9966,stroke-width:2px
    classDef ball fill:#d8e0ff,stroke:#3366cc,stroke-width:2px
    classDef exit fill:#e8f8ff,stroke:#4477bb

    class ENTRY,EXIT entry
    class HUB1 hub
    class B15,B16,B17 ball
```

**为什么归普攻类**：**slot 15 有 CD 20s**——boss 不能连续吸球，需要冷却。这是策划管理的普攻技能，只是它有短 combo 而已。**超大球 slot 18 的 CD 0** 才是真正的"特殊技能"标记。

---

## 五、普攻类 · 独立大招 乱舞

```mermaid
flowchart LR
    HUB{{"BD · 抽签"}}
    N14["乱舞<br>slot 14 · 3024<br>CD 30s<br>所有距离段权重≥150"]
    AA["🌬 AfterAttack"]
    HUB --> N14
    N14 -.-> AA
    AA -.-> HUB

    classDef hub fill:#fff7d6,stroke:#cc9966,stroke-width:2px
    classDef ult fill:#f5d8d8,stroke:#b97a7a,stroke-width:3px
    classDef aa fill:#e8f8ff,stroke:#4477bb

    class HUB hub
    class N14 ult
    class AA aa
```

**乱舞是普攻类**（有 CD 30s），无 combo 无 Interrupt 派生，纯"抽签→播→呼吸"独立循环。冷却 30s + 距离段权重 150 = 平均每场战斗 3-5 次。

---

## 权重矩阵（普攻类）

| 距离段 | 朝向 | 近战A<br>(1) | 近战B<br>(2) | 横扫<br>(3) | 重击<br>(4) | 收尾<br>(5) | 乱舞<br>(14) | 吸球启动<br>(15) | 走位<br>(40-42) |
|--------|------|-----|-----|-----|-----|-----|-----|-----|-----|
| >30 | 前方/背身 | 50 | 100 | 100 | 0 | 0 | 150 | 0 | 50 |
| >20 | 前方/背身 | 50 | 100 | 100 | 0 | 0 | 150 | **200** | 50 |
| >10 | 前方/背身 | 100 | 100 | 100 | 50 | 0 | 150 | **200** | 50 |
| >5 | 前方/背身 | 100 | 100 | 100 | 50 | 0 | 150 | **200** | 50/50 |
| ≤5 | 前方 | 50 | 50 | 100 | 50 | 200 | 150 | **200** | 0/50/0 |
| ≤5 | 背身 | 50 | 50 | 100 | 50 | 200 | 150 | **200** | 0/50/0 |

**观察**：
- **slot 15（吸球启动）dist>20 起权重 200**——远距 boss 强烈倾向吸球
- **slot 14（乱舞）全距离段权重 150**——是 P1-B 的"节奏骨架"
- **只有 dist>30 时 slot 15 = 0**——太远吸球没意义

---

## 全局抑制锁

| 身上 SE | 效果 |
|---------|------|
| 60590 | slot 1/2/3 = 0（普攻锁）|
| 60591 | slot 41/42 = 0（走位锁）|
| 60593 | slot 15 = 0（吸球锁）|

---

## 关键设计洞察

1. **SetCoolTime 有无 = 招式属性的官方分类标记**
   - 有 CD → 策划管理的常规招（普攻类）
   - CD=0 或无 → 特殊触发招（红刀链、超大球）
   - 你之前看到 line 987 的 `SetCoolTime(3032, 0)` 觉得是死代码，其实是**显式声明"这不是靠 CD 限流的常规招"**

2. **红刀链的"无 CD"是设计意图**
   - 红刀链每次触发是**外部事件**（可能是 HP 到某阈值、或某招后自动触发）
   - 触发条件本身就限流，不需要 CD 再限一次

3. **吸球和超大球的 slot 18 复用**
   - `SetCoolTime(3032, 0)` = 超大球（特殊招）
   - `SetCoolTime(3025, 20)` = 吸球（普攻招）
   - **同一个 slot 承载两种性质的招**——这是 FS 的编码技巧
