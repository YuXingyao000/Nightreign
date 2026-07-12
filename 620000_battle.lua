RegisterTableGoal(GOAL_YUPA620000_Battle, "GOAL_YUPA620000")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_YUPA620000_Battle, true)

Goal.Initialize = function (f1_arg0, f1_arg1, f1_arg2, f1_arg3)
    f1_arg1:SetNumber(0, 0)
    f1_arg1:SetNumber(1, 0)
    
end

Goal.Activate = function (f2_arg0, f2_arg1, f2_arg2)
    Init_Pseudo_Global(f2_arg1, f2_arg2)
    f2_arg1:SetStringIndexedNumber("AddDistWalk", 0)
    f2_arg1:SetStringIndexedNumber("AddDistRun", 0.2)
    f2_arg1:SetStringIndexedNumber("Dist_SideStep", 5)
    f2_arg1:SetStringIndexedNumber("Dist_BackStep", 5)
    local f2_local0 = {}
    local f2_local1 = {}
    local f2_local2 = {}
    Common_Clear_Param(f2_local0, f2_local1, f2_local2)
    local f2_local3 = f2_arg1:GetDist(TARGET_ENE_0)
    local f2_local4 = f2_arg1:GetRandam_Int(1, 100)
    local f2_local5 = f2_arg1:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkattr_doAdmirer)
    local f2_local6 = f2_arg1:GetEventRequest()
    local f2_local7 = f2_arg1:GetHpRate(TARGET_SELF)
    local f2_local8 = f2_arg1:GetDistYSigned(TARGET_ENE_0)
    if f2_arg1:GetNumber(0) == 0 then
        f2_local0[24] = 100
    elseif f2_local3 - f2_local8 <= 2 and f2_local8 >= 4 then
        f2_local0[25] = 100
    elseif f2_arg1:HasSpecialEffectId(TARGET_SELF, 16207) == false then
        if f2_local7 <= 0.42 then
            f2_local0[14] = 100
        elseif f2_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 120) then
            if f2_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) then
                f2_local0[1] = 1
                f2_local0[5] = 80
                f2_local0[11] = 10
                f2_local0[20] = 10
            else
                f2_local0[1] = 1
                f2_local0[6] = 80
                f2_local0[11] = 10
                f2_local0[20] = 10
            end
        elseif f2_local3 >= 14 then
            f2_local0[1] = 1
            f2_local0[2] = 0
            f2_local0[3] = 36
            f2_local0[4] = 18
            f2_local0[9] = 0
            f2_local0[11] = 0
            f2_local0[12] = 0
            f2_local0[13] = 0
            f2_local0[16] = 36
            f2_local0[21] = 0
            f2_local0[22] = 0
            f2_local0[25] = 10
        elseif f2_local3 >= 5.3 then
            f2_local0[1] = 1
            f2_local0[2] = 10
            f2_local0[3] = 30
            f2_local0[4] = 10
            f2_local0[9] = 0
            f2_local0[11] = 0
            f2_local0[12] = 20
            f2_local0[13] = 0
            f2_local0[16] = 30
            f2_local0[21] = 0
            f2_local0[22] = 0
            f2_local0[25] = 0
            if f2_local3 <= 7 then
                f2_local0[16] = 0
            end
        elseif f2_local3 >= 2.3 then
            f2_local0[1] = 1
            f2_local0[2] = 30
            f2_local0[3] = 0
            f2_local0[4] = 0
            f2_local0[9] = 0
            f2_local0[11] = 0
            f2_local0[12] = 40
            f2_local0[13] = 20
            f2_local0[21] = 10
            f2_local0[22] = 0
        else
            f2_local0[1] = 25
            f2_local0[2] = 0
            f2_local0[3] = 0
            f2_local0[4] = 15
            f2_local0[9] = 0
            f2_local0[11] = 20
            f2_local0[12] = 0
            f2_local0[13] = 20
            f2_local0[21] = 0
            f2_local0[22] = 20
            if f2_local3 >= 1.8 then
                f2_local0[11] = 0
            end
            if f2_local3 <= 0.8 then
                f2_local0[22] = 0
            end
        end
    elseif f2_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 90) then
        if f2_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) then
            f2_local0[1] = 1
            f2_local0[5] = 90
            f2_local0[11] = 0
            f2_local0[20] = 10
        else
            f2_local0[1] = 1
            f2_local0[6] = 90
            f2_local0[11] = 0
            f2_local0[20] = 10
        end
    elseif f2_local3 >= 5.3 then
        f2_local0[1] = 1
        f2_local0[2] = 0
        f2_local0[3] = 36
        f2_local0[4] = 36
        f2_local0[9] = 0
        f2_local0[11] = 0
        f2_local0[12] = 0
        f2_local0[13] = 0
        f2_local0[15] = 27
        f2_local0[21] = 0
        f2_local0[22] = 0
        f2_local0[25] = 10
        if f2_local3 <= 10 then
            f2_local0[25] = 0
        end
    elseif f2_local3 >= 2.3 then
        f2_local0[1] = 5
        f2_local0[2] = 25
        f2_local0[3] = 0
        f2_local0[4] = 20
        f2_local0[9] = 0
        f2_local0[11] = 0
        f2_local0[12] = 0
        f2_local0[13] = 20
        f2_local0[14] = 20
        f2_local0[21] = 0
        f2_local0[22] = 0
    else
        f2_local0[1] = 5
        f2_local0[2] = 0
        f2_local0[3] = 0
        f2_local0[4] = 30
        f2_local0[9] = 0
        f2_local0[11] = 0
        f2_local0[12] = 0
        f2_local0[13] = 45
        f2_local0[14] = 20
        f2_local0[21] = 0
        f2_local0[22] = 0
    end
    f2_local0[1] = SetCoolTime(f2_arg1, f2_arg2, 3000, 9, f2_local0[1], 1) -- 挥剑1 
    f2_local0[2] = SetCoolTime(f2_arg1, f2_arg2, 3004, 6, f2_local0[2], 0) -- 前刺 
    f2_local0[3] = SetCoolTime(f2_arg1, f2_arg2, 3008, 6, f2_local0[3], 0) -- 向前跑逼近并下劈
    f2_local0[4] = SetCoolTime(f2_arg1, f2_arg2, 3010, 25, f2_local0[4], 0) -- 举剑（Combo连招起手式，没有任何攻击判定）
    f2_local0[4] = SetCoolTime(f2_arg1, f2_arg2, 3036, 25, f2_local0[4], 0) -- 这个动画不存在，而且和上面那个重复了f2_local0的下标，似乎有别的作用
    f2_local0[5] = SetCoolTime(f2_arg1, f2_arg2, 3015, 6, f2_local0[5], 0) -- 回旋挥剑，似乎是应对玩家在身后的情况，动画表现和挥剑1差不多，但是添加了回身的动作
    f2_local0[6] = SetCoolTime(f2_arg1, f2_arg2, 3016, 6, f2_local0[6], 0) -- 回旋挥剑2，似乎是应对玩家在身后的情况，动画表现和挥剑1差不多，但是添加了回身的动作
    f2_local0[10] = SetCoolTime(f2_arg1, f2_arg2, 3030, 45, f2_local0[10], 1) -- 体内爆出黑暗之魂，这个动作我没记错的话，是2阶段到3阶段必定释放的转阶段标志招式（210帧，第110帧爆炸判定出现）
    f2_local0[10] = SetCoolTime(f2_arg1, f2_arg2, 3031, 45, f2_local0[10], 1) -- 也是爆出黑暗之魂，和上面那个有一点动作上的不一样，而且整体动画时间更少（170帧，第90帧爆炸判定出现）
    f2_local0[11] = SetCoolTime(f2_arg1, f2_arg2, 3022, 15, f2_local0[11], 0) -- 掏出连弩，边后退边射箭
    f2_local0[12] = SetCoolTime(f2_arg1, f2_arg2, 3028, 25, f2_local0[12], 0) -- 3重白教光环，祷告招式
    f2_local0[13] = SetCoolTime(f2_arg1, f2_arg2, 3007, 6, f2_local0[13], 0) -- 原地下劈，但是和3006的原地下劈不同，这个更快一点（这个100帧，上一个102帧；这个剑的碰撞开启时间是第35帧，上面那个是33帧），没太看懂这个动画的用意，但是确实从发力感觉上不太一样。找到区别了，这个3007是会有后续Combo的，也就是它会加SE，而3006不会
    f2_local0[14] = SetCoolTime(f2_arg1, f2_arg2, 3031, 60, f2_local0[14], 1) -- 同上，没看懂这个动画的用意（怀疑是屎山代码的遗留）
    f2_local0[14] = SetCoolTime(f2_arg1, f2_arg2, 3030, 60, f2_local0[14], 1) -- 同上
    f2_local0[15] = SetCoolTime(f2_arg1, f2_arg2, 3024, 20, f2_local0[15], 0) -- 向左短暂起飞并接近挥砍向玩家，一个很帅气的动作，3阶段独有
    f2_local0[16] = SetCoolTime(f2_arg1, f2_arg2, 3026, 20, f2_local0[16], 0) -- 举起连弩，缓步前进，边走边射击
    f2_local0[25] = SetCoolTime(f2_arg1, f2_arg2, 3036, 30, f2_local0[25], 1) -- 这个动画不存在，而且和上面那个重复了f2_local0的下标，似乎有别的作用
    f2_local1[1] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act01) -- 3000是挥剑1（从左往右），3001是挥剑2（从右往左），3002是前刺，这3个动作我没记错的话是盖尔最常见的3段连击
    f2_local1[2] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act02) -- 3004是前刺，3005是把刺/劈下到地上的剑向上拔出来造成伤害，3006是原地下劈
    f2_local1[3] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act03) -- 3008是向前跑逼近并下劈，3009是接着下劈的力，在旋转跳到空中并快速再次下劈
    f2_local1[4] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act04) -- 3010是举剑（Combo连招起手式，没有任何攻击判定），3036是这个动画不存在，而且和上面那个重复了f2_local0的下标，似乎有别的作用
    f2_local1[5] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act05) -- 3015是回旋挥剑，3001是挥剑1（从左往右），3000和这个动作其实基本上一模一样，3001就是挥剑2
    f2_local1[6] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act06) -- 3016就是从右向左的回旋挥剑
    f2_local1[7] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act07) -- 这个动画确实有，但我记得在实际游戏中，盖尔从来没有做过这个动画，应该是废案
    f2_local1[8] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act08) -- 这个是边向前跑边射箭，也没有印象，应该也是废案，而且连连弩的模型都没有做在这个动画里，基本实锤废案了
    f2_local1[9] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act09) -- 同样废案，似乎是一个祷告法术，但是从来没在正是游戏里出现过
    f2_local1[10] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act10) -- 3030是体内爆出黑暗之魂，3031是同样爆出黑暗之魂，但是动作上有点不一样，而且整体动画时间更少（170帧，第90帧爆炸判定出现）
    f2_local1[11] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act11) -- 3022是掏出连弩，边后退边射箭
    f2_local1[12] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act12) -- 3028是3重白教光环，祷告招式
    f2_local1[13] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act13) -- 3007是原地下劈，3006是同样原地下劈，但是动作上有点不一样，而且整体动画时间更少（100帧，第35帧碰撞开启），没太看懂这个动画的用意，但是确实从发力感觉上不太一样
    f2_local1[14] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act14) -- 同上
    f2_local1[15] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act15) -- 3024是向左短暂起飞并接近挥砍向玩家，一个很帅气的动作，3阶段独有
    f2_local1[16] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act16) -- 掏出连弩的动画，只有掏出来这个动作，应该是和3026向呼应的
    f2_local1[20] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act20) -- 转身
    f2_local1[21] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act21) 
    f2_local1[22] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act22)
    f2_local1[23] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act23)
    f2_local1[24] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act24)
    f2_local1[25] = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_Act25)
    local f2_local9 = REGIST_FUNC(f2_arg1, f2_arg2, YUPA620000_ActAfter_AdjustSpace)
    Common_Battle_Activate(f2_arg1, f2_arg2, f2_local0, f2_local1, f2_local9, f2_local2)
    
end

function YUPA620000_Act01(f3_arg0, f3_arg1, f3_arg2)
    local f3_local0 = 2.5
    local f3_local1 = 2.5 + 8
    local f3_local2 = 2.5 + 8
    local f3_local3 = 0
    local f3_local4 = 0
    local f3_local5 = 1.5
    local f3_local6 = 3
    if f3_arg0:HasSpecialEffectId(TARGET_SELF, 16206) == true then
        f3_local1 = 0
        f3_local2 = 0
        f3_local3 = 0
    end
    Approach_Act_Flex(f3_arg0, f3_arg1, f3_local0, f3_local1, f3_local2, f3_local3, f3_local4, f3_local5, f3_local6)
    local f3_local7 = 3000
    local f3_local8 = 3001
    local f3_local9 = 3002
    local f3_local10 = 999
    local f3_local11 = 0
    local f3_local12 = 0
    local f3_local13 = f3_arg0:GetRandam_Int(1, 100)
    local f3_local14 = 4.1
    local f3_local15 = 4.2 + 1
    if f3_local13 <= 30 and f3_arg0:HasSpecialEffectId(TARGET_SELF, 16207) == false then
        f3_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, f3_local7, TARGET_ENE_0, f3_local14, f3_local11, f3_local12, 0, 0)
    else
        f3_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, f3_local7, TARGET_ENE_0, f3_local14, f3_local11, f3_local12, 0, 0)
        f3_arg1:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f3_local8, TARGET_ENE_0, 999, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act02(f4_arg0, f4_arg1, f4_arg2)
    local f4_local0 = 4.2
    local f4_local1 = 4.2 + 8
    local f4_local2 = 4.2 + 8
    local f4_local3 = 0
    local f4_local4 = 0
    local f4_local5 = 1.5
    local f4_local6 = 3
    if f4_arg0:HasSpecialEffectId(TARGET_SELF, 16206) == true then
        f4_local1 = 0
        f4_local2 = 0
        f4_local3 = 0
    end
    Approach_Act_Flex(f4_arg0, f4_arg1, f4_local0, f4_local1, f4_local2, f4_local3, f4_local4, f4_local5, f4_local6)
    local f4_local7 = 3004
    local f4_local8 = 3005
    local f4_local9 = 3006
    local f4_local10 = 999
    local f4_local11 = 0
    local f4_local12 = 0
    local f4_local13 = f4_arg0:GetRandam_Int(1, 100)
    local f4_local14 = 4.2 + 2
    local f4_local15 = 3.41 + 2
    f4_arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3004, TARGET_ENE_0, 20, f4_local11, f4_local12, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act03(f5_arg0, f5_arg1, f5_arg2)
    local f5_local0 = 6.79
    local f5_local1 = 6.79 + 8
    local f5_local2 = 6.79 + 8
    local f5_local3 = 0
    local f5_local4 = 0
    local f5_local5 = 1.5
    local f5_local6 = 3
    if f5_arg0:HasSpecialEffectId(TARGET_SELF, 16206) == true then
        f5_local1 = 0
        f5_local2 = 0
        f5_local3 = 0
    end
    Approach_Act_Flex(f5_arg0, f5_arg1, f5_local0, f5_local1, f5_local2, f5_local3, f5_local4, f5_local5, f5_local6)
    local f5_local7 = 3008
    local f5_local8 = 3009
    local f5_local9 = 999
    local f5_local10 = 0
    local f5_local11 = 0
    local f5_local12 = f5_arg0:GetRandam_Int(1, 100)
    local f5_local13 = 8.48 + 2
    f5_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, f5_local7, TARGET_ENE_0, 999, f5_local10, f5_local11, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act04(f6_arg0, f6_arg1, f6_arg2)
    local f6_local0 = 3010
    local f6_local1 = 999
    local f6_local2 = 0
    local f6_local3 = 0
    local f6_local4 = f6_arg0:GetRandam_Int(1, 100)
    local f6_local5 = 999
    f6_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, f6_local0, TARGET_ENE_0, f6_local5, f6_local2, f6_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act05(f7_arg0, f7_arg1, f7_arg2)
    local f7_local0 = 3015
    local f7_local1 = 3001
    local f7_local2 = 999
    local f7_local3 = 0
    local f7_local4 = 0
    local f7_local5 = f7_arg0:GetRandam_Int(1, 100)
    local f7_local6 = 4.1
    local f7_local7 = 4.2 + 2
    if f7_local5 <= 30 then
        f7_arg1:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f7_local0, TARGET_ENE_0, f7_local2, f7_local3, f7_local4, 0, 0)
    else
        f7_arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, f7_local0, TARGET_ENE_0, f7_local6, f7_local3, f7_local4, 0, 0)
        f7_arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, f7_local1, TARGET_ENE_0, 12, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act06(f8_arg0, f8_arg1, f8_arg2)
    local f8_local0 = 3016
    local f8_local1 = 999
    local f8_local2 = 0
    local f8_local3 = 0
    local f8_local4 = f8_arg0:GetRandam_Int(1, 100)
    f8_arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, f8_local0, TARGET_ENE_0, f8_local1, f8_local2, f8_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act07(f9_arg0, f9_arg1, f9_arg2)
    local f9_local0 = 3020
    local f9_local1 = 999
    local f9_local2 = 0
    local f9_local3 = 0
    local f9_local4 = f9_arg0:GetRandam_Int(1, 100)
    f9_arg1:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f9_local0, TARGET_ENE_0, f9_local1, f9_local2, f9_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act08(f10_arg0, f10_arg1, f10_arg2)
    local f10_local0 = 3021
    local f10_local1 = 999
    local f10_local2 = 0
    local f10_local3 = 0
    local f10_local4 = f10_arg0:GetRandam_Int(1, 100)
    f10_arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, f10_local0, TARGET_ENE_0, 999, f10_local2, f10_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act09(f11_arg0, f11_arg1, f11_arg2)
    local f11_local0 = 20
    local f11_local1 = 30
    local f11_local2 = 30
    local f11_local3 = 0
    local f11_local4 = 0
    local f11_local5 = 1.5
    local f11_local6 = 3
    Approach_Act_Flex(f11_arg0, f11_arg1, f11_local0, f11_local1, f11_local2, f11_local3, f11_local4, f11_local5, f11_local6)
    local f11_local7 = 3029
    local f11_local8 = 999
    local f11_local9 = 0
    local f11_local10 = 0
    local f11_local11 = f11_arg0:GetRandam_Int(1, 100)
    f11_arg1:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 4, f11_local7, TARGET_ENE_0, f11_local8, f11_local9, f11_local10, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act10(f12_arg0, f12_arg1, f12_arg2)
    local f12_local0 = 3030
    local f12_local1 = 999
    local f12_local2 = 0
    local f12_local3 = 0
    local f12_local4 = f12_arg0:GetRandam_Int(1, 100)
    f12_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 2, 3030, TARGET_ENE_0, 999, f12_local2, f12_local3, 0, 0):SetLifeEndSuccess(true)
    f12_arg1:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3024, TARGET_ENE_0, 999, 0, 0)
    f12_arg1:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3001, TARGET_ENE_0, 999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act11(f13_arg0, f13_arg1, f13_arg2)
    local f13_local0 = 3022
    local f13_local1 = 999
    local f13_local2 = 0
    local f13_local3 = 0
    local f13_local4 = f13_arg0:GetRandam_Int(1, 100)
    f13_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3022, TARGET_ENE_0, 999, 0, 0, 0, 0)
    f13_arg1:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3008, TARGET_ENE_0, 999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act12(f14_arg0, f14_arg1, f14_arg2)
    local f14_local0 = 30
    local f14_local1 = 99
    local f14_local2 = 99
    local f14_local3 = 0
    local f14_local4 = 0
    local f14_local5 = 1.5
    local f14_local6 = 3
    Approach_Act_Flex(f14_arg0, f14_arg1, f14_local0, f14_local1, f14_local2, f14_local3, f14_local4, f14_local5, f14_local6)
    local f14_local7 = 3028
    local f14_local8 = 999
    local f14_local9 = 0
    local f14_local10 = 0
    local f14_local11 = f14_arg0:GetRandam_Int(1, 100)
    local f14_local12 = f14_arg0:GetDist(TARGET_ENE_0)
    f14_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, f14_local7, TARGET_ENE_0, 999, 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act13(f15_arg0, f15_arg1, f15_arg2)
    local f15_local0 = 2.5
    local f15_local1 = 2.5 + 8
    local f15_local2 = 2.5 + 8
    local f15_local3 = 0
    local f15_local4 = 0
    local f15_local5 = 1.5
    local f15_local6 = 3
    Approach_Act_Flex(f15_arg0, f15_arg1, f15_local0, f15_local1, f15_local2, f15_local3, f15_local4, f15_local5, f15_local6)
    local f15_local7 = 3007
    local f15_local8 = 999
    local f15_local9 = 0
    local f15_local10 = 0
    local f15_local11 = f15_arg0:GetRandam_Int(1, 100)
    local f15_local12 = 8.48 + 2
    f15_arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, f15_local7, TARGET_ENE_0, f15_local12, f15_local9, f15_local10, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act14(f16_arg0, f16_arg1, f16_arg2)
    local f16_local0 = 3030
    local f16_local1 = 999
    local f16_local2 = 0
    local f16_local3 = 0
    local f16_local4 = f16_arg0:GetRandam_Int(1, 100)
    f16_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 2, f16_local0, TARGET_ENE_0, 999, 0, 0, 0, 0):SetLifeEndSuccess(true)
    f16_arg1:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3024, TARGET_ENE_0, 999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act15(f17_arg0, f17_arg1, f17_arg2)
    local f17_local0 = 20
    local f17_local1 = 28
    local f17_local2 = 28
    local f17_local3 = 0
    local f17_local4 = 0
    local f17_local5 = 1.5
    local f17_local6 = 3
    Approach_Act_Flex(f17_arg0, f17_arg1, f17_local0, f17_local1, f17_local2, f17_local3, f17_local4, f17_local5, f17_local6)
    local f17_local7 = 3024
    local f17_local8 = 999
    local f17_local9 = 0
    local f17_local10 = 0
    local f17_local11 = f17_arg0:GetRandam_Int(1, 100)
    f17_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3024, TARGET_ENE_0, 999, 0, 0)
    f17_arg1:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3001, TARGET_ENE_0, 999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act16(f18_arg0, f18_arg1, f18_arg2)
    local f18_local0 = 3025
    local f18_local1 = 999
    local f18_local2 = 0
    local f18_local3 = 0
    local f18_local4 = f18_arg0:GetRandam_Int(1, 100)
    f18_arg0:SetNumber(1, 0)
    f18_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3025, TARGET_ENE_0, 999, 0, 0)
    f18_arg1:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3026, TARGET_ENE_0, 30, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function YUPA620000_Act20(f19_arg0, f19_arg1, f19_arg2)
    f19_arg1:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 90)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function YUPA620000_Act21(f20_arg0, f20_arg1, f20_arg2)
    local f20_local0 = f20_arg0:GetRandam_Int(1, 100)
    local f20_local1 = f20_arg0:GetDist(TARGET_ENE_0)
    if f20_local1 >= 10 then
        if f20_local0 <= 50 then
            f20_arg1:AddSubGoal(GOAL_COMMON_SidewayMove, 2, TARGET_ENE_0, 0, 60, true, true, 0)
        else
            f20_arg1:AddSubGoal(GOAL_COMMON_SidewayMove, 2, TARGET_ENE_0, 1, 60, true, true, 0)
        end
    elseif f20_local0 <= 50 then
        f20_arg1:AddSubGoal(GOAL_COMMON_SidewayMove, 1.4, TARGET_ENE_0, 0, 60, true, true, 0)
    else
        f20_arg1:AddSubGoal(GOAL_COMMON_SidewayMove, 1.4, TARGET_ENE_0, 1, 60, true, true, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function YUPA620000_Act22(f21_arg0, f21_arg1, f21_arg2)
    f21_arg1:AddSubGoal(GOAL_COMMON_LeaveTarget, 1.5, TARGET_ENE_0, 3.5, TARGET_ENE_0, true, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function YUPA620000_Act23(f22_arg0, f22_arg1, f22_arg2)
    f22_arg1:AddSubGoal(GOAL_COMMON_Wait, f22_arg0:GetRandam_Float(0.5, 1), TARGET_ENE_0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function YUPA620000_Act24(f23_arg0, f23_arg1, f23_arg2)
    f23_arg0:SetNumber(0, 1)
    f23_arg1:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_NONE)
    f23_arg1:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, 3, TARGET_SELF, true, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function YUPA620000_Act25(f24_arg0, f24_arg1, f24_arg2)
    f24_arg1:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3035, TARGET_ENE_0, 999, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

Goal.Update = function (f25_arg0, f25_arg1, f25_arg2)
    return Update_Default_NoSubGoal(f25_arg0, f25_arg1, f25_arg2)
    
end

Goal.Terminate = function (f26_arg0, f26_arg1, f26_arg2)
    
end

Goal.Interrupt = function (f27_arg0, f27_arg1, f27_arg2)
    local f27_local0 = f27_arg1:GetRandam_Int(1, 100)
    local f27_local1 = f27_arg1:GetRandam_Int(1, 100)
    local f27_local2 = f27_arg1:GetDist(TARGET_ENE_0)
    f27_arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025) -- 挥剑2和3016回身斩会加入的SE 5025
    if f27_arg1:GetSpecialEffectActivateInterruptType(0) == 5025 and f27_local2 >= 1 and f27_local2 < 5.2 and f27_local0 <= 70 then
        f27_arg2:ClearSubGoal()
        f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3002, TARGET_ENE_0, 999, 0, 0)
    end
    f27_arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026) -- 没找到，估计都是废案 
    if f27_arg1:GetSpecialEffectActivateInterruptType(0) == 5026 and f27_local0 <= 60 and f27_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 240) then
        f27_arg2:ClearSubGoal()
        f27_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, 999, 0, 0) -- 3013也是从右向左回身斩，但是这个动画的开始是剑已经在地上了，所以应该是接
    end
    f27_arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027) -- 3008里加入的SE 5027
    if f27_arg1:GetSpecialEffectActivateInterruptType(0) == 5027 then
        if not f27_arg1:HasSpecialEffectId(TARGET_SELF, 16207) then
            if f27_local0 <= 80 then
                if f27_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 240) and f27_local2 <= 3 and f27_local0 <= 50 then
                    f27_arg2:ClearSubGoal()
                    f27_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, 999, 0, 0)
                elseif f27_local2 <= 3 then
                    f27_arg2:ClearSubGoal()
                    f27_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 999, 0, 0)
                end
            end
        elseif f27_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 240) and f27_local2 <= 3 and f27_local0 <= 50 and f27_arg1:HasSpecialEffectId(TARGET_SELF, 16207) then
            f27_arg2:ClearSubGoal()
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3013, TARGET_ENE_0, 999, 0, 0)
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, 999, 0, 0)
        elseif f27_local2 <= 15 then
            f27_arg2:ClearSubGoal()
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3009, TARGET_ENE_0, 999, 0, 0)
        end
    end
    f27_arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 5028) -- 3007里加入的SE 5028
    if f27_arg1:GetSpecialEffectActivateInterruptType(0) == 5028 then
        if f27_local2 <= 3.5 and f27_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 180) and not f27_arg1:HasSpecialEffectId(TARGET_SELF, 16207) and f27_local0 <= 60 then
            f27_arg2:ClearSubGoal()
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3005, TARGET_ENE_0, 5, 0, 0)
        elseif f27_local2 <= 10 and f27_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 180) and f27_arg1:HasSpecialEffectId(TARGET_SELF, 16207) and f27_local0 <= 60 then
            f27_arg2:ClearSubGoal()
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3018, TARGET_ENE_0, 999, 0, 0) -- 腾飞一小会的旋转下劈，和3009差不多，但是这个腾飞的感觉很明显
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3009, TARGET_ENE_0, 999, 0, 0)
        elseif f27_local2 <= 10 and f27_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 180) and f27_arg1:HasSpecialEffectId(TARGET_SELF, 16207) and f27_local0 <= 80 then
            f27_arg2:ClearSubGoal()
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3009, TARGET_ENE_0, 999, 0, 0)
        elseif f27_local2 <= 5 and f27_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) and f27_arg1:HasSpecialEffectId(TARGET_SELF, 16207) and f27_local1 <= 30 then
            f27_arg2:ClearSubGoal()
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, 5, 0, 0)
        elseif f27_local2 <= 5 and f27_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) and f27_arg1:HasSpecialEffectId(TARGET_SELF, 16207) and f27_local1 <= 60 then
            f27_arg2:ClearSubGoal()
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3013, TARGET_ENE_0, 5, 0, 0)
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, 999, 0, 0)
        end
    end
    f27_arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029) -- 3010（举剑）里加入的SE 5029
    if f27_arg1:GetSpecialEffectActivateInterruptType(0) == 5029 then
        if f27_arg1:HasSpecialEffectId(TARGET_SELF, 16207) == false then
            if f27_local2 < 5 then
                f27_arg2:ClearSubGoal()
                f27_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3011, TARGET_ENE_0, 999, 0, 0) -- 原地旋转劈砍
            else
                f27_arg2:ClearSubGoal()
                f27_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3012, TARGET_ENE_0, 999, 0, 0) -- 向前飞起并从空中刺向玩家
            end
        elseif f27_local2 < 5 then
            f27_arg2:ClearSubGoal()
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3033, TARGET_ENE_0, 999, 0, 0) -- 这个动画应该不存在
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3014, TARGET_ENE_0, 999, 0, 0) -- 飞起来旋转劈砍向玩家
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3017, TARGET_ENE_0, 12, 0, 0) -- 后退腾空并刺向玩家，是一个投技，这招和1阶段里的投技动作非常像，应该就是引导玩家意识到这是投技
            f27_arg2:AddSubGoal(GOAL_COMMON_LeaveTarget, 1.5, TARGET_ENE_0, 3.5, TARGET_ENE_0, true, 0)
        else
            f27_arg2:ClearSubGoal()
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3032, TARGET_ENE_0, 999, 0, 0) -- 不存在
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3034, TARGET_ENE_0, 999, 0, 0) -- 不存在
            f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3017, TARGET_ENE_0, 12, 0, 0)
            f27_arg2:AddSubGoal(GOAL_COMMON_LeaveTarget, 1.5, TARGET_ENE_0, 3.5, TARGET_ENE_0, true, 0)
        end
    end
    f27_arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 5030) -- 3004里加入的SE 5030
    if f27_arg1:GetSpecialEffectActivateInterruptType(0) == 5030 and f27_local2 <= 3.5 and f27_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 120) and f27_local0 <= 80 then
        f27_arg2:ClearSubGoal()
        f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3005, TARGET_ENE_0, 999, 0, 0)
    end
    f27_arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 5031) --没找到
    if f27_arg1:GetSpecialEffectActivateInterruptType(0) == 5031 and f27_local2 <= 6 then
        f27_arg2:ClearSubGoal()
        f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3002, TARGET_ENE_0, 999, 0, 0)
    end
    f27_arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 5032) -- 没找到，果然，我就说我怎么没见过盖尔这样用连弩，就是废案
    if f27_arg1:GetSpecialEffectActivateInterruptType(0) == 5032 and f27_local2 >= 7 then
        f27_arg2:ClearSubGoal()
        f27_arg1:SetNumber(1, 0)
        f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3025, TARGET_ENE_0, 999, 0, 0)
        f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3026, TARGET_ENE_0, 999, 0, 0)
    end
    f27_arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 5033) -- 3000里加入的SE 5033
    if f27_arg1:GetSpecialEffectActivateInterruptType(0) == 5033 and f27_local2 >= 3.5 and f27_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 180) and f27_arg1:HasSpecialEffectId(TARGET_SELF, 16207) == false then
        f27_arg2:ClearSubGoal()
        f27_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, 999, 0, 0)
    end
    f27_arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 5034) -- 3005里加入的SE 5034
    if f27_arg1:GetSpecialEffectActivateInterruptType(0) == 5034 and f27_local2 <= 3 and not f27_arg1:HasSpecialEffectAttribute(TARGET_ENE_0, SP_EFFECT_TYPE_TARGET_DOWN) and f27_arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 30) then
        f27_arg2:ClearSubGoal()
        f27_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, 12, 0, 0)
    end
    f27_arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 5050) -- 也没找到，估计都是废案，能看到有些技能动画里有叫Track X的轨道，但是什么也没填
    if f27_arg1:GetSpecialEffectActivateInterruptType(0) == 5050 then
        f27_arg2:ClearSubGoal()
        if f27_arg1:GetHpRate(TARGET_SELF) > 0 and f27_arg1:IsInsideMsbRegion(TARGET_ENE_0, AI_DIR_TYPE_F, 0, 5112820) == false and f27_arg1:IsInsideMsbRegion(TARGET_ENE_0, AI_DIR_TYPE_F, 0, 5112822) == false then
            f27_arg2:AddSubGoal(GOAL_COMMON_ToTargetWarp, 10, TARGET_ENE_0, AI_DIR_TYPE_F, 0, TARGET_ENE_0, 0, 0)
        end
        f27_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3036, TARGET_ENE_0, 999, 0, 0)
    end
    if f27_arg1:IsInterupt(INTERUPT_Shoot) and f27_local2 >= 8 then
        f27_arg2:AddSubGoal(GOAL_COMMON_ApproachTarget, 2, TARGET_ENE_0, 3, TARGET_SELF, false, 0)
    end
    
end

function YUPA620000_ActAfter_AdjustSpace(f28_arg0, f28_arg1, f28_arg2)
    f28_arg1:AddSubGoal(GOAL_YUPA620000_Battle_AfterAttackAct, 10)
    
end

RegisterTableGoal(GOAL_YUPA620000_Battle_AfterAttackAct, "GOAL_YUPA620000_Battle_AfterAttackAct")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_YUPA620000_Battle_AfterAttackAct, true)

Goal.Activate = function (f29_arg0, f29_arg1, f29_arg2)
    local f29_local0 = f29_arg1:GetDist(TARGET_ENE_0)
    local f29_local1 = f29_arg1:GetRandam_Int(1, 100)
    
end

Goal.Update = function (f30_arg0, f30_arg1, f30_arg2)
    return Update_Default_NoSubGoal(f30_arg0, f30_arg1, f30_arg2)
    
end


