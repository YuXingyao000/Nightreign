# Phase 2-B 全景图（v4 · 按 SetCoolTime 分类重构）

**触发条件**：`HasSE(60545)` — Act38 长吼叫首次释放后进入
**招式家族**：P2-A 全部 + 长吼叫大招化 + HP<0.2 处决

---

## 分类标准

- **普攻类**：有 SetCoolTime，走权重抽签（同 P2-A）
- **特殊类**：无 CD 或 CD=0，SE 强制触发
- **走位类**：位移/转身

---

## 全景图 · 顶层判定优先级

```mermaid
%%{init: {'flowchart': {'curve': 'stepBefore'}}}%%
flowchart TB
    IN[/"Battle Decision"/]
    Q1{"HasSE(60566)?<br>吸球第一段已完成"}
    Q2{"HP<0.2<br>无 60585?"}
    Q3{"HasSE(60553)?<br>长吼叫触发条件"}
    Q4{"HasSE(60551)?<br>红刀链启动"}
    NORMAL["【普攻类池】<br>20-24 二阶普攻 · 15 吸球启动<br>+ 35 甩尸块 · 36 吼叫 · 37 飞扑<br>+ 40-42/45 走位<br>整体权重比 P2-A 更激进"]

    A1["🔵 特殊-吸球第二段<br>slot 16/17"]
    A2["🔴 特殊-超大球（处决化）<br>slot 18 · CD 0"]
    A3["⚡ 特殊-长吼叫（大招化）<br>slot 38 · 无 CD<br>3 变体收尾"]
    A4["🔴 特殊-P2 红刀链<br>slot 30 → 32 → 31"]

    IN --> Q1
    Q1 -->|是| A1
    Q1 -->|否| Q2
    Q2 -->|是| A2
    Q2 -->|否| Q3
    Q3 -->|是| A3
    Q3 -->|否| Q4
    Q4 -->|是| A4
    Q4 -->|否| NORMAL

    classDef q fill:#fff7d6,stroke:#cc9966
    classDef sp fill:#ffd8e0,stroke:#cc3366,stroke-width:2px
    classDef ball fill:#d8e0ff,stroke:#3366cc,stroke-width:2px
    classDef ult fill:#ffb090,stroke:#cc3300,stroke-width:3px
    classDef exec fill:#c8d0ff,stroke:#3366cc,stroke-width:2px
    classDef n fill:#f5d8d8,stroke:#b97a7a,stroke-width:2px
    class Q1,Q2,Q3,Q4 q
    class A1 ball
    class A2 exec
    class A3 ult
    class A4 sp
    class NORMAL n
```

**观察 P2-B 相比 P2-A 的顶层变化**：
- **新增最高优先级 Q2 处决判定**（HP<0.2）——boss 濒死时自动进入处决模式
- **新增 Q3 长吼叫大招判定**——60553 变成通往 slot 38（P2-B）或 slot 18（P1-B）的双分支入口
- **HP 阈值判定被 SE 强制覆盖**——P2-A 的血量分层在 P2-B 里退化，因为 P2-B 本身就是"低血阶段"的标志

---

## 一、普攻类

**结构与 P2-A 相同**（招式池、派生规则、状态图完全一致），详见 `phase2A.md`。

**P2-B 相比 P2-A 的差异**：
- **权重整体上调**（贴脸横扫从 50→100 等）
- Interrupt 5036 帧多了一条 3019（乱舞派生）路径 —— 只在 60545 上身且 60555 不在时触发

---

## 二、飞扑家族 combo（含 P2-B 特有分支）

**P2-A 有的 3 段路径全部继承**，加上 **P2-B 特有的 5036 帧 3019 派生**：

```mermaid
%%{init: {'flowchart': {'curve': 'stepBefore'}}}%%
flowchart LR
    ENTRY[/"从权重池抽到 slot 37"/]
    S37["飞扑起手 3034<br>CD 30s"]

    Q1{"5035帧: 玩家在<br>前方 100m?"}
    S37_D33["⏩ 3033<br>飞扑追击"]
    NOP1[/"不追加"/]

    Q2{"5036帧:<br>60545 ✓ 60555 ✗?"}
    D3019["⏩ 3019<br>P2-B 特有<br>乱舞派生"]

    Q3{"5036帧:<br>60555 ✓<br>rand ≤ 70?"}
    S37_D39["🛑 3039<br>飞扑终结"]
    NOP2[/"不追加"/]

    EXIT[/"AfterAttack"/]

    ENTRY --> S37 --> Q1
    Q1 -->|"是"| S37_D33
    Q1 -->|"否"| NOP1
    S37_D33 --> Q2
    Q2 -->|"是（P2-B 特有分支）"| D3019
    Q2 -->|"否"| Q3
    Q3 -->|"70%"| S37_D39
    Q3 -->|"30%"| NOP2

    NOP1 -.-> EXIT
    NOP2 -.-> EXIT
    S37_D39 -.-> EXIT
    D3019 -.-> EXIT

    classDef entry fill:#fff0d0,stroke:#cc9966
    classDef start fill:#ffcca0,stroke:#cc5533,stroke-width:2px
    classDef q fill:#fff7d6,stroke:#cc9966
    classDef repeat fill:#ffd8d8,stroke:#cc3333,stroke-width:2px
    classDef fin fill:#ff9090,stroke:#cc3333,stroke-width:3px
    classDef nop fill:#f0f0f0,stroke:#888
    classDef exit fill:#e8f8ff,stroke:#4477bb

    class ENTRY entry
    class S37 start
    class Q1,Q2,Q3 q
    class S37_D33,D3019 repeat
    class S37_D39 fin
    class NOP1,NOP2 nop
    class EXIT exit
```

**P2-B 独有**：如果第二次飞扑后 60555 未上身（可能是打断/干扰导致的边缘情况），会走到 `60545 无 60555` 分支派生成 3019 而非 3039。

---

## 三、吼叫→乱舞

**结构与 P2-A 完全相同**（`phase2A.md` 的第三节）。

---

## 四、特殊类 · 长吼叫（P2-B 专属大招）

**入口**：`HasSE(60553)`
**特点**：**代码里根本没有 SetCoolTime 3038**——真正的"无 CD"特殊招
**独特设计**：**5037 帧派生 3 变体收尾**（3035/3036/3037，rand 抽签）

### 完整 combo 图

```mermaid
%%{init: {'flowchart': {'curve': 'stepBefore'}}}%%
flowchart LR
    ENTRY[/"HasSE(60553)"/]
    S38["长吼叫起手 3038<br>无 SetCoolTime<br>观察 5037<br>P2-B 独有"]
    Q1{"5037帧<br>玩家 & 距离判定<br>+ rand 抽签"}

    F35["🛑 3035<br>长吼叫收尾·1<br>Final"]
    F36["🛑 3036<br>长吼叫收尾·2<br>Final"]
    F37["🛑 3037<br>长吼叫收尾·3<br>Final"]

    Q_INT{"⚡ 蓄力中被打?<br>60592 SE 触发"}
    D3023_FIN["🛑 3023<br>被打断收尾<br>Final"]

    EXIT[/"AfterAttack"/]

    ENTRY ==>|"权重强制 100"| S38
    S38 --> Q1
    Q1 -->|"分支 A: rand<40"| F35
    Q1 -->|"分支 B: rand 40-60"| F36
    Q1 -->|"分支 C: rand>60"| F37

    S38 -.->|"如果被打到"| Q_INT
    Q_INT ==>|"ClearSubGoal +<br>强制 Final"| D3023_FIN

    F35 -.-> EXIT
    F36 -.-> EXIT
    F37 -.-> EXIT
    D3023_FIN -.-> EXIT

    classDef entry fill:#fff0d0,stroke:#cc9966
    classDef ult fill:#ffb090,stroke:#cc3300,stroke-width:3px
    classDef q fill:#fff7d6,stroke:#cc9966
    classDef fin fill:#ff9090,stroke:#cc3333,stroke-width:3px
    classDef intfin fill:#ffddee,stroke:#cc6699,stroke-width:2.5px
    classDef exit fill:#e8f8ff,stroke:#4477bb

    class ENTRY entry
    class S38 ult
    class Q1,Q_INT q
    class F35,F36,F37 fin
    class D3023_FIN intfin
    class EXIT exit
```

**为什么 3 变体收尾这么设计**：
- **一段起手动画（3038）+ 三段收尾动画（3035/3036/3037）** = 玩家看到"每次长吼叫都不一样"
- **只需要 3 段动画，就能给玩家"变化多端"的感受**——用少量素材制造大量差异
- **rand 抽签让玩家无法记招**——"这次是哪个收尾"永远不确定

**60592 蓄力打断**：boss 长吼叫或飞扑蓄力时被打到 → 强制清空 SubGoal → 硬性接 3023 (Final) 收尾。**这是玩家主动打断 boss 大招的正确应对方式**。

---

## 五、特殊类 · 超大球（处决化）

**入口**：`HP < 0.2 且无 60585 SE`
**变化**：从 P1-B 时的"HP<0.6 触发"变为 **"HP<0.2 触发"**——boss 濒死时的最后手段

```mermaid
flowchart LR
    ENTRY[/"HP < 0.2<br>且无 60585"/]
    S18["🔵 超大球（处决化）<br>slot 18 · 3032 · CD 0"]
    RESULT[/"AfterAttack<br>回到自由抽签"/]

    ENTRY ==>|"权重强制 100"| S18
    S18 -.-> RESULT

    classDef entry fill:#fff0d0,stroke:#cc9966
    classDef exec fill:#c8d0ff,stroke:#3366cc,stroke-width:3px
    classDef result fill:#e8f8ff,stroke:#4477bb

    class ENTRY entry
    class S18 exec
    class RESULT result
```

**60585 是 SE 抑制锁**——防止 boss 频繁重复超大球（打完一次会短时间上锁）。

---

## 六、其他特殊类（继承）

- **P2 红刀链**：结构与 P2-A 相同（3 段版），见 `phase2A.md`
- **吸球短 combo**：结构与 P2-A 相同，见 `phase2A.md`

---

## 权重矩阵（P2-B 激烈版差异）

结构与 P2-A 相同，主要差异：

| 距离段 | 二阶收尾<br>(24) 贴脸 | 二阶横扫<br>(22) | 吼叫→乱舞<br>(36) | StepSafety<br>(45) |
|--------|-------|-------|-------|-------|
| P2-A ≤5 前方 | 200 | 50 | 200 | - |
| **P2-B ≤5 前方** | **200** | **100** | **200** | - |
| P2-A ≤5 背身 | 0 | 100 | 0 | 200 |
| **P2-B ≤5 背身** | **0** | **100** | **0** | **200** |

**权重变化不大是有原因的**：P2-B 的"激烈感"不来自权重上调，而来自**新增的两个大招入口（长吼叫 slot 38、处决超大球 slot 18）**——这两个不是从权重池抽的，是 SE 强制的。**P2-B 感觉更凶不是因为普攻更快，而是大招频率更高**。

---

## 关键设计洞察

1. **P2-B 是"大招权限扩展"阶段**
   - slot 38 长吼叫和 slot 18 超大球都从"仪式招"变成"常规大招"
   - 玩家进入 P2-B 后每场战斗会多经历 2-3 次这两个招式

2. **长吼叫的 3 变体收尾是 FS 的"少素材大差异"技巧**
   - 一个起手动画 (3038) + 三个收尾动画 (3035/3036/3037) = 玩家感受到 3 种不同的招
   - 总动画量只增加 3 段，但组合出的"独特感"翻 3 倍

3. **HP<0.2 处决 slot 18 的存在** = FS 强制濒死 boss 有一个"最后的爆发"
   - 玩家不能靠"磨血"取胜，必须准备好应对最后阶段的密集大招
   - 60585 抑制锁保证不会连续处决

4. **60592 打断收尾 3023 是玩家的主动手段**
   - 多数 boss 招式的 combo 是 boss 主导，只有这个"打断蓄力"是玩家主导 boss 的行为
   - 学会主动打断 = 学会控制 P2-B 节奏

5. **Interrupt 表 P2-A/P2-B 完全共用**（同一个 60545/60546 分支）
   - **"是否 P2-B" 完全靠权重池的额外招式区分**，Interrupt 不管你是激烈版还是普通版
   - 大大减少了策划的调参工作量
