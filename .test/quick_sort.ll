FUNCTION Swap : 
    PARAM irVar_xxx3_a
    PARAM irVar_xxx4_l
    PARAM irVar_xxx5_h
    zero = #0
    irt3mP1 = irVar_xxx3_a
    irt3mP2 = irVar_xxx4_l
    irt3mP3 = #4
    irt3mP2 = irt3mP2 * irt3mP3
    irt3mP1 = irt3mP1 + irt3mP2
    irVar_xxx7_temp = *irt3mP1
    irt3mP4 = irVar_xxx3_a
    irt3mP5 = irVar_xxx4_l
    irt3mP6 = #4
    irt3mP5 = irt3mP5 * irt3mP6
    irt3mP4 = irt3mP4 + irt3mP5
    irt3mP8 = irVar_xxx3_a
    irt3mP9 = irVar_xxx5_h
    irt3mP10 = #4
    irt3mP9 = irt3mP9 * irt3mP10
    irt3mP8 = irt3mP8 + irt3mP9
    irt3mP7 = *irt3mP8
    *irt3mP4 = irt3mP7
    irt3mP11 = irVar_xxx3_a
    irt3mP12 = irVar_xxx5_h
    irt3mP13 = #4
    irt3mP12 = irt3mP12 * irt3mP13
    irt3mP11 = irt3mP11 + irt3mP12
    irt3mP14 = irVar_xxx7_temp
    *irt3mP11 = irt3mP14
    irt3mP15 = #0
    RETURN irt3mP15
FUNCTION Partition : 
    PARAM irVar_xxx8_b
    PARAM irVar_xxx9_low
    PARAM irVar_xxx10_high
    zero = #0
    irt3mP16 = irVar_xxx8_b
    irt3mP17 = irVar_xxx9_low
    irt3mP18 = #4
    irt3mP17 = irt3mP17 * irt3mP18
    irt3mP16 = irt3mP16 + irt3mP17
    irVar_xxx12_base = *irt3mP16
LABEL L1 :
    irt3mP19 = irVar_xxx9_low
    irt3mP20 = irVar_xxx10_high
    IF irt3mP19 < irt3mP20 GOTO L2
    GOTO  L3
LABEL L2 :
LABEL L4 :
    irt3mP21 = irVar_xxx9_low
    irt3mP22 = irVar_xxx10_high
    IF irt3mP21 < irt3mP22 GOTO L7
    GOTO  L6
LABEL L7 :
    irt3mP25 = irVar_xxx8_b
    irt3mP26 = irVar_xxx10_high
    irt3mP27 = #4
    irt3mP26 = irt3mP26 * irt3mP27
    irt3mP25 = irt3mP25 + irt3mP26
    irt3mP23 = *irt3mP25
    irt3mP24 = irVar_xxx12_base
    IF irt3mP23 >= irt3mP24 GOTO L5
    GOTO  L6
LABEL L5 :
    irt3mP28 = irVar_xxx10_high
    irt3mP29 = #1
    irVar_xxx10_high = irt3mP28 - irt3mP29
    GOTO  L4
LABEL L6 :
    irt3mP31 = irVar_xxx8_b
    irt3mP30 = irt3mP31
    ARG irt3mP30
    irt3mP32 = irVar_xxx9_low
    ARG irt3mP32
    irt3mP33 = irVar_xxx10_high
    ARG irt3mP33
    CALL Swap
LABEL L8 :
    irt3mP34 = irVar_xxx9_low
    irt3mP35 = irVar_xxx10_high
    IF irt3mP34 < irt3mP35 GOTO L11
    GOTO  L10
LABEL L11 :
    irt3mP38 = irVar_xxx8_b
    irt3mP39 = irVar_xxx9_low
    irt3mP40 = #4
    irt3mP39 = irt3mP39 * irt3mP40
    irt3mP38 = irt3mP38 + irt3mP39
    irt3mP36 = *irt3mP38
    irt3mP37 = irVar_xxx12_base
    IF irt3mP36 <= irt3mP37 GOTO L9
    GOTO  L10
LABEL L9 :
    irt3mP41 = irVar_xxx9_low
    irt3mP42 = #1
    irVar_xxx9_low = irt3mP41 + irt3mP42
    GOTO  L8
LABEL L10 :
    irt3mP44 = irVar_xxx8_b
    irt3mP43 = irt3mP44
    ARG irt3mP43
    irt3mP45 = irVar_xxx9_low
    ARG irt3mP45
    irt3mP46 = irVar_xxx10_high
    ARG irt3mP46
    CALL Swap
    GOTO  L1
LABEL L3 :
    irt3mP47 = irVar_xxx9_low
    RETURN irt3mP47
FUNCTION QuickSort : 
    PARAM irVar_xxx13_c
    PARAM irVar_xxx14_low1
    PARAM irVar_xxx15_high1
    zero = #0
    irt3mP48 = irVar_xxx14_low1
    irt3mP49 = irVar_xxx15_high1
    IF irt3mP48 < irt3mP49 GOTO L12
    GOTO  L13
LABEL L12 :
    irt3mP51 = irVar_xxx13_c
    irt3mP50 = irt3mP51
    ARG irt3mP50
    irt3mP52 = irVar_xxx14_low1
    ARG irt3mP52
    irt3mP53 = irVar_xxx15_high1
    ARG irt3mP53
    irVar_xxx17_base1 = CALL Partition
    irt3mP55 = irVar_xxx13_c
    irt3mP54 = irt3mP55
    ARG irt3mP54
    irt3mP56 = irVar_xxx14_low1
    ARG irt3mP56
    irt3mP58 = irVar_xxx17_base1
    irt3mP59 = #1
    irt3mP57 = irt3mP58 - irt3mP59
    ARG irt3mP57
    CALL QuickSort
    irt3mP61 = irVar_xxx13_c
    irt3mP60 = irt3mP61
    ARG irt3mP60
    irt3mP63 = irVar_xxx17_base1
    irt3mP64 = #1
    irt3mP62 = irt3mP63 + irt3mP64
    ARG irt3mP62
    irt3mP65 = irVar_xxx15_high1
    ARG irt3mP65
    CALL QuickSort
LABEL L13 :
    irt3mP66 = #0
    RETURN irt3mP66
FUNCTION main : 
    zero = #0
    irVar_xxx19_n = #8
    DEC irVar_xxx20_arr #32
    irVar_xxx21_i = #0
LABEL L14 :
    irt3mP67 = irVar_xxx21_i
    irt3mP68 = irVar_xxx19_n
    IF irt3mP67 < irt3mP68 GOTO L15
    GOTO  L16
LABEL L15 :
    irt3mP69 = irVar_xxx20_arr
    irt3mP70 = irVar_xxx21_i
    irt3mP71 = #4
    irt3mP70 = irt3mP70 * irt3mP71
    irt3mP69 = irt3mP69 + irt3mP70
    irt3mP72 = CALL read
    *irt3mP69 = irt3mP72
    irt3mP73 = irVar_xxx21_i
    irt3mP74 = #1
    irVar_xxx21_i = irt3mP73 + irt3mP74
    GOTO  L14
LABEL L16 :
    irt3mP76 = irVar_xxx20_arr
    irt3mP75 = irt3mP76
    ARG irt3mP75
    irt3mP77 = #0
    ARG irt3mP77
    irt3mP79 = irVar_xxx19_n
    irt3mP80 = #1
    irt3mP78 = irt3mP79 - irt3mP80
    ARG irt3mP78
    CALL QuickSort
    irVar_xxx21_i = #0
LABEL L17 :
    irt3mP81 = irVar_xxx21_i
    irt3mP82 = irVar_xxx19_n
    IF irt3mP81 < irt3mP82 GOTO L18
    GOTO  L19
LABEL L18 :
    irt3mP84 = irVar_xxx20_arr
    irt3mP85 = irVar_xxx21_i
    irt3mP86 = #4
    irt3mP85 = irt3mP85 * irt3mP86
    irt3mP84 = irt3mP84 + irt3mP85
    irt3mP83 = *irt3mP84
    ARG irt3mP83
    CALL write
    irt3mP87 = irVar_xxx21_i
    irt3mP88 = #1
    irVar_xxx21_i = irt3mP87 + irt3mP88
    GOTO  L17
LABEL L19 :
    irt3mP89 = #0
    RETURN irt3mP89
