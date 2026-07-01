# FromSoftware Boss AI 框架解读

读懂这一份，你就能读其他 boss 的 lua，不止垃圾王。

---

## 一、Goal — 基本单位

```
class Goal {
    Initialize()  // 创建时一次性
    Activate()    // 每次成为活跃 Goal 时
    Update()      // 活跃期间每 tick
    Terminate()   // 离开活跃时
    Interrupt()   // 外部事件触发时
}
```

`RegisterTableGoal(GOAL_xxx, "name")` = 注册到全局表（**不是激活**）。

垃圾王这个文件注册了两个 Goal：
- `GOAL_KingOfRubble761000_Battle` (line 3) — 主战斗 Goal
- `GOAL_KingOfRubble761000_AfterAttackAct` (line 2272) — 打完招的"呼吸"空 Goal

---

## 二、五个生命周期回调

### `Goal.Initialize`
**只调用一次**，Goal 实例创建时。适合一次性配置。
垃圾王只在这里 `EnableUnfavorableAttackCheck(0, 30xx)` 注册 18 个 AttackID。

### `Goal.Activate`
**每次该 Goal 变为活跃时调用。** 对长期持有的战斗 Goal 来说，等价于"**每次出招前**"。
工作流：收集情境 → 填权重表 → 调用 `Common_Battle_Activate` 加权抽签 → 抽中的 Act 函数 `AddSubGoal(...)` → 引擎切到 SubGoal。

### `Goal.Update`
**Goal 活跃期间每 AI tick 调用一次。**
垃圾王直接返回 `Update_Default_NoSubGoal(...)` — From 通用心跳实现：
- 有 SubGoal 在跑 → 什么都不做
- SubGoal 跑完 → 触发 Activate 重新决策

**决策不在 Update 里，在 Activate 里。** 99% 的 boss 这里都是默认实现。

### `Goal.Terminate`
**Goal 离开活跃时调用。** 用来清理状态。垃圾王空实现 = 没什么要清理的。

### `Goal.Interrupt`
**外部事件触发时调用，可以打断当前 SubGoal。** 5 个回调里最重要的一个。

契约：
- `return true` → 已处理，请打断当前 SubGoal 按我的新设来
- `return false` → 不处理，继续跑当前 SubGoal

垃圾王 Interrupt 干两件事：
1. 被打到 + rand≤30 → `Replaning()` 立即重走 Activate
2. 自身上 SE 5025-5038（动画关键帧）→ 看玩家位置 + 概率门限 → 接 combo

**这是"博弈感"的代码出处** — boss 在招式中途睁眼看你的机制。

---

## 三、SubGoal — 调用栈

**SubGoal = 嵌套的 Goal。** Goal 可以 `AddSubGoal(...)` 把任务委托出去，自己等它跑完。

```
[栈顶]  GOAL_COMMON_ComboTunable_SuccessAngle180 (正在播 3000)
        GOAL_KingOfRubble761000_Battle (主战斗)
[栈底]
```

**这是建模 boss 行为最好的心智模型** — 当前在做什么 = 看栈顶。

### 垃圾王用过的 SubGoal 一览

| SubGoal | 用途 |
|---|---|
| `GOAL_COMMON_ComboTunable_SuccessAngle180` | 播放一个攻击动画，参数含 AttackID/目标/距离/角度 |
| `GOAL_COMMON_ComboRepeat_SuccessAngle180` | 接 combo 的攻击（可重复同招）|
| `GOAL_COMMON_ComboFinal` | combo 收尾招（标记最后一击）|
| `GOAL_COMMON_ApproachTarget` | 靠近目标到某距离 |
| `GOAL_COMMON_LeaveTarget` | 远离目标 |
| `GOAL_COMMON_SidewayMove` | 侧向移动（随机左右）|
| `GOAL_COMMON_Turn` | 转身到某角度 |
| `GOAL_COMMON_StepSafety` | 后撤步，可指定方向 |
| `GOAL_KingOfRubble761000_AfterAttackAct` | 打完招的呼吸（空 Goal）|

**`761000_battle.dec.lua` 不实现任何动画播放或位移逻辑。** 它只决定调用哪个 `GOAL_COMMON_xxx` + 填参数。所有"怎么走、怎么挥砍"都在通用 SubGoal 里，这些 lua 在别的文件里（仓库里目前没有），所有 boss 共享。

**这是组合优于继承**：通用 SubGoal = 工具库；boss 自己的 Goal = 编排者。做新 boss 主要写 `Activate` 权重表 + `Interrupt` 反应表。

---

## 四、完整执行流（举例：选了 slot 1 / Act01 / 近战 1）

```
[GOAL_KingOfRubble761000_Battle.Activate]
  ↓ Common_Battle_Activate 抽签 → 选中 slot 1
  ↓ 调用 KingOfRubble761000_Act01
  ↓ Act01:
  ↓   Approach_Act_Flex(...)
  ↓   AddObserveSpecialEffectAttribute(SELF, 5025)
  ↓   AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, ..., AttackID=3000)
  ↓
[GOAL_COMMON_ComboTunable_SuccessAngle180]  ← push 入栈
  ↓ 播放 AttackID 3000 动画
  ↓ 动画到关键帧 → boss 自身上 SE 5025
  ↓
引擎调用 [Battle.Interrupt]
  ↓ IsInterupt(ActivateSpecialEffect) + GetSpecialEffectActivateInterruptId(5025) 命中
  ↓ 看玩家位置: 前方 240°×7.5m 内
  ↓ rand≤70: AddSubGoal(GOAL_COMMON_ComboRepeat_..., AttackID=3002)
  ↓ return true
  ↓
[GOAL_COMMON_ComboRepeat_...]  ← 弹出旧 SubGoal，push 新的
  ↓ 播放 3002
  ↓ 跑完，弹栈
  ↓
[Battle Goal] Update 检测无 SubGoal
  ↓ 触发 Activate 重新决策
  ↓ Activate 末尾调用 ActAfter_AdjustSpace
  ↓   AddSubGoal(GOAL_KingOfRubble761000_AfterAttackAct, 10)
  ↓
[AfterAttackAct]  ← push
  ↓ 空 Activate + 空 Update（呼吸窗口）
  ↓ 最多 10 秒 / 或被新 Interrupt 打断
```

**"活跃 Goal" 像调用栈切换。Interrupt 是父 Goal 监听子 Goal 期间的事件。**

---

## 五、SpecialEffect 在框架里的角色

lua 没有真正的状态变量（局部变量每次 Activate 清零）。**SE 是 boss 的"状态记忆"**：

- Act 函数里 `AddObserveSpecialEffectAttribute(SELF, X)` = 声明观察
- 动作脚本 / TAE / 引擎在某时机给 boss 加 SE
- 下次 Activate 通过 `HasSpecialEffectId(SELF, X)` 读取 → 修改权重

**好处**：AI 状态 = 玩家可观察状态（SE 同时驱动光效/属性变化）。debug 和 modding 都容易。

UE 里对应物：`GameplayTag`。

---

## 六、读其他 boss lua 的标准流程

1. **grep `RegisterTableGoal`** → 列出该 boss 注册了几个 Goal
2. **读主战斗 Goal 的 `Goal.Activate`** → 决策树骨架（只读 elseif 条件，不读权重赋值）
3. **读 `Goal.Interrupt`** → 反应表（SE → 接 combo 的映射）
4. **看每个 ActNN 函数** → 用了什么 AttackID、加了什么 ObserveSE
5. **看 `Goal.Initialize` 的 EnableUnfavorableAttackCheck** → 该 boss 用到的所有 AttackID 一览

**跳过 Update 和 Terminate。** 99% 是默认实现。

---

## 七、入口在哪？

`761000_battle.dec.lua` **不是 boss 的入口**。它是 boss 状态机里"战斗"那个状态的内容。

实际唤醒流程：

```
玩家进入 boss 房（地图 EventScript）
  ↓
ESD 状态机：Idle_lying（躺地循环）
  ↓
ESD 检测玩家距离 → 转移到 WakeUp
  ↓
起立动画播放（c7610.dec.lua 的 EventXX 在这里）
  ↓
ESD 转到 Combat 状态
  ↓
NPCThinkParam 指定 GOAL_KingOfRubble761000_Battle 被激活
  ↓ ★ 从这里开始才是这个 lua 文件
Initialize → 第一次 Activate → ...
```

**真正的入口在 ESD 文件里**（通常叫 `c7610.esdbnd.dcx`），需要 EzState/ESDLang 工具反编译，**仓库里目前没有**。

---

## 八、范式归类

这套不是行为树。学名是 **HFSM + Utility-based action selection + Event-driven interrupt**。

更准确的描述：**Goal Stack + Weighted Selector + Reactive Layer**。

| 维度 | 行为树 | 这套架构 |
|---|---|---|
| 决策频率 | 每帧从根重选 | 只在"上一招打完"那一刻 |
| 选择方式 | 硬优先级 selector | 加权随机抽签 |
| 中断方式 | 较高优先级抢占 | 显式 Interrupt 回调 |
| 心智模型 | 一棵树 | 一个栈 + 一个监听器 |

**决策频率**是最关键的差别。这套架构让 boss 有"承诺感"——选了一招就负责执行完，不会半路抽搐。
