# King of Rubble (Boss 761000 / c7610) — Boss AI 逆向分析

**版本 v3**（2026-07 完整重构版）：
所有图从 Graphviz `.dot` 迁移到 **Markdown + Mermaid**，采用"每起手招独立列 + 共享派生副本"布局，避免线条交叉。

源文件：
- `script/761000_battle.dec.lua` — 行为决策层（本文档主要分析对象）
- `action/script/c7610.dec.lua` — 动作事件层（本轮未详细分析）
- `chr/c7610.*` — 动画/骨骼/模型资源（不在 lua 层）

---

## 阅读顺序

在 VS Code 里打开任意 `.md` 文件，右上角点 **"Preview"**（`Ctrl+K V` 侧边预览）即可查看渲染后的 Mermaid 图。

**推荐顺序**：

1. **`overview.md`** — 顶层：4 阶段 + 3 个转移仪式
2. **`combo_termination.md`** — 【核心洞察】SubGoal 三分类 + Final 招是玩家学习锚点
3. **`combo_chains.md`** — 教学图：红刀链 + 吸球链
4. **`phase1A.md`** — Phase 1-A（else 兜底，最简单，读图入门）
5. **`phase1B.md`** — Phase 1-B（60547 分支，引入 combo chain）
6. **`phase2A.md`** — Phase 2-A（60546 分支，DragonForm 起始）
7. **`phase2B.md`** — Phase 2-B（60545 分支，激烈化）

**辅助文档**：
- `framework_explained.md` — Goal/SubGoal 框架的通用解释
- `design_mindset.md` — From 战斗策划的心智模型笔记

---

## Mermaid 渲染工具

- **VS Code**（推荐）：装 `Markdown Preview Mermaid Support` 插件（作者 Matt Bierner）
- **在线**：https://mermaid.live/ 或直接在 GitHub push 后自动渲染
- **导出图片**：mermaid.live 支持 SVG/PNG 导出

---

## 阶段模型

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

**关键洞察**：**转阶段仪式的 SE 变化编码在动画 track 里**（`AddSpecEffect_XXX`），不是 lua 代码里的赋值。这是 FS 一贯的设计——**逻辑通过动画传递**。

---

## SE 语义表

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
| **60551** | 红刀链启动标志 |
| **60565** | 红刀链进度位 1（抬手完成）|
| **60567** | 红刀链进度位 2（架势完成）|
| **60566** | 吸球链进度位（吸球启动完成）|
| **60553** | 触发终结招（超大球 or 长吼叫）|
| **60570** | 红刀释放冷却锁 |

### 抑制锁

| SE | 效果 |
|---|---|
| 60590 | 锁 slot 1/2/3 |
| 60591 | 锁 slot 41/42 |
| 60592 | 蓄力被打断 → Interrupt 强制清空+接续 3023 |
| 60593 | 锁 slot 15（吸球锁）|

### 招式关键帧（Interrupt 触发点）

| SE | 由谁加 | 用途 |
|---|---|---|
| 5025 | 近战A | 派生 3008/3001 |
| 5026 | 近战B | 派生 3008 (Repeat) 或 3001 (Final) |
| 5027-5029 | 横扫 | 派生 3006/3007/3008/3011 |
| 5030 | 重击 3012 | 命中帧接 3008/3001 |
| 5031 | 收尾 3013 | 派生 3014 |
| 5033 | 甩尸块 | P2 特有派生 |
| 5034 | 乱舞 起手 | 危险预警 |
| 5035 | 飞扑 起手 | 危险预警 |
| 5037 | 长吼叫 起手 | 大招预警 → 3 变体 Final |
| 5401 | 极低血/暴怒模式 | Act16/17 内部 swap AttackID |

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

- [ ] `interrupt_p1.md` / `interrupt_p2.md` — 单独整理 Interrupt 反应表（如需要）
- [ ] `action_cancel_windows.md` — 从 `action/script/c7610.dec.lua` 抽出每个动画的取消窗口
- [ ] 找 ESD 文件（`c7610.esdbnd.dcx`）解读 boss 的宏观状态机（睡→醒→战→死）
