GLOBAL irVar_xxx3_a:
    .WORD #0
GLOBAL irVar_xxx4_b:
    .WORD #0
    .WORD #0
GLOBAL irVar_xxx5_c:
    .WORD #1
    .WORD #1
    .WORD #4
    .WORD #5
    .WORD #0
    .WORD #0
    .WORD #1
    .WORD #0
    .WORD #0
    .WORD #4
    .WORD #0
    .WORD #0
GLOBAL irVar_xxx6_i:
    .WORD #2024
FUNCTION main : 
    zero = #0
LABEL L1 :
    irt3mP15 = &irVar_xxx3_a
    irt3mP13 = *irt3mP15
    irt3mP14 = #2
    IF irt3mP13 < irt3mP14 GOTO L2
    GOTO  L3
LABEL L2 :
    irt3mP16 = &irVar_xxx4_b
    irt3mP19 = &irVar_xxx3_a
    irt3mP17 = *irt3mP19
    irt3mP18 = #4
    irt3mP17 = irt3mP17 * irt3mP18
    irt3mP16 = irt3mP16 + irt3mP17
    irt3mP23 = &irVar_xxx3_a
    irt3mP21 = *irt3mP23
    irt3mP22 = #2
    irt3mP20 = irt3mP21 * irt3mP22
    *irt3mP16 = irt3mP20
    irt3mP28 = &irVar_xxx3_a
    irt3mP26 = *irt3mP28
    irt3mP27 = #1
    irt3mP24 = irt3mP26 + irt3mP27
    irt3mP25 = &irVar_xxx3_a
    *irt3mP25 = irt3mP24
    GOTO  L1
LABEL L3 :
    irt3mP34 = &irVar_xxx3_a
    irt3mP32 = *irt3mP34
    irt3mP35 = &irVar_xxx4_b
    irt3mP36 = #0
    irt3mP37 = #4
    irt3mP36 = irt3mP36 * irt3mP37
    irt3mP35 = irt3mP35 + irt3mP36
    irt3mP33 = *irt3mP35
    irt3mP30 = irt3mP32 + irt3mP33
    irt3mP38 = &irVar_xxx4_b
    irt3mP39 = #1
    irt3mP40 = #4
    irt3mP39 = irt3mP39 * irt3mP40
    irt3mP38 = irt3mP38 + irt3mP39
    irt3mP31 = *irt3mP38
    irt3mP29 = irt3mP30 + irt3mP31
    ARG irt3mP29
    CALL write
    irt3mP42 = &irVar_xxx6_i
    irt3mP41 = *irt3mP42
    ARG irt3mP41
    CALL write
    irVar_xxx8_i = #0
LABEL L4 :
    irt3mP43 = irVar_xxx8_i
    irt3mP44 = #12
    IF irt3mP43 < irt3mP44 GOTO L5
    GOTO  L6
LABEL L5 :
    irt3mP46 = &irVar_xxx5_c
    irt3mP49 = irVar_xxx8_i
    irt3mP50 = #3
    irt3mP47 = irt3mP49 / irt3mP50
    irt3mP48 = #12
    irt3mP47 = irt3mP47 * irt3mP48
    irt3mP46 = irt3mP46 + irt3mP47
    irt3mP53 = irVar_xxx8_i
    irt3mP54 = #3
    irt3mP51 = irt3mP53 % irt3mP54
    irt3mP52 = #4
    irt3mP51 = irt3mP51 * irt3mP52
    irt3mP46 = irt3mP46 + irt3mP51
    irt3mP45 = *irt3mP46
    ARG irt3mP45
    CALL write
    irt3mP55 = irVar_xxx8_i
    irt3mP56 = #1
    irVar_xxx8_i = irt3mP55 + irt3mP56
    GOTO  L4
LABEL L6 :
    irt3mP57 = #0
    RETURN irt3mP57
