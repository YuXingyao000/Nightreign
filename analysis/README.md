# King of Rubble (Boss 761000 / c7610) — Boss AI 逆向分析

**版本 v2**（2026-07 修正版）：
之前的图基于错误的 SE 语义推断，已删除。当前图基于用户实测 + review 后的正确语义。

源文件：
- `script/761000_battle.dec.lua` — 行为决策层（本文档主要分析对象）
- `action/script/c7610.dec.lua` — 动作事件层（本轮未详细分析）
- `chr/c7610.*` — 动画/骨骼/模型资源（不在 lua 层）

---

## 阅读顺序

1. **`overview.dot`** — 顶层：4 阶段 + 转移仪式（先看这张，建立宏观脑图）
2. **`combo_chains.dot`** — 教学图：红刀链 + 吸球链（理解"依赖动画的状态机"）
3. **`phase1A.dot`** — Phase 1-A 状态机（else 兜底分支，最简单，建议作为读图入门）
4. **`phase1B.dot`** — Phase 1-B 状态机（60547 分支，引入 combo chain）
5. **`phase2A.dot`** — Phase 2-A 状态机（60546 分支，DragonForm 起始）
6. **`phase2B.dot`** — Phase 2-B 状态机（60545 分支，激烈化）
7. **`framework_explained.md`** — Goal/SubGoal 框架的通用解释
8. **`design_mindset.md`** — From 战斗策划的心智模型笔记

---

## 渲染工具

- **在线（推荐）**：https://edotor.net/  或  https://dreampuf.github.io/GraphvizOnline/
- **VS Code 插件**：`Graphviz Interactive Preview`（tintinweb）
- **命令行**：`winget install graphviz` 后 `dot -Tsvg xxx.dot -o xxx.svg`

图较大，用 SVG 输出无限放大，比 PNG 好用。

---

## 阶段模型（正确版）

```
Boss 唤醒（ESD 起立完成）
  ↓
Phase 1-A（无 SE 标签，else 兜底）
  【招式】普攻 slot 1-5 + 走位 40-42
  ↓ 血量到某阈值 → 权重池推 slot 15/18
  ↓
🎬 Act18 首次释放（转阶段仪式 1）
  动画 track 加 SE 60547
  ↓
Phase 1-B (60547)
  【招式】+ 红刀链 10-11-12-13 + 吸球链 15-16/17-18 + 乱舞 14
  ↓ HP=0
  ↓
🎬 死亡演出 + DragonForm 变身（转阶段仪式 2，lua 之外）
  由 ESD/EventScript/DragonForm track 外部注入 SE 60546
  ↓
Phase 2-A (60546)
  【招式】二阶普攻 20-24 + 二阶红刀链 30-32 + 飞扑 37 + 甩尸块 35/45 + 乱舞 36
  ↓ 血量到某阈值 → 权重池推 slot 38
  ↓
🎬 Act38 首次释放（转阶段仪式 3）
  动画 track 加 SE 60545
  ↓
Phase 2-B (60545)
  【招式】P2-A 全部 + 长吼叫 slot 38 大招化 + HP<0.2 处决 slot 18
  ↓ HP=0
  ↓
真正死亡
```

**关键洞察**：**转阶段仪式的 SE 变化编码在动画 track 里**（`AddSpecEffect_XXX`），不是 lua 代码里的赋值。这是 From 一贯的设计——**逻辑通过动画传递**，动画不只是表现层，也是状态转移的实施者。

---

## SE 语义表（正确版）

### 阶段标识（互斥）

| SE | 含义 | 加载方式 |
|---|---|---|
| **(无标签)** | Phase 1-A（else 兜底）| 初始状态 |
| **60547** | Phase 1-B | Act18 首次动画 track 加 |
| **60546** | Phase 2-A（DragonForm 起始）| P1 死亡演出后由外部注入 |
| **60545** | Phase 2-B（激烈化）| Act38 首次动画 track 加 |
| **60548** | Phase 1 通用辅助（Interrupt 分支识别用）| 未在顶层出现 |

### Combo 链进度位

| SE | 含义 |
|---|---|
| **60551** | 红刀链启动标志（进入红刀 combo）|
| **60565** | 红刀链进度位 1（抬手完成）|
| **60567** | 红刀链进度位 2（架势完成）|
| **60566** | 吸球链进度位（吸球启动完成）|
| **60553** | 触发终结招（超大球 or 长吼叫）|
| **60570** | 红刀释放冷却锁 |

### 招式关键帧（Interrupt 触发点）

| SE | 由谁加 | Interrupt 用途 |
|---|---|---|
| 5025 | 近战A/近战A' | 帧 5m 内 rand≤70 → 3008，中距 → 3001 |
| 5026 | 近战B | 帧 5m 内 → 3008，中距 → ComboFinal 3001 |
| 5027-5029 | 横扫（3005/3010）| 派生到 3006/3007/3008/3011 |
| 5030 | 重击 3012 | 命中帧接 3008/3001 |
| 5031 | 收尾 3013 | 派生到 3014（二段重击）|
| 5033 | 甩尸块 3020/3021 | P2 特有派生 |
| 5034 | 乱舞 3022 起手 | 危险预警 |
| 5035 | 飞扑 3034 起手 | 危险预警 |
| 5037 | 长吼叫 3038 起手 | 大招预警 |
| 5401 | 极低血/暴怒模式 | Act16/17 内部 swap AttackID |

### 抑制锁

| SE | 效果 |
|---|---|
| 60590 | 锁 slot 1/2/3（基础三连击锁）|
| 60591 | 锁 slot 41/42（走位锁）|
| 60592 | 蓄力被打断 → Interrupt 强制清空+接续 3023 |
| 60593 | 锁 slot 15（吸球锁，二阶段特有）|

---

## 槽位速查表

**跨阶段共通编号规则**：动画资源用 `A000_XXXX.hkx`（Phase 1）和 `A001_XXXX.hkx`（Phase 2）区分，但 lua 层看到的都是同一个 AttackID。**Slot 编号不一定跨阶段共用**——比如 slot 1-5 是 Phase 1 专用，slot 20-24 是 Phase 2 专用（虽然它们的 AttackID 相同）。

| Slot | 语义 | AttackID | 所属阶段 |
|---|---|---|---|
| 1  | 近战A | 3000 | P1 |
| 2  | 近战B | 3001 | P1 |
| 3  | 横扫 | 3005/3010 | P1 |
| 4  | 重攻击 | 3012 | P1 |
| 5  | 近战收尾 | 3013 | P1 |
| 10 | 红刀·抬手 | 3015 | P1-B |
| 11 | 红刀·架势 | 3016 | P1-B |
| 12 | 红刀·释放 | 3017 | P1-B |
| 13 | 红刀·追击拉近 | 3018 | P1-B（P2 无此段）|
| 14 | 乱舞 | 3024 | P1-B |
| 15 | 吸球·启动 | 3025 | P1-B / P2 |
| 16 | 吸球·释放1次 | 3026（可 swap 到 3028/3030）| P1-B / P2 |
| 17 | 吸球·释放2次 | 3027（可 swap 到 3029/3031）| P1-B / P2 |
| 18 | 超大球 | 3032 | P1-B 转阶段仪式 → 之后大招（P2 血低处决）|
| 20 | 二阶近战A | 3000 (A001) | P2 |
| 21 | 二阶近战B | 3001 (A001) | P2 |
| 22 | 二阶横扫 | 3005/3010 (A001) | P2 |
| 23 | 二阶重击 | 3012 (A001) | P2 |
| 24 | 二阶收尾 | 3013 (A001) | P2 |
| 30 | 二阶红刀·抬手 | 3015 (A001) | P2 |
| 31 | 二阶红刀·架势 | 3016 (A001) | P2 |
| 32 | 二阶红刀·释放 | 3017 (A001) | P2 |
| 35 | 甩尸块（左右）| 3020/3021 | P2 |
| 36 | 二阶乱舞 | 3022 | P2 |
| 37 | 飞扑 | 3034 | P2 |
| 38 | 长吼叫 | 3038 | P2 转阶段仪式 → 之后大招 |
| 40 | ApproachTarget | — | 通用 |
| 41 | LeaveTarget/SidewayMove | — | 通用 |
| 42 | SidewayMove | — | 通用 |
| 43 | Turn 90° | — | 通用 |
| 44 | StepSafety | — | 通用 |
| 45 | StepSafety（左右）| — | P2 |

---

## ⚠ lua 不管的事

lua 层只描述"给定当前 SE 状态，选下一招"。以下由引擎/参数表/动画层负责：

| 事项 | 数据在哪 |
|---|---|
| 伤害判定 | 武器/手臂 Sphere/Capsule 碰撞盒 |
| 多人仇恨 / 换目标 | NPCThinkParam（regulation.bin）|
| 转身角速度 | NPCParam / 动作参数表 |
| AttackID → 动画 → 碰撞盒 → 伤害 | TAE / hkx / AttackParam |
| DragonForm 变身仪式 | ESD / EventScript / 死亡演出脚本 |
| SE 60547/60546/60545 的授予 | 动画 track（AddSpecEffect_XXX）|

**"决策边界 = 目标切换边界"** — 多人时 boss 打完一段 combo 才转头看新目标，因为 lua 只在 Activate 入口读 `TARGET_ENE_0`，Interrupt 中锁定同一目标到 combo 打完。

---

## 待办

- [ ] `interrupt_p1.dot` / `interrupt_p2.dot` — 单独展示 Interrupt 反应表（如果需要）
- [ ] `action_cancel_windows.dot` — 从 `action/script/c7610.dec.lua` 抽出每个动画的取消窗口
- [ ] 找 ESD 文件（`c7610.esdbnd.dcx`）解读 boss 的宏观状态机（睡→醒→战→死）
