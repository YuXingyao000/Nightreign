-- Function ID = 0
-- basicblock_1
RegisterTableGoal(GOAL_KingOfRubble761000_Battle, "KingOfRubble761000_Battle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_KingOfRubble761000_Battle, true)

Goal.Initialize = function (f1_arg0, f1_arg1, f1_arg2, f1_arg3)
    -- Function ID = 1
    -- basicblock_1
    f1_arg1:EnableUnfavorableAttackCheck(0, 3000)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3001)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3002)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3003)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3005)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3006)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3007)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3010)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3012)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3013)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3017)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3026)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3027)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3028)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3029)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3030)
    f1_arg1:EnableUnfavorableAttackCheck(0, 3031)
    
end

Goal.Activate = function (f2_arg0, f2_arg1, f2_arg2)
    -- Function ID = 2
    -- basicblock_1
    local f2_local0 = {}
    local f2_local1 = {}
    local f2_local2 = {}
    Common_Clear_Param(f2_local0, f2_local1, f2_local2)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5030)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5031)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5032)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5033)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5034)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5035)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5036)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5037)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5038)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 60555)
    f2_arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 60556)
    f2_arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 60592)
    local f2_local3 = f2_arg1:GetDist(TARGET_ENE_0)
    local f2_local4 = f2_arg1:GetDistY(TARGET_ENE_0)
    local f2_local5 = f2_arg1:GetHpRate(TARGET_SELF)
    local f2_local6 = f2_arg1:GetRandam_Int(1, 100)
    local f2_local7 = f2_arg1:GetDist(TARGET_FRI_0)
    local f2_local8 = f2_arg1:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    if f2_arg1:HasSpecialEffectId(TARGET_SELF, 60545) == true then
        -- basicblock_2
        if f2_arg1:HasSpecialEffectId(TARGET_SELF, 60566) == true then
            -- basicblock_3
            if f2_local3 > 12.5 then
                -- basicblock_4
                f2_local0[16] = 100
            else
                -- basicblock_5
                f2_local0[17] = 100
            end
        -- basicblock_6
        elseif f2_arg1:GetHpRate(TARGET_SELF) < 0.2 and f2_arg1:HasSpecialEffectId(TARGET_SELF, 60585) == false then
            -- basicblock_8
            f2_local0[18] = 100
        -- basicblock_9
        elseif f2_arg1:HasSpecialEffectId(TARGET_SELF, 60553) == true then
            -- basicblock_10
            f2_local0[38] = 100
        -- basicblock_11
        elseif f2_arg1:HasSpecialEffectId(TARGET_SELF, 60551) == true then
            -- basicblock_12
            if f2_arg1:HasSpecialEffectId(TARGET_SELF, 60565) == true then
                -- basicblock_13
                if f2_arg1:HasSpecialEffectId(TARGET_SELF, 60567) == true then
                    -- basicblock_14
                    if f2_local3 > 10 then
                        -- basicblock_15
                        f2_local0[30] = 0
                        f2_local0[31] = 100
                        f2_local0[32] = 0
                        f2_local0[13] = 0
                    else
                        -- basicblock_16
                        f2_local0[30] = 0
                        f2_local0[31] = 100
                        f2_local0[32] = 0
                        f2_local0[13] = 0
                    end
                else
                    -- basicblock_17
                    f2_local0[30] = 0
                    f2_local0[31] = 0
                    f2_local0[32] = 100
                    f2_local0[13] = 0
                end
            else
                -- basicblock_18
                f2_local0[30] = 100
                f2_local0[31] = 0
                f2_local0[32] = 0
                f2_local0[13] = 0
            end
        -- basicblock_19
        elseif f2_local3 > 30 then
            -- basicblock_20
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_21
                f2_local0[15] = 0
                f2_local0[20] = 50
                f2_local0[21] = 100
                f2_local0[22] = 100
                f2_local0[23] = 0
                f2_local0[24] = 0
                f2_local0[35] = 0
                f2_local0[36] = 0
                f2_local0[37] = 0
                f2_local0[40] = 50
            else
                -- basicblock_22
                f2_local0[15] = 0
                f2_local0[20] = 0
                f2_local0[21] = 0
                f2_local0[22] = 0
                f2_local0[23] = 0
                f2_local0[24] = 0
                f2_local0[35] = 0
                f2_local0[36] = 0
                f2_local0[37] = 0
                f2_local0[40] = 100
                f2_local0[45] = 100
            end
        -- basicblock_23
        elseif f2_local3 > 20 then
            -- basicblock_24
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_25
                f2_local0[15] = 200
                f2_local0[20] = 50
                f2_local0[21] = 100
                f2_local0[22] = 100
                f2_local0[23] = 0
                f2_local0[24] = 0
                f2_local0[35] = 0
                f2_local0[36] = 200
                f2_local0[37] = 200
                f2_local0[40] = 50
            else
                -- basicblock_26
                f2_local0[15] = 0
                f2_local0[20] = 0
                f2_local0[21] = 0
                f2_local0[22] = 0
                f2_local0[23] = 0
                f2_local0[24] = 0
                f2_local0[35] = 0
                f2_local0[36] = 0
                f2_local0[37] = 0
                f2_local0[40] = 100
                f2_local0[45] = 100
            end
        -- basicblock_27
        elseif f2_local3 > 10 then
            -- basicblock_28
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_29
                f2_local0[15] = 200
                f2_local0[20] = 100
                f2_local0[21] = 50
                f2_local0[22] = 50
                f2_local0[23] = 50
                f2_local0[24] = 0
                f2_local0[35] = 100
                f2_local0[36] = 200
                f2_local0[37] = 200
                f2_local0[40] = 50
            else
                -- basicblock_30
                f2_local0[15] = 0
                f2_local0[20] = 0
                f2_local0[21] = 0
                f2_local0[22] = 50
                f2_local0[23] = 0
                f2_local0[24] = 0
                f2_local0[35] = 100
                f2_local0[36] = 0
                f2_local0[37] = 0
                f2_local0[40] = 50
                f2_local0[45] = 100
            end
        -- basicblock_31
        elseif f2_local3 > 5 then
            -- basicblock_32
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_33
                f2_local0[15] = 200
                f2_local0[20] = 50
                f2_local0[21] = 50
                f2_local0[22] = 50
                f2_local0[23] = 100
                f2_local0[24] = 100
                f2_local0[35] = 100
                f2_local0[36] = 200
                f2_local0[37] = 0
                f2_local0[40] = 50
                f2_local0[41] = 50
                f2_local0[42] = 75
                f2_local0[45] = 0
            else
                -- basicblock_34
                f2_local0[15] = 0
                f2_local0[20] = 0
                f2_local0[21] = 0
                f2_local0[22] = 50
                f2_local0[23] = 0
                f2_local0[24] = 0
                f2_local0[35] = 100
                f2_local0[36] = 0
                f2_local0[37] = 0
                f2_local0[40] = 50
                f2_local0[41] = 0
                f2_local0[42] = 50
                f2_local0[45] = 100
            end
        -- basicblock_35
        elseif f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
            -- basicblock_36
            f2_local0[15] = 200
            f2_local0[20] = 25
            f2_local0[21] = 0
            f2_local0[22] = 50
            f2_local0[23] = 100
            f2_local0[24] = 200
            f2_local0[35] = 100
            f2_local0[36] = 200
            f2_local0[37] = 0
            f2_local0[40] = 50
            f2_local0[41] = 75
            f2_local0[42] = 50
            f2_local0[45] = 0
        else
            -- basicblock_37
            f2_local0[15] = 200
            f2_local0[20] = 0
            f2_local0[21] = 50
            f2_local0[22] = 100
            f2_local0[23] = 0
            f2_local0[24] = 0
            f2_local0[35] = 200
            f2_local0[36] = 0
            f2_local0[37] = 0
            f2_local0[40] = 50
            f2_local0[41] = 0
            f2_local0[42] = 50
            f2_local0[45] = 200
        end
    -- basicblock_38
    elseif f2_arg1:HasSpecialEffectId(TARGET_SELF, 60546) == true then
        -- basicblock_39
        if f2_arg1:HasSpecialEffectId(TARGET_SELF, 60566) == true then
            -- basicblock_40
            if f2_local3 > 12.5 then
                -- basicblock_41
                f2_local0[16] = 100
            else
                -- basicblock_42
                f2_local0[17] = 100
            end
        -- basicblock_43
        elseif f2_arg1:GetHpRate(TARGET_SELF) < 0.55 then
            -- basicblock_44
            f2_local0[38] = 100
        -- basicblock_45
        elseif f2_arg1:GetHpRate(TARGET_SELF) < 0.85 then
            -- basicblock_46
            if f2_local3 > 30 then
                -- basicblock_47
                if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                    -- basicblock_48
                    f2_local0[20] = 50
                    f2_local0[21] = 100
                    f2_local0[22] = 100
                    f2_local0[23] = 0
                    f2_local0[24] = 0
                    f2_local0[35] = 0
                    f2_local0[36] = 0
                    f2_local0[37] = 0
                    f2_local0[40] = 50
                else
                    -- basicblock_49
                    f2_local0[20] = 0
                    f2_local0[21] = 0
                    f2_local0[22] = 0
                    f2_local0[23] = 0
                    f2_local0[24] = 0
                    f2_local0[35] = 0
                    f2_local0[37] = 0
                    f2_local0[40] = 100
                    f2_local0[45] = 100
                end
            -- basicblock_50
            elseif f2_local3 > 20 then
                -- basicblock_51
                if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                    -- basicblock_52
                    f2_local0[20] = 50
                    f2_local0[21] = 100
                    f2_local0[22] = 100
                    f2_local0[23] = 0
                    f2_local0[24] = 0
                    f2_local0[35] = 0
                    f2_local0[36] = 200
                    f2_local0[37] = 200
                    f2_local0[40] = 50
                else
                    -- basicblock_53
                    f2_local0[20] = 0
                    f2_local0[21] = 0
                    f2_local0[22] = 0
                    f2_local0[23] = 0
                    f2_local0[24] = 0
                    f2_local0[35] = 0
                    f2_local0[37] = 0
                    f2_local0[40] = 100
                    f2_local0[45] = 100
                end
            -- basicblock_54
            elseif f2_local3 > 10 then
                -- basicblock_55
                if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                    -- basicblock_56
                    f2_local0[20] = 100
                    f2_local0[21] = 50
                    f2_local0[22] = 50
                    f2_local0[23] = 50
                    f2_local0[24] = 0
                    f2_local0[35] = 100
                    f2_local0[36] = 200
                    f2_local0[37] = 200
                    f2_local0[40] = 50
                    f2_local0[42] = 50
                else
                    -- basicblock_57
                    f2_local0[20] = 0
                    f2_local0[21] = 0
                    f2_local0[22] = 50
                    f2_local0[23] = 0
                    f2_local0[24] = 0
                    f2_local0[35] = 100
                    f2_local0[37] = 0
                    f2_local0[40] = 50
                    f2_local0[45] = 100
                end
            -- basicblock_58
            elseif f2_local3 > 5 then
                -- basicblock_59
                if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                    -- basicblock_60
                    f2_local0[20] = 50
                    f2_local0[21] = 50
                    f2_local0[22] = 50
                    f2_local0[23] = 100
                    f2_local0[24] = 100
                    f2_local0[35] = 100
                    f2_local0[36] = 200
                    f2_local0[37] = 0
                    f2_local0[40] = 50
                    f2_local0[41] = 50
                    f2_local0[42] = 75
                    f2_local0[45] = 0
                else
                    -- basicblock_61
                    f2_local0[20] = 0
                    f2_local0[21] = 0
                    f2_local0[22] = 50
                    f2_local0[23] = 0
                    f2_local0[24] = 0
                    f2_local0[35] = 100
                    f2_local0[37] = 0
                    f2_local0[40] = 50
                    f2_local0[41] = 0
                    f2_local0[42] = 50
                    f2_local0[45] = 100
                end
            -- basicblock_62
            elseif f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_63
                f2_local0[20] = 25
                f2_local0[21] = 0
                f2_local0[22] = 50
                f2_local0[23] = 100
                f2_local0[24] = 200
                f2_local0[35] = 100
                f2_local0[36] = 200
                f2_local0[37] = 0
                f2_local0[40] = 50
                f2_local0[41] = 75
                f2_local0[42] = 50
                f2_local0[45] = 0
            else
                -- basicblock_64
                f2_local0[20] = 0
                f2_local0[21] = 50
                f2_local0[22] = 100
                f2_local0[23] = 0
                f2_local0[24] = 0
                f2_local0[35] = 200
                f2_local0[37] = 0
                f2_local0[40] = 50
                f2_local0[41] = 0
                f2_local0[42] = 50
                f2_local0[45] = 200
            end
        -- basicblock_65
        elseif f2_local3 > 30 then
            -- basicblock_66
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_67
                f2_local0[20] = 50
                f2_local0[21] = 100
                f2_local0[22] = 100
                f2_local0[23] = 0
                f2_local0[24] = 0
                f2_local0[35] = 0
                f2_local0[40] = 50
            else
                -- basicblock_68
                f2_local0[20] = 0
                f2_local0[21] = 0
                f2_local0[22] = 0
                f2_local0[23] = 0
                f2_local0[24] = 0
                f2_local0[35] = 0
                f2_local0[40] = 100
                f2_local0[45] = 100
            end
        -- basicblock_69
        elseif f2_local3 > 20 then
            -- basicblock_70
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_71
                f2_local0[20] = 50
                f2_local0[21] = 100
                f2_local0[22] = 100
                f2_local0[23] = 0
                f2_local0[24] = 0
                f2_local0[35] = 0
                f2_local0[40] = 50
            else
                -- basicblock_72
                f2_local0[20] = 0
                f2_local0[21] = 0
                f2_local0[22] = 0
                f2_local0[23] = 0
                f2_local0[24] = 0
                f2_local0[35] = 0
                f2_local0[40] = 100
                f2_local0[45] = 100
            end
        -- basicblock_73
        elseif f2_local3 > 10 then
            -- basicblock_74
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_75
                f2_local0[20] = 100
                f2_local0[21] = 50
                f2_local0[22] = 50
                f2_local0[23] = 50
                f2_local0[24] = 0
                f2_local0[35] = 100
                f2_local0[40] = 50
                f2_local0[42] = 50
            else
                -- basicblock_76
                f2_local0[20] = 0
                f2_local0[21] = 0
                f2_local0[22] = 50
                f2_local0[23] = 0
                f2_local0[24] = 0
                f2_local0[35] = 100
                f2_local0[40] = 50
                f2_local0[45] = 100
            end
        -- basicblock_77
        elseif f2_local3 > 5 then
            -- basicblock_78
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_79
                f2_local0[20] = 50
                f2_local0[21] = 50
                f2_local0[22] = 50
                f2_local0[23] = 100
                f2_local0[24] = 100
                f2_local0[35] = 100
                f2_local0[40] = 50
                f2_local0[41] = 50
                f2_local0[42] = 75
                f2_local0[45] = 0
            else
                -- basicblock_80
                f2_local0[20] = 0
                f2_local0[21] = 0
                f2_local0[22] = 50
                f2_local0[23] = 0
                f2_local0[24] = 0
                f2_local0[35] = 100
                f2_local0[40] = 50
                f2_local0[41] = 0
                f2_local0[42] = 50
                f2_local0[45] = 100
            end
        -- basicblock_81
        elseif f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
            -- basicblock_82
            f2_local0[20] = 25
            f2_local0[21] = 0
            f2_local0[22] = 50
            f2_local0[23] = 100
            f2_local0[24] = 200
            f2_local0[35] = 100
            f2_local0[40] = 50
            f2_local0[41] = 75
            f2_local0[42] = 50
            f2_local0[45] = 0
        else
            -- basicblock_83
            f2_local0[20] = 0
            f2_local0[21] = 50
            f2_local0[22] = 100
            f2_local0[23] = 0
            f2_local0[24] = 0
            f2_local0[35] = 200
            f2_local0[40] = 50
            f2_local0[41] = 0
            f2_local0[42] = 50
            f2_local0[45] = 200
        end
    -- basicblock_84
    elseif f2_arg1:HasSpecialEffectId(TARGET_SELF, 60547) == true then
        -- basicblock_85
        if f2_arg1:HasSpecialEffectId(TARGET_SELF, 60566) == true then
            -- basicblock_86
            if f2_local3 > 12.5 then
                -- basicblock_87
                f2_local0[16] = 100
            else
                -- basicblock_88
                f2_local0[17] = 100
            end
        -- basicblock_89
        elseif f2_arg1:HasSpecialEffectId(TARGET_SELF, 60553) == true then
            -- basicblock_90
            f2_local0[18] = 100
        -- basicblock_91
        elseif f2_arg1:HasSpecialEffectId(TARGET_SELF, 60551) == true then
            -- basicblock_92
            if f2_arg1:HasSpecialEffectId(TARGET_SELF, 60565) == true then
                -- basicblock_93
                if f2_arg1:HasSpecialEffectId(TARGET_SELF, 60567) == true then
                    -- basicblock_94
                    if f2_local3 > 15 then
                        -- basicblock_95
                        f2_local0[11] = 100
                        f2_local0[13] = 300
                    else
                        -- basicblock_96
                        f2_local0[11] = 100
                    end
                else
                    -- basicblock_97
                    f2_local0[12] = 100
                end
            else
                -- basicblock_98
                f2_local0[10] = 100
            end
        -- basicblock_99
        elseif f2_local3 > 30 then
            -- basicblock_100
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_101
                f2_local0[1] = 50
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 0
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 0
                f2_local0[40] = 50
            else
                -- basicblock_102
                f2_local0[1] = 50
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 0
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 0
                f2_local0[40] = 50
            end
        -- basicblock_103
        elseif f2_local3 > 20 then
            -- basicblock_104
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_105
                f2_local0[1] = 50
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 0
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 200
                f2_local0[40] = 50
            else
                -- basicblock_106
                f2_local0[1] = 50
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 0
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 200
                f2_local0[40] = 50
            end
        -- basicblock_107
        elseif f2_local3 > 10 then
            -- basicblock_108
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_109
                f2_local0[1] = 100
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 50
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 200
                f2_local0[40] = 50
            else
                -- basicblock_110
                f2_local0[1] = 100
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 50
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 200
                f2_local0[40] = 50
            end
        -- basicblock_111
        elseif f2_local3 > 5 then
            -- basicblock_112
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_113
                f2_local0[1] = 100
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 50
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 200
                f2_local0[40] = 50
                f2_local0[41] = 0
                f2_local0[42] = 50
            else
                -- basicblock_114
                f2_local0[1] = 100
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 50
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 200
                f2_local0[40] = 50
                f2_local0[41] = 0
                f2_local0[42] = 50
            end
        -- basicblock_115
        elseif f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
            -- basicblock_116
            f2_local0[1] = 50
            f2_local0[2] = 50
            f2_local0[3] = 100
            f2_local0[4] = 50
            f2_local0[5] = 200
            f2_local0[14] = 150
            f2_local0[15] = 200
            f2_local0[40] = 0
            f2_local0[41] = 50
            f2_local0[42] = 0
        else
            -- basicblock_117
            f2_local0[1] = 50
            f2_local0[2] = 50
            f2_local0[3] = 100
            f2_local0[4] = 50
            f2_local0[5] = 200
            f2_local0[14] = 150
            f2_local0[15] = 200
            f2_local0[40] = 0
            f2_local0[41] = 50
            f2_local0[42] = 0
        end
    -- basicblock_118
    elseif f2_arg1:HasSpecialEffectId(TARGET_SELF, 60566) == true then
        -- basicblock_119
        if f2_local3 > 12.5 then
            -- basicblock_120
            f2_local0[16] = 100
        else
            -- basicblock_121
            f2_local0[17] = 100
        end
    -- basicblock_122
    elseif f2_arg1:GetHpRate(TARGET_SELF) < 0.6 and f2_arg1:HasSpecialEffectId(TARGET_SELF, 60520) == false then
        -- basicblock_124
        f2_local0[18] = 100
    -- basicblock_125
    elseif f2_arg1:GetHpRate(TARGET_SELF) < 0.9 then
        -- basicblock_126
        if f2_local3 > 30 then
            -- basicblock_127
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_128
                f2_local0[1] = 50
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 0
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 0
                f2_local0[40] = 50
            else
                -- basicblock_129
                f2_local0[1] = 50
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 0
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 0
                f2_local0[40] = 50
            end
        -- basicblock_130
        elseif f2_local3 > 20 then
            -- basicblock_131
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_132
                f2_local0[1] = 50
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 0
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 200
                f2_local0[40] = 50
            else
                -- basicblock_133
                f2_local0[1] = 50
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 0
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 200
                f2_local0[40] = 50
            end
        -- basicblock_134
        elseif f2_local3 > 10 then
            -- basicblock_135
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_136
                f2_local0[1] = 100
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 50
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 200
                f2_local0[40] = 50
            else
                -- basicblock_137
                f2_local0[1] = 100
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 50
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 200
                f2_local0[40] = 50
            end
        -- basicblock_138
        elseif f2_local3 > 5 then
            -- basicblock_139
            if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
                -- basicblock_140
                f2_local0[1] = 100
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 50
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 200
                f2_local0[40] = 50
                f2_local0[41] = 0
                f2_local0[42] = 50
            else
                -- basicblock_141
                f2_local0[1] = 100
                f2_local0[2] = 100
                f2_local0[3] = 100
                f2_local0[4] = 50
                f2_local0[5] = 0
                f2_local0[14] = 150
                f2_local0[15] = 200
                f2_local0[40] = 50
                f2_local0[41] = 0
                f2_local0[42] = 50
            end
        -- basicblock_142
        elseif f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
            -- basicblock_143
            f2_local0[1] = 50
            f2_local0[2] = 50
            f2_local0[3] = 100
            f2_local0[4] = 50
            f2_local0[5] = 200
            f2_local0[14] = 150
            f2_local0[15] = 200
            f2_local0[40] = 0
            f2_local0[41] = 50
            f2_local0[42] = 0
        else
            -- basicblock_144
            f2_local0[1] = 50
            f2_local0[2] = 50
            f2_local0[3] = 100
            f2_local0[4] = 50
            f2_local0[5] = 200
            f2_local0[14] = 150
            f2_local0[15] = 200
            f2_local0[40] = 0
            f2_local0[41] = 50
            f2_local0[42] = 0
        end
    -- basicblock_145
    elseif f2_local3 > 30 then
        -- basicblock_146
        if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
            -- basicblock_147
            f2_local0[1] = 50
            f2_local0[2] = 100
            f2_local0[3] = 100
            f2_local0[4] = 0
            f2_local0[5] = 0
            f2_local0[40] = 50
        else
            -- basicblock_148
            f2_local0[1] = 50
            f2_local0[2] = 100
            f2_local0[3] = 100
            f2_local0[4] = 0
            f2_local0[5] = 0
            f2_local0[40] = 50
        end
    -- basicblock_149
    elseif f2_local3 > 20 then
        -- basicblock_150
        if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
            -- basicblock_151
            f2_local0[1] = 50
            f2_local0[2] = 100
            f2_local0[3] = 100
            f2_local0[4] = 0
            f2_local0[5] = 0
            f2_local0[40] = 50
        else
            -- basicblock_152
            f2_local0[1] = 50
            f2_local0[2] = 100
            f2_local0[3] = 100
            f2_local0[4] = 0
            f2_local0[5] = 0
            f2_local0[40] = 50
        end
    -- basicblock_153
    elseif f2_local3 > 10 then
        -- basicblock_154
        if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
            -- basicblock_155
            f2_local0[1] = 100
            f2_local0[2] = 100
            f2_local0[3] = 100
            f2_local0[4] = 50
            f2_local0[5] = 0
            f2_local0[40] = 50
        else
            -- basicblock_156
            f2_local0[1] = 100
            f2_local0[2] = 100
            f2_local0[3] = 100
            f2_local0[4] = 50
            f2_local0[5] = 0
            f2_local0[40] = 50
        end
    -- basicblock_157
    elseif f2_local3 > 5 then
        -- basicblock_158
        if f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
            -- basicblock_159
            f2_local0[1] = 100
            f2_local0[2] = 100
            f2_local0[3] = 100
            f2_local0[4] = 50
            f2_local0[5] = 0
            f2_local0[40] = 50
            f2_local0[41] = 0
            f2_local0[42] = 50
        else
            -- basicblock_160
            f2_local0[1] = 100
            f2_local0[2] = 100
            f2_local0[3] = 100
            f2_local0[4] = 50
            f2_local0[5] = 0
            f2_local0[40] = 50
            f2_local0[41] = 0
            f2_local0[42] = 50
        end
    -- basicblock_161
    elseif f2_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 900) then
        -- basicblock_162
        f2_local0[1] = 50
        f2_local0[2] = 50
        f2_local0[3] = 100
        f2_local0[4] = 50
        f2_local0[5] = 200
        f2_local0[40] = 0
        f2_local0[41] = 50
        f2_local0[42] = 0
    else
        -- basicblock_163
        f2_local0[1] = 0
        f2_local0[2] = 0
        f2_local0[3] = 100
        f2_local0[4] = 0
        f2_local0[5] = 0
        f2_local0[40] = 50
        f2_local0[41] = 50
        f2_local0[42] = 50
    end
    -- basicblock_164
    if f2_arg1:HasSpecialEffectId(TARGET_SELF, 60590) == true then
        -- basicblock_165
        f2_local0[1] = 0
        f2_local0[2] = 0
        f2_local0[3] = 0
    end
    -- basicblock_166
    if f2_arg1:HasSpecialEffectId(TARGET_SELF, 60591) == true then
        -- basicblock_167
        f2_local0[41] = 0
        f2_local0[42] = 0
    end
    -- basicblock_168
    if f2_arg1:HasSpecialEffectId(TARGET_SELF, 60593) == true then
        -- basicblock_169
        f2_local0[15] = 0
    end
    -- basicblock_170
    f2_local0[1] = SetCoolTime(f2_arg1, f2_arg2, 3000, 10, f2_local0[1], 1)
    f2_local0[2] = SetCoolTime(f2_arg1, f2_arg2, 3001, 20, f2_local0[2], 1)
    f2_local0[3] = SetCoolTime(f2_arg1, f2_arg2, 3005, 20, f2_local0[3], 1)
    f2_local0[3] = SetCoolTime(f2_arg1, f2_arg2, 3010, 20, f2_local0[3], 1)
    f2_local0[4] = SetCoolTime(f2_arg1, f2_arg2, 3012, 20, f2_local0[4], 1)
    f2_local0[5] = SetCoolTime(f2_arg1, f2_arg2, 3013, 10, f2_local0[5], 1)
    f2_local0[13] = SetCoolTime(f2_arg1, f2_arg2, 3018, 5, f2_local0[13], 1)
    f2_local0[14] = SetCoolTime(f2_arg1, f2_arg2, 3024, 30, f2_local0[14], 1)
    f2_local0[15] = SetCoolTime(f2_arg1, f2_arg2, 3025, 20, f2_local0[15], 1)
    f2_local0[18] = SetCoolTime(f2_arg1, f2_arg2, 3032, 0, f2_local0[18], 1)
    f2_local0[18] = SetCoolTime(f2_arg1, f2_arg2, 3025, 20, f2_local0[18], 1)
    f2_local0[20] = SetCoolTime(f2_arg1, f2_arg2, 3000, 10, f2_local0[20], 1)
    f2_local0[21] = SetCoolTime(f2_arg1, f2_arg2, 3001, 20, f2_local0[21], 1)
    f2_local0[22] = SetCoolTime(f2_arg1, f2_arg2, 3005, 20, f2_local0[22], 1)
    f2_local0[22] = SetCoolTime(f2_arg1, f2_arg2, 3010, 20, f2_local0[22], 1)
    f2_local0[23] = SetCoolTime(f2_arg1, f2_arg2, 3012, 20, f2_local0[23], 1)
    f2_local0[24] = SetCoolTime(f2_arg1, f2_arg2, 3013, 10, f2_local0[24], 1)
    f2_local0[35] = SetCoolTime(f2_arg1, f2_arg2, 3020, 20, f2_local0[35], 1)
    f2_local0[35] = SetCoolTime(f2_arg1, f2_arg2, 3021, 20, f2_local0[35], 1)
    f2_local0[35] = SetCoolTime(f2_arg1, f2_arg2, 6002, 20, f2_local0[35], 1)
    f2_local0[35] = SetCoolTime(f2_arg1, f2_arg2, 6003, 20, f2_local0[35], 1)
    f2_local0[36] = SetCoolTime(f2_arg1, f2_arg2, 3022, 40, f2_local0[36], 1)
    f2_local0[37] = SetCoolTime(f2_arg1, f2_arg2, 3034, 30, f2_local0[37], 1)
    f2_local0[45] = SetCoolTime(f2_arg1, f2_arg2, 6002, 20, f2_local0[45], 1)
    f2_local0[45] = SetCoolTime(f2_arg1, f2_arg2, 6003, 20, f2_local0[45], 1)
    f2_local0[45] = SetCoolTime(f2_arg1, f2_arg2, 3020, 20, f2_local0[45], 1)
    f2_local0[45] = SetCoolTime(f2_arg1, f2_arg2, 3021, 20, f2_local0[45], 1)
    f2_local1[1] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act01)
    f2_local1[2] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act02)
    f2_local1[3] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act03)
    f2_local1[4] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act04)
    f2_local1[5] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act05)
    f2_local1[10] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act10)
    f2_local1[11] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act11)
    f2_local1[12] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act12)
    f2_local1[13] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act13)
    f2_local1[14] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act14)
    f2_local1[15] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act15)
    f2_local1[16] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act16)
    f2_local1[17] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act17)
    f2_local1[18] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act18)
    f2_local1[20] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act20)
    f2_local1[21] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act21)
    f2_local1[22] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act22)
    f2_local1[23] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act23)
    f2_local1[24] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act24)
    f2_local1[30] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act30)
    f2_local1[31] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act31)
    f2_local1[32] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act32)
    f2_local1[35] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act35)
    f2_local1[36] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act36)
    f2_local1[37] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act37)
    f2_local1[38] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act38)
    f2_local1[40] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act40)
    f2_local1[41] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act41)
    f2_local1[42] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act42)
    f2_local1[43] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act43)
    f2_local1[44] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act44)
    f2_local1[45] = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_Act45)
    local f2_local9 = REGIST_FUNC(f2_arg1, f2_arg2, KingOfRubble761000_ActAfter_AdjustSpace)
    Common_Battle_Activate(f2_arg1, f2_arg2, f2_local0, f2_local1, f2_local9, f2_local2)
    
end

function KingOfRubble761000_Act01(f3_arg0, f3_arg1, f3_arg2)
    -- Function ID = 3
    -- basicblock_1
    local f3_local0 = 14.5 - f3_arg0:GetMapHitRadius(TARGET_SELF)
    local f3_local1 = f3_local0 + 0
    local f3_local2 = f3_local0 + 10
    local f3_local3 = 50
    local f3_local4 = 0
    local f3_local5 = 2
    local f3_local6 = 2
    local f3_local7 = f3_arg0:GetRandam_Int(1, 100)
    Approach_Act_Flex(f3_arg0, f3_arg1, f3_local0, f3_local1, f3_local2, f3_local3, f3_local4, f3_local5, f3_local6)
    local f3_local8 = 3000
    local f3_local9 = 5 - f3_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f3_local10 = 0
    local f3_local11 = 0
    f3_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    f3_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    f3_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f3_local8, TARGET_ENE_0, f3_local9, f3_local10, f3_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act02(f4_arg0, f4_arg1, f4_arg2)
    -- Function ID = 4
    -- basicblock_1
    local f4_local0 = 18 - f4_arg0:GetMapHitRadius(TARGET_SELF)
    local f4_local1 = f4_local0 + 0
    local f4_local2 = f4_local0 + 10
    local f4_local3 = 50
    local f4_local4 = 0
    local f4_local5 = 2
    local f4_local6 = 2
    local f4_local7 = f4_arg0:GetRandam_Int(1, 100)
    Approach_Act_Flex(f4_arg0, f4_arg1, f4_local0, f4_local1, f4_local2, f4_local3, f4_local4, f4_local5, f4_local6)
    local f4_local8 = 3001
    local f4_local9 = 5 - f4_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f4_local10 = 0
    local f4_local11 = 0
    f4_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    f4_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f4_local8, TARGET_ENE_0, f4_local9, f4_local10, f4_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act03(f5_arg0, f5_arg1, f5_arg2)
    -- Function ID = 5
    -- basicblock_1
    local f5_local0 = 22.5 - f5_arg0:GetMapHitRadius(TARGET_SELF)
    local f5_local1 = f5_local0 + 0
    local f5_local2 = f5_local0 + 10
    local f5_local3 = 50
    local f5_local4 = 0
    local f5_local5 = 2
    local f5_local6 = 2
    local f5_local7 = f5_arg0:GetRandam_Int(1, 100)
    Approach_Act_Flex(f5_arg0, f5_arg1, f5_local0, f5_local1, f5_local2, f5_local3, f5_local4, f5_local5, f5_local6)
    local f5_local8 = 3005
    local f5_local9 = 5 - f5_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f5_local10 = 0
    local f5_local11 = 360
    f5_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    f5_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    f5_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    if f5_arg0:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
        -- basicblock_2
        f5_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, 3010, TARGET_ENE_0, f5_local9, f5_local10, f5_local11, 0, 0)
    else
        -- basicblock_3
        f5_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f5_local8, TARGET_ENE_0, f5_local9, f5_local10, f5_local11, 0, 0)
    end
    -- basicblock_4
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act04(f6_arg0, f6_arg1, f6_arg2)
    -- Function ID = 6
    -- basicblock_1
    local f6_local0 = 12.5 - f6_arg0:GetMapHitRadius(TARGET_SELF)
    local f6_local1 = f6_local0 + 0
    local f6_local2 = f6_local0 + 10
    local f6_local3 = 50
    local f6_local4 = 0
    local f6_local5 = 2
    local f6_local6 = 2
    local f6_local7 = f6_arg0:GetRandam_Int(1, 100)
    Approach_Act_Flex(f6_arg0, f6_arg1, f6_local0, f6_local1, f6_local2, f6_local3, f6_local4, f6_local5, f6_local6)
    local f6_local8 = 3012
    local f6_local9 = 5 - f6_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f6_local10 = 0
    local f6_local11 = 0
    f6_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5030)
    f6_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f6_local8, TARGET_ENE_0, f6_local9, f6_local10, f6_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act05(f7_arg0, f7_arg1, f7_arg2)
    -- Function ID = 7
    -- basicblock_1
    local f7_local0 = 10 - f7_arg0:GetMapHitRadius(TARGET_SELF)
    local f7_local1 = f7_local0 + 0
    local f7_local2 = f7_local0 + 10
    local f7_local3 = 50
    local f7_local4 = 0
    local f7_local5 = 2
    local f7_local6 = 2
    local f7_local7 = f7_arg0:GetRandam_Int(1, 100)
    local f7_local8 = 3013
    local f7_local9 = 5 - f7_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f7_local10 = 0
    local f7_local11 = 0
    f7_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5031)
    f7_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f7_local8, TARGET_ENE_0, f7_local9, f7_local10, f7_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act10(f8_arg0, f8_arg1, f8_arg2)
    -- Function ID = 8
    -- basicblock_1
    local f8_local0 = 999 - f8_arg0:GetMapHitRadius(TARGET_SELF)
    local f8_local1 = f8_local0 + 0
    local f8_local2 = f8_local0 + 10
    local f8_local3 = 50
    local f8_local4 = 0
    local f8_local5 = 2
    local f8_local6 = 2
    local f8_local7 = f8_arg0:GetRandam_Int(1, 100)
    local f8_local8 = 3015
    local f8_local9 = 5 - f8_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f8_local10 = 0
    local f8_local11 = 360
    f8_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f8_local8, TARGET_ENE_0, f8_local9, f8_local10, f8_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act11(f9_arg0, f9_arg1, f9_arg2)
    -- Function ID = 9
    -- basicblock_1
    local f9_local0 = 999 - f9_arg0:GetMapHitRadius(TARGET_SELF)
    local f9_local1 = f9_local0 + 0
    local f9_local2 = f9_local0 + 10
    local f9_local3 = 50
    local f9_local4 = 0
    local f9_local5 = 2
    local f9_local6 = 2
    local f9_local7 = f9_arg0:GetRandam_Int(1, 100)
    local f9_local8 = 3016
    local f9_local9 = 5 - f9_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f9_local10 = 0
    local f9_local11 = 360
    f9_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f9_local8, TARGET_ENE_0, f9_local9, f9_local10, f9_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act12(f10_arg0, f10_arg1, f10_arg2)
    -- Function ID = 10
    -- basicblock_1
    local f10_local0 = 25 - f10_arg0:GetMapHitRadius(TARGET_SELF)
    local f10_local1 = f10_local0 + 0
    local f10_local2 = f10_local0 + 10
    local f10_local3 = 50
    local f10_local4 = 0
    local f10_local5 = 2
    local f10_local6 = 2
    local f10_local7 = f10_arg0:GetRandam_Int(1, 100)
    local f10_local8 = 3017
    local f10_local9 = 5 - f10_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f10_local10 = 0
    local f10_local11 = 360
    f10_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f10_local8, TARGET_ENE_0, f10_local9, f10_local10, f10_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act13(f11_arg0, f11_arg1, f11_arg2)
    -- Function ID = 11
    -- basicblock_1
    local f11_local0 = 999 - f11_arg0:GetMapHitRadius(TARGET_SELF)
    local f11_local1 = f11_local0 + 0
    local f11_local2 = f11_local0 + 10
    local f11_local3 = 50
    local f11_local4 = 0
    local f11_local5 = 2
    local f11_local6 = 2
    local f11_local7 = f11_arg0:GetRandam_Int(1, 100)
    local f11_local8 = 3018
    local f11_local9 = 5 - f11_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f11_local10 = 0
    local f11_local11 = 360
    f11_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f11_local8, TARGET_ENE_0, f11_local9, f11_local10, f11_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act14(f12_arg0, f12_arg1, f12_arg2)
    -- Function ID = 12
    -- basicblock_1
    local f12_local0 = 25 - f12_arg0:GetMapHitRadius(TARGET_SELF)
    local f12_local1 = f12_local0 + 0
    local f12_local2 = f12_local0 + 10
    local f12_local3 = 50
    local f12_local4 = 0
    local f12_local5 = 2
    local f12_local6 = 2
    local f12_local7 = f12_arg0:GetRandam_Int(1, 100)
    Approach_Act_Flex(f12_arg0, f12_arg1, f12_local0, f12_local1, f12_local2, f12_local3, f12_local4, f12_local5, f12_local6)
    local f12_local8 = 3024
    local f12_local9 = 5 - f12_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f12_local10 = 0
    local f12_local11 = 0
    f12_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 20, f12_local8, TARGET_ENE_0, f12_local9, f12_local10, f12_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act15(f13_arg0, f13_arg1, f13_arg2)
    -- Function ID = 13
    -- basicblock_1
    local f13_local0 = 999 - f13_arg0:GetMapHitRadius(TARGET_SELF)
    local f13_local1 = f13_local0 + 0
    local f13_local2 = f13_local0 + 10
    local f13_local3 = 50
    local f13_local4 = 0
    local f13_local5 = 2
    local f13_local6 = 2
    local f13_local7 = f13_arg0:GetRandam_Int(1, 100)
    local f13_local8 = 3025
    local f13_local9 = 5 - f13_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f13_local10 = 0
    local f13_local11 = 360
    f13_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f13_local8, TARGET_ENE_0, f13_local9, f13_local10, f13_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act16(f14_arg0, f14_arg1, f14_arg2)
    -- Function ID = 14
    -- basicblock_1
    local f14_local0 = 999 - f14_arg0:GetMapHitRadius(TARGET_SELF)
    local f14_local1 = f14_local0 + 0
    local f14_local2 = f14_local0 + 10
    local f14_local3 = 50
    local f14_local4 = 0
    local f14_local5 = 2
    local f14_local6 = 2
    local f14_local7 = f14_arg0:GetRandam_Int(1, 100)
    local f14_local8 = 3026
    local f14_local9 = 5 - f14_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f14_local10 = 0
    local f14_local11 = 360
    local f14_local12 = f14_arg0:GetHpRate(TARGET_SELF)
    local f14_local13 = f14_arg0:GetHpRate(TARGET_EVENT)
    if f14_arg0:HasSpecialEffectId(TARGET_SELF, 5401) == true then
        -- basicblock_2
        if f14_arg0:GetHpRate(TARGET_SELF) <= 0.2 then
            -- basicblock_3
            f14_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, 3030, TARGET_ENE_0, f14_local9, f14_local10, f14_local11, 0, 0)
        -- basicblock_4
        elseif f14_arg0:GetHpRate(TARGET_SELF) <= 0.4 then
            -- basicblock_5
            f14_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, 3028, TARGET_ENE_0, f14_local9, f14_local10, f14_local11, 0, 0)
        else
            -- basicblock_6
            f14_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f14_local8, TARGET_ENE_0, f14_local9, f14_local10, f14_local11, 0, 0)
        end
    -- basicblock_7
    elseif f14_arg0:HasSpecialEffectId(TARGET_SELF, 60577) == true then
        -- basicblock_8
        f14_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, 3030, TARGET_ENE_0, f14_local9, f14_local10, f14_local11, 0, 0)
    -- basicblock_9
    elseif f14_arg0:HasSpecialEffectId(TARGET_SELF, 60576) == true then
        -- basicblock_10
        f14_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, 3028, TARGET_ENE_0, f14_local9, f14_local10, f14_local11, 0, 0)
    else
        -- basicblock_11
        f14_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f14_local8, TARGET_ENE_0, f14_local9, f14_local10, f14_local11, 0, 0)
    end
    -- basicblock_12
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act17(f15_arg0, f15_arg1, f15_arg2)
    -- Function ID = 15
    -- basicblock_1
    local f15_local0 = 999 - f15_arg0:GetMapHitRadius(TARGET_SELF)
    local f15_local1 = f15_local0 + 0
    local f15_local2 = f15_local0 + 10
    local f15_local3 = 50
    local f15_local4 = 0
    local f15_local5 = 2
    local f15_local6 = 2
    local f15_local7 = f15_arg0:GetRandam_Int(1, 100)
    local f15_local8 = 3027
    local f15_local9 = 5 - f15_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f15_local10 = 0
    local f15_local11 = 360
    local f15_local12 = f15_arg0:GetHpRate(TARGET_SELF)
    local f15_local13 = f15_arg0:GetHpRate(TARGET_EVENT)
    if f15_arg0:HasSpecialEffectId(TARGET_SELF, 5401) == true then
        -- basicblock_2
        if f15_arg0:GetHpRate(TARGET_SELF) <= 0.2 then
            -- basicblock_3
            f15_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, 3031, TARGET_ENE_0, f15_local9, f15_local10, f15_local11, 0, 0)
        -- basicblock_4
        elseif f15_arg0:GetHpRate(TARGET_SELF) <= 0.4 then
            -- basicblock_5
            f15_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, 3029, TARGET_ENE_0, f15_local9, f15_local10, f15_local11, 0, 0)
        else
            -- basicblock_6
            f15_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f15_local8, TARGET_ENE_0, f15_local9, f15_local10, f15_local11, 0, 0)
        end
    -- basicblock_7
    elseif f15_arg0:HasSpecialEffectId(TARGET_SELF, 60577) == true then
        -- basicblock_8
        f15_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, 3031, TARGET_ENE_0, f15_local9, f15_local10, f15_local11, 0, 0)
    -- basicblock_9
    elseif f15_arg0:HasSpecialEffectId(TARGET_SELF, 60576) == true then
        -- basicblock_10
        f15_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, 3029, TARGET_ENE_0, f15_local9, f15_local10, f15_local11, 0, 0)
    else
        -- basicblock_11
        f15_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f15_local8, TARGET_ENE_0, f15_local9, f15_local10, f15_local11, 0, 0)
    end
    -- basicblock_12
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act18(f16_arg0, f16_arg1, f16_arg2)
    -- Function ID = 16
    -- basicblock_1
    local f16_local0 = 999 - f16_arg0:GetMapHitRadius(TARGET_SELF)
    local f16_local1 = f16_local0 + 0
    local f16_local2 = f16_local0 + 10
    local f16_local3 = 50
    local f16_local4 = 0
    local f16_local5 = 2
    local f16_local6 = 2
    local f16_local7 = f16_arg0:GetRandam_Int(1, 100)
    local f16_local8 = 3032
    local f16_local9 = 5 - f16_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f16_local10 = 0
    local f16_local11 = 360
    f16_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f16_local8, TARGET_ENE_0, f16_local9, f16_local10, f16_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act20(f17_arg0, f17_arg1, f17_arg2)
    -- Function ID = 17
    -- basicblock_1
    local f17_local0 = 15.5 - f17_arg0:GetMapHitRadius(TARGET_SELF)
    local f17_local1 = f17_local0 + 0
    local f17_local2 = f17_local0 + 10
    local f17_local3 = 70
    local f17_local4 = 0
    local f17_local5 = 2
    local f17_local6 = 3
    local f17_local7 = f17_arg0:GetRandam_Int(1, 100)
    if f17_arg0:HasSpecialEffectId(TARGET_SELF, 5401) == true then
        -- basicblock_2
        f17_local0 = 15.5 - f17_arg0:GetMapHitRadius(TARGET_SELF) + 5
    end
    -- basicblock_3
    Approach_Act_Flex(f17_arg0, f17_arg1, f17_local0, f17_local1, f17_local2, f17_local3, f17_local4, f17_local5, f17_local6)
    local f17_local8 = 3000
    local f17_local9 = 5 - f17_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f17_local10 = 0
    local f17_local11 = 0
    f17_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    f17_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    f17_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f17_local8, TARGET_ENE_0, f17_local9, f17_local10, f17_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act21(f18_arg0, f18_arg1, f18_arg2)
    -- Function ID = 18
    -- basicblock_1
    local f18_local0 = 23 - f18_arg0:GetMapHitRadius(TARGET_SELF)
    local f18_local1 = f18_local0 + 0
    local f18_local2 = f18_local0 + 10
    local f18_local3 = 70
    local f18_local4 = 0
    local f18_local5 = 2
    local f18_local6 = 3
    local f18_local7 = f18_arg0:GetRandam_Int(1, 100)
    if f18_arg0:HasSpecialEffectId(TARGET_SELF, 5401) == true then
        -- basicblock_2
        f18_local0 = 15.5 - f18_arg0:GetMapHitRadius(TARGET_SELF) + 5
    end
    -- basicblock_3
    Approach_Act_Flex(f18_arg0, f18_arg1, f18_local0, f18_local1, f18_local2, f18_local3, f18_local4, f18_local5, f18_local6)
    local f18_local8 = 3001
    local f18_local9 = 5 - f18_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f18_local10 = 0
    local f18_local11 = 0
    f18_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    f18_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f18_local8, TARGET_ENE_0, f18_local9, f18_local10, f18_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act22(f19_arg0, f19_arg1, f19_arg2)
    -- Function ID = 19
    -- basicblock_1
    local f19_local0 = 22.5 - f19_arg0:GetMapHitRadius(TARGET_SELF)
    local f19_local1 = f19_local0 + 0
    local f19_local2 = f19_local0 + 10
    local f19_local3 = 70
    local f19_local4 = 0
    local f19_local5 = 2
    local f19_local6 = 3
    local f19_local7 = f19_arg0:GetRandam_Int(1, 100)
    if f19_arg0:HasSpecialEffectId(TARGET_SELF, 5401) == true then
        -- basicblock_2
        f19_local0 = 15.5 - f19_arg0:GetMapHitRadius(TARGET_SELF) + 5
    end
    -- basicblock_3
    Approach_Act_Flex(f19_arg0, f19_arg1, f19_local0, f19_local1, f19_local2, f19_local3, f19_local4, f19_local5, f19_local6)
    local f19_local8 = 3005
    local f19_local9 = 5 - f19_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f19_local10 = 0
    local f19_local11 = 360
    f19_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    f19_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    f19_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    f19_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5032)
    if f19_arg0:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
        -- basicblock_4
        f19_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, 3010, TARGET_ENE_0, f19_local9, f19_local10, f19_local11, 0, 0)
    else
        -- basicblock_5
        f19_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f19_local8, TARGET_ENE_0, f19_local9, f19_local10, f19_local11, 0, 0)
    end
    -- basicblock_6
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act23(f20_arg0, f20_arg1, f20_arg2)
    -- Function ID = 20
    -- basicblock_1
    local f20_local0 = 12.5 - f20_arg0:GetMapHitRadius(TARGET_SELF)
    local f20_local1 = f20_local0 + 0
    local f20_local2 = f20_local0 + 10
    local f20_local3 = 70
    local f20_local4 = 0
    local f20_local5 = 2
    local f20_local6 = 3
    local f20_local7 = f20_arg0:GetRandam_Int(1, 100)
    if f20_arg0:HasSpecialEffectId(TARGET_SELF, 5401) == true then
        -- basicblock_2
        f20_local0 = 15.5 - f20_arg0:GetMapHitRadius(TARGET_SELF) + 5
    end
    -- basicblock_3
    Approach_Act_Flex(f20_arg0, f20_arg1, f20_local0, f20_local1, f20_local2, f20_local3, f20_local4, f20_local5, f20_local6)
    local f20_local8 = 3012
    local f20_local9 = 5 - f20_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f20_local10 = 0
    local f20_local11 = 0
    f20_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5030)
    f20_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f20_local8, TARGET_ENE_0, f20_local9, f20_local10, f20_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act24(f21_arg0, f21_arg1, f21_arg2)
    -- Function ID = 21
    -- basicblock_1
    local f21_local0 = 12 - f21_arg0:GetMapHitRadius(TARGET_SELF)
    local f21_local1 = f21_local0 + 0
    local f21_local2 = f21_local0 + 10
    local f21_local3 = 70
    local f21_local4 = 0
    local f21_local5 = 2
    local f21_local6 = 2
    local f21_local7 = f21_arg0:GetRandam_Int(1, 100)
    local f21_local8 = 3013
    local f21_local9 = 5 - f21_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f21_local10 = 0
    local f21_local11 = 0
    f21_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5031)
    f21_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f21_local8, TARGET_ENE_0, f21_local9, f21_local10, f21_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act30(f22_arg0, f22_arg1, f22_arg2)
    -- Function ID = 22
    -- basicblock_1
    local f22_local0 = 999 - f22_arg0:GetMapHitRadius(TARGET_SELF)
    local f22_local1 = f22_local0 + 0
    local f22_local2 = f22_local0 + 10
    local f22_local3 = 70
    local f22_local4 = 0
    local f22_local5 = 2
    local f22_local6 = 2
    local f22_local7 = f22_arg0:GetRandam_Int(1, 100)
    local f22_local8 = 3015
    local f22_local9 = 5 - f22_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f22_local10 = 0
    local f22_local11 = 360
    f22_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f22_local8, TARGET_ENE_0, f22_local9, f22_local10, f22_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act31(f23_arg0, f23_arg1, f23_arg2)
    -- Function ID = 23
    -- basicblock_1
    local f23_local0 = 999 - f23_arg0:GetMapHitRadius(TARGET_SELF)
    local f23_local1 = f23_local0 + 0
    local f23_local2 = f23_local0 + 10
    local f23_local3 = 70
    local f23_local4 = 0
    local f23_local5 = 2
    local f23_local6 = 2
    local f23_local7 = f23_arg0:GetRandam_Int(1, 100)
    local f23_local8 = 3016
    local f23_local9 = 5 - f23_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f23_local10 = 0
    local f23_local11 = 360
    f23_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f23_local8, TARGET_ENE_0, f23_local9, f23_local10, f23_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act32(f24_arg0, f24_arg1, f24_arg2)
    -- Function ID = 24
    -- basicblock_1
    local f24_local0 = 25 - f24_arg0:GetMapHitRadius(TARGET_SELF)
    local f24_local1 = f24_local0 + 0
    local f24_local2 = f24_local0 + 10
    local f24_local3 = 70
    local f24_local4 = 0
    local f24_local5 = 2
    local f24_local6 = 2
    local f24_local7 = f24_arg0:GetRandam_Int(1, 100)
    local f24_local8 = 3017
    local f24_local9 = 5 - f24_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f24_local10 = 0
    local f24_local11 = 360
    f24_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f24_local8, TARGET_ENE_0, f24_local9, f24_local10, f24_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act35(f25_arg0, f25_arg1, f25_arg2)
    -- Function ID = 25
    -- basicblock_1
    local f25_local0 = 25 - f25_arg0:GetMapHitRadius(TARGET_SELF)
    local f25_local1 = f25_local0 + 0
    local f25_local2 = f25_local0 + 10
    local f25_local3 = 70
    local f25_local4 = 0
    local f25_local5 = 2
    local f25_local6 = 3
    local f25_local7 = f25_arg0:GetRandam_Int(1, 100)
    if f25_arg0:HasSpecialEffectId(TARGET_SELF, 5401) == true then
        -- basicblock_2
        f25_local0 = 15.5 - f25_arg0:GetMapHitRadius(TARGET_SELF) + 5
    end
    -- basicblock_3
    Approach_Act_Flex(f25_arg0, f25_arg1, f25_local0, f25_local1, f25_local2, f25_local3, f25_local4, f25_local5, f25_local6)
    local f25_local8 = 3020
    local f25_local9 = 5 - f25_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f25_local10 = 0
    local f25_local11 = 360
    f25_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5033)
    if f25_arg0:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
        -- basicblock_4
        f25_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f25_local8, TARGET_ENE_0, f25_local9, f25_local10, f25_local11, 0, 0)
    else
        -- basicblock_5
        f25_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, 3021, TARGET_ENE_0, f25_local9, f25_local10, f25_local11, 0, 0)
    end
    -- basicblock_6
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act36(f26_arg0, f26_arg1, f26_arg2)
    -- Function ID = 26
    -- basicblock_1
    local f26_local0 = 30 - f26_arg0:GetMapHitRadius(TARGET_SELF)
    local f26_local1 = f26_local0 + 0
    local f26_local2 = f26_local0 + 10
    local f26_local3 = 70
    local f26_local4 = 0
    local f26_local5 = 2
    local f26_local6 = 2
    local f26_local7 = f26_arg0:GetRandam_Int(1, 100)
    local f26_local8 = 3022
    local f26_local9 = 5 - f26_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f26_local10 = 0
    local f26_local11 = 0
    f26_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5034)
    f26_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f26_local8, TARGET_ENE_0, f26_local9, f26_local10, f26_local11, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act37(f27_arg0, f27_arg1, f27_arg2)
    -- Function ID = 27
    -- basicblock_1
    local f27_local0 = 999 - f27_arg0:GetMapHitRadius(TARGET_SELF)
    local f27_local1 = f27_local0 + 0
    local f27_local2 = f27_local0 + 10
    local f27_local3 = 70
    local f27_local4 = 0
    local f27_local5 = 2
    local f27_local6 = 2
    local f27_local7 = f27_arg0:GetRandam_Int(1, 100)
    local f27_local8 = 3034
    local f27_local9 = 5 - f27_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f27_local10 = 0
    local f27_local11 = 360
    f27_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5035)
    f27_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5036)
    f27_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5038)
    f27_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 60555)
    f27_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 60556)
    if f27_arg0:HasSpecialEffectId(TARGET_SELF, 60555) == true then
        -- basicblock_2
        if f27_arg0:IsInsideTargetCustom(TARGET_SELF, TARGET_EVENT, AI_DIR_TYPE_F, 180, 180, 900) then
            -- basicblock_3
            f27_arg1:AddSubGoal(GOAL_COMMON_StepSafety, 5, 1, -1, -1, -1, TARGET_EVENT, 0, 0, true)
            f27_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f27_local8, TARGET_ENE_0, f27_local9, f27_local10, f27_local11, 0, 0)
        else
            -- basicblock_4
            f27_arg1:AddSubGoal(GOAL_COMMON_StepSafety, 5, -1, 1, -1, -1, TARGET_EVENT, 0, 0, true)
            f27_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f27_local8, TARGET_ENE_0, f27_local9, f27_local10, f27_local11, 0, 0)
        end
    else
        -- basicblock_5
        f27_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, f27_local8, TARGET_ENE_0, f27_local9, f27_local10, f27_local11, 0, 0)
    end
    -- basicblock_6
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act38(f28_arg0, f28_arg1, f28_arg2)
    -- Function ID = 28
    -- basicblock_1
    local f28_local0 = 999 - f28_arg0:GetMapHitRadius(TARGET_SELF)
    local f28_local1 = f28_local0 + 0
    local f28_local2 = f28_local0 + 10
    local f28_local3 = 70
    local f28_local4 = 0
    local f28_local5 = 2
    local f28_local6 = 2
    local f28_local7 = f28_arg0:GetRandam_Int(1, 100)
    local f28_local8 = 3038
    local f28_local9 = 5 - f28_arg0:GetMapHitRadius(TARGET_SELF) + 999
    local f28_local10 = 0
    local f28_local11 = 360
    local f28_local12 = f28_arg0:GetDist(TARGET_ENE_0)
    local f28_local13 = f28_arg0:GetHpRate(TARGET_SELF)
    local f28_local14 = f28_arg0:GetHpRate(TARGET_EVENT)
    f28_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5037)
    f28_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 60555)
    f28_arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 60556)
    if f28_arg0:HasSpecialEffectId(TARGET_SELF, 60555) == true then
        -- basicblock_2
        if f28_arg0:IsInsideTargetCustom(TARGET_SELF, TARGET_EVENT, AI_DIR_TYPE_F, 180, 180, 900) then
            -- basicblock_3
            f28_arg1:AddSubGoal(GOAL_COMMON_StepSafety, 5, 1, -1, -1, -1, TARGET_EVENT, 0, 0, true)
            f28_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 20, f28_local8, TARGET_ENE_0, f28_local9, f28_local10, f28_local11, 0, 0)
        else
            -- basicblock_4
            f28_arg1:AddSubGoal(GOAL_COMMON_StepSafety, 5, -1, 1, -1, -1, TARGET_EVENT, 0, 0, true)
            f28_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 20, f28_local8, TARGET_ENE_0, f28_local9, f28_local10, f28_local11, 0, 0)
        end
    else
        -- basicblock_5
        f28_arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 20, f28_local8, TARGET_ENE_0, f28_local9, f28_local10, f28_local11, 0, 0)
    end
    -- basicblock_6
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act40(f29_arg0, f29_arg1, f29_arg2)
    -- Function ID = 29
    -- basicblock_1
    f29_arg1:AddSubGoal(GOAL_COMMON_ApproachTarget, 2.5, TARGET_ENE_0, 7.5, TARGET_ENE_0, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act41(f30_arg0, f30_arg1, f30_arg2)
    -- Function ID = 30
    -- basicblock_1
    local f30_local0 = f30_arg0:GetMapHitRadius(TARGET_SELF)
    if f30_arg0:GetExistMeshOnLineDistEx(TARGET_SELF, AI_DIR_TYPE_B, 2.5, f30_local0, 0) >= 2 then
        -- basicblock_2
        f30_arg1:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 7.5, TARGET_ENE_0, false, -1)
    else
        -- basicblock_3
        f30_arg1:AddSubGoal(GOAL_COMMON_SidewayMove, f30_arg0:GetRandam_Float(2, 2.5), TARGET_ENE_0, f30_arg0:GetRandam_Int(0, 1), f30_arg0:GetRandam_Int(30, 45), true, true, -1)
    end
    -- basicblock_4
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act42(f31_arg0, f31_arg1, f31_arg2)
    -- Function ID = 31
    -- basicblock_1
    f31_arg1:AddSubGoal(GOAL_COMMON_SidewayMove, f31_arg0:GetRandam_Float(2.5, 3), TARGET_ENE_0, f31_arg0:GetRandam_Int(0, 1), f31_arg0:GetRandam_Int(30, 45), true, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act43(f32_arg0, f32_arg1, f32_arg2)
    -- Function ID = 32
    -- basicblock_1
    f32_arg1:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 90, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act44(f33_arg0, f33_arg1, f33_arg2)
    -- Function ID = 33
    -- basicblock_1
    f33_arg1:AddSubGoal(GOAL_COMMON_StepSafety, 2, -1, 1, -1, -1, TARGET_ENE_0, 0, 0, true)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_Act45(f34_arg0, f34_arg1, f34_arg2)
    -- Function ID = 34
    -- basicblock_1
    if f34_arg0:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
        -- basicblock_2
        f34_arg1:AddSubGoal(GOAL_COMMON_StepSafety, 2.5, -1, -1, 1, -1, TARGET_ENE_0, 0, 0, true)
    else
        -- basicblock_3
        f34_arg1:AddSubGoal(GOAL_COMMON_StepSafety, 2.5, -1, -1, -1, 1, TARGET_ENE_0, 0, 0, true)
    end
    -- basicblock_4
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function KingOfRubble761000_ActAfter_AdjustSpace(f35_arg0, f35_arg1, f35_arg2)
    -- Function ID = 35
    -- basicblock_1
    f35_arg1:AddSubGoal(GOAL_KingOfRubble761000_AfterAttackAct, 10)
    
end

Goal.Update = function (f36_arg0, f36_arg1, f36_arg2)
    -- Function ID = 36
    -- basicblock_1
    return Update_Default_NoSubGoal(f36_arg0, f36_arg1, f36_arg2)
    
end

Goal.Terminate = function (f37_arg0, f37_arg1, f37_arg2)
    -- Function ID = 37
    -- basicblock_1
    
end

Goal.Interrupt = function (f38_arg0, f38_arg1, f38_arg2)
    -- Function ID = 38
    -- basicblock_1
    local f38_local0 = f38_arg1:GetDist(TARGET_ENE_0)
    local f38_local1 = f38_arg1:GetDistY(TARGET_ENE_0)
    local f38_local2 = 5 - f38_arg1:GetMapHitRadius(TARGET_SELF)
    local f38_local3 = 0
    local f38_local4 = 0
    local f38_local5 = f38_arg1:GetRandam_Int(1, 100)
    local f38_local6 = f38_arg1:GetHpRate(TARGET_SELF)
    if f38_arg1:HasSpecialEffectId(TARGET_SELF, 5110) == true or f38_arg1:HasSpecialEffectAttribute(TARGET_SELF, SP_EFFECT_TYPE_SLEEP) == true then
        -- basicblock_3
        return false
    end
    -- basicblock_4
    if f38_arg1:IsLadderAct(TARGET_SELF) then
        -- basicblock_5
        return false
    end
    -- basicblock_6
    if f38_arg1:IsInterupt(INTERUPT_Damaged) and f38_arg1:HasSpecialEffectId(TARGET_SELF, 5039) == false and f38_local5 <= 30 then
        -- basicblock_9
        f38_arg1:Replaning()
        return true
    end
    -- basicblock_10
    if f38_arg1:HasSpecialEffectId(TARGET_SELF, 60545) == true or f38_arg1:HasSpecialEffectId(TARGET_SELF, 60546) == true then
        -- basicblock_12
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5025) then
            -- basicblock_14
            if f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 7.5) then
                -- basicblock_15
                if f38_local5 <= 70 then
                    -- basicblock_16
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3002, TARGET_ENE_0, 999, 0, 0)
                    return true
                else
                    -- basicblock_17
                    return true
                end
            -- basicblock_18
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 15) then
                -- basicblock_19
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3001, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        end
        -- basicblock_20
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5026) then
            -- basicblock_22
            if f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 7.5) then
                -- basicblock_23
                if f38_local5 <= 70 then
                    -- basicblock_24
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3002, TARGET_ENE_0, 999, 0, 0)
                    return true
                else
                    -- basicblock_25
                    return true
                end
            -- basicblock_26
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 15) then
                -- basicblock_27
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        end
        -- basicblock_28
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5027) then
            -- basicblock_30
            if f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 7.5) then
                -- basicblock_31
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3007, TARGET_ENE_0, 999, 0, 0)
                return true
            -- basicblock_32
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 20) then
                -- basicblock_33
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3006, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        end
        -- basicblock_34
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5028) and f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 7.5) then
            -- basicblock_37
            f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3007, TARGET_ENE_0, 999, 0, 0)
            return true
        end
        -- basicblock_38
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5029) then
            -- basicblock_40
            if f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 7.5) then
                -- basicblock_41
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3007, TARGET_ENE_0, 999, 0, 0)
                return true
            -- basicblock_42
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 20) then
                -- basicblock_43
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3011, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        end
        -- basicblock_44
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5030) then
            -- basicblock_46
            if f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 10) then
                -- basicblock_47
                if f38_local5 <= 70 then
                    -- basicblock_48
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3002, TARGET_ENE_0, 999, 0, 0)
                    return true
                else
                    -- basicblock_49
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3008, TARGET_ENE_0, 999, 0, 0)
                    return true
                end
            -- basicblock_50
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 15) then
                -- basicblock_51
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3001, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        end
        -- basicblock_52
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5031) and f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 7.5) then
            -- basicblock_55
            if f38_local5 <= 70 then
                -- basicblock_56
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3014, TARGET_ENE_0, 999, 0, 0)
                return true
            else
                -- basicblock_57
                return true
            end
        end
        -- basicblock_58
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5032) and f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 10) then
            -- basicblock_61
            f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3007, TARGET_ENE_0, 999, 0, 0)
            return true
        end
        -- basicblock_62
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5033) then
            -- basicblock_64
            if f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 7.5) then
                -- basicblock_65
                return true
            -- basicblock_66
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 15) then
                -- basicblock_67
                if f38_local5 <= 70 then
                    -- basicblock_68
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3001, TARGET_ENE_0, 999, 0, 0)
                    return true
                else
                    -- basicblock_69
                    return true
                end
            end
        end
        -- basicblock_70
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5034) and f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 40) then
            -- basicblock_73
            f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3023, TARGET_ENE_0, 999, 0, 0)
            return true
        end
        -- basicblock_74
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5035) then
            -- basicblock_76
            if f38_arg1:HasSpecialEffectId(TARGET_SELF, 60555) == true then
                -- basicblock_77
                if f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 180, 100) then
                    -- basicblock_78
                    if f38_local5 <= 70 then
                        -- basicblock_79
                        f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 15, 3039, TARGET_ENE_0, 999, 0, 0)
                        return true
                    else
                        -- basicblock_80
                        return true
                    end
                end
            -- basicblock_81
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 180, 100) then
                -- basicblock_82
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 15, 3033, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        end
        -- basicblock_83
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5036) then
            -- basicblock_85
            if f38_arg1:HasSpecialEffectId(TARGET_SELF, 60545) == true then
                -- basicblock_86
                if f38_arg1:HasSpecialEffectId(TARGET_SELF, 60555) == true then
                    -- basicblock_87
                    if f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 180, 100) then
                        -- basicblock_88
                        if f38_local5 <= 70 then
                            -- basicblock_89
                            f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 15, 3039, TARGET_ENE_0, 999, 0, 0)
                            return true
                        else
                            -- basicblock_90
                            return true
                        end
                    end
                -- basicblock_91
                elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 180, 100) then
                    -- basicblock_92
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 15, 3019, TARGET_ENE_0, 999, 0, 0)
                    return true
                end
            -- basicblock_93
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 180, 100) then
                -- basicblock_94
                if f38_local5 <= 70 then
                    -- basicblock_95
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 15, 3039, TARGET_ENE_0, 999, 0, 0)
                    return true
                else
                    -- basicblock_96
                    return true
                end
            end
        end
        -- basicblock_97
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5037) then
            -- basicblock_99
            if f38_arg1:HasSpecialEffectId(TARGET_SELF, 60586) == false then
                -- basicblock_100
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3035, TARGET_ENE_0, 999, 0, 0)
                return true
            -- basicblock_101
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 180, 30) then
                -- basicblock_102
                if f38_local5 <= 40 then
                    -- basicblock_103
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3035, TARGET_ENE_0, 999, 0, 0)
                -- basicblock_104
                elseif f38_local5 <= 60 then
                    -- basicblock_105
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3036, TARGET_ENE_0, 999, 0, 0)
                else
                    -- basicblock_106
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3037, TARGET_ENE_0, 999, 0, 0)
                end
            -- basicblock_107
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 999) then
                -- basicblock_108
                if f38_local5 <= 10 then
                    -- basicblock_109
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3035, TARGET_ENE_0, 999, 0, 0)
                -- basicblock_110
                elseif f38_local5 <= 80 then
                    -- basicblock_111
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3036, TARGET_ENE_0, 999, 0, 0)
                else
                    -- basicblock_112
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3037, TARGET_ENE_0, 999, 0, 0)
                end
            -- basicblock_113
            elseif f38_local5 <= 40 then
                -- basicblock_114
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3035, TARGET_ENE_0, 999, 0, 0)
            -- basicblock_115
            elseif f38_local5 <= 60 then
                -- basicblock_116
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3036, TARGET_ENE_0, 999, 0, 0)
            else
                -- basicblock_117
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3037, TARGET_ENE_0, 999, 0, 0)
            end
        end
        -- basicblock_118
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5038) and f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 180, 100) then
            -- basicblock_121
            if f38_local5 <= 70 then
                -- basicblock_122
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3039, TARGET_ENE_0, 999, 0, 0)
                return true
            else
                -- basicblock_123
                return true
            end
        end
        -- basicblock_124
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(60592) then
            -- basicblock_126
            if f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 45) then
                -- basicblock_127
                f38_arg2:ClearSubGoal()
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3023, TARGET_ENE_0, 999, 0, 0)
                return true
            else
                -- basicblock_128
                f38_arg2:ClearSubGoal()
                KingOfRubble761000_Act21(f38_arg1, f38_arg2, paramTbl)
            end
        end
    -- basicblock_129
    elseif f38_arg1:HasSpecialEffectId(TARGET_SELF, 60547) == true or f38_arg1:HasSpecialEffectId(TARGET_SELF, 60548) == true then
        -- basicblock_131
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5025) then
            -- basicblock_133
            if f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 5) then
                -- basicblock_134
                if f38_local5 <= 70 then
                    -- basicblock_135
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3008, TARGET_ENE_0, 999, 0, 0)
                    return true
                else
                    -- basicblock_136
                    return true
                end
            -- basicblock_137
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 12.5) then
                -- basicblock_138
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3001, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        end
        -- basicblock_139
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5026) then
            -- basicblock_141
            if f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 5) then
                -- basicblock_142
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3008, TARGET_ENE_0, 999, 0, 0)
                return true
            -- basicblock_143
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 12.5) then
                -- basicblock_144
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        end
        -- basicblock_145
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5027) then
            -- basicblock_147
            if f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 7.5) then
                -- basicblock_148
                if f38_local5 <= 70 then
                    -- basicblock_149
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3007, TARGET_ENE_0, 999, 0, 0)
                    return true
                else
                    -- basicblock_150
                    return true
                end
            -- basicblock_151
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 15) then
                -- basicblock_152
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3006, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        end
        -- basicblock_153
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5028) and f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 7.5) then
            -- basicblock_156
            if f38_local5 <= 70 then
                -- basicblock_157
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3007, TARGET_ENE_0, 999, 0, 0)
                return true
            else
                -- basicblock_158
                return true
            end
        end
        -- basicblock_159
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5029) then
            -- basicblock_161
            if f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 7.5) then
                -- basicblock_162
                if f38_local5 <= 70 then
                    -- basicblock_163
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3008, TARGET_ENE_0, 999, 0, 0)
                    return true
                else
                    -- basicblock_164
                    return true
                end
            -- basicblock_165
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 15) then
                -- basicblock_166
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3001, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        end
        -- basicblock_167
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5030) then
            -- basicblock_169
            if f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 7.5) then
                -- basicblock_170
                if f38_local5 <= 70 then
                    -- basicblock_171
                    f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3008, TARGET_ENE_0, 999, 0, 0)
                    return true
                else
                    -- basicblock_172
                    return true
                end
            -- basicblock_173
            elseif f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 15) then
                -- basicblock_174
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3001, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        end
        -- basicblock_175
        if f38_arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and f38_arg1:GetSpecialEffectActivateInterruptId(5031) and f38_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, 180, 7.5) then
            -- basicblock_178
            if f38_local5 <= 70 then
                -- basicblock_179
                f38_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3014, TARGET_ENE_0, 999, 0, 0)
                return true
            else
                -- basicblock_180
                return true
            end
        end
    end
    -- basicblock_181
    return false
    
end

RegisterTableGoal(GOAL_KingOfRubble761000_AfterAttackAct, "KingOfRubble761000_AfterAttackAct")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_KingOfRubble761000_AfterAttackAct, true)

Goal.Activate = function (f39_arg0, f39_arg1, f39_arg2)
    -- Function ID = 39
    -- basicblock_1
    
end

Goal.Update = function (f40_arg0, f40_arg1, f40_arg2)
    -- Function ID = 40
    -- basicblock_1
    return Update_Default_NoSubGoal(f40_arg0, f40_arg1, f40_arg2)
    
end


