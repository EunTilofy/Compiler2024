FUNCTION get_one : 
    PARAM irVar_xxx3_a
    zero = #0
    irt3mP1 = #1
    RETURN irt3mP1
FUNCTION deepWhileBr : 
    PARAM irVar_xxx5_a
    PARAM irVar_xxx6_b
    zero = #0
    irt3mP2 = irVar_xxx5_a
    irt3mP3 = irVar_xxx6_b
    irVar_xxx8_c = irt3mP2 + irt3mP3
LABEL L1 :
    irt3mP4 = irVar_xxx8_c
    irt3mP5 = #75
    IF irt3mP4 < irt3mP5 GOTO L2
    GOTO  L3
LABEL L2 :
    irVar_xxx9_d = #42
    irt3mP6 = irVar_xxx8_c
    irt3mP7 = #100
    IF irt3mP6 < irt3mP7 GOTO L4
    GOTO  L5
LABEL L4 :
    irt3mP8 = irVar_xxx8_c
    irt3mP9 = irVar_xxx9_d
    irVar_xxx8_c = irt3mP8 + irt3mP9
    irt3mP10 = irVar_xxx8_c
    irt3mP11 = #99
    IF irt3mP10 > irt3mP11 GOTO L6
    GOTO  L7
LABEL L6 :
    irt3mP12 = irVar_xxx9_d
    irt3mP13 = #2
    irVar_xxx10_e = irt3mP12 * irt3mP13
    irt3mP16 = #0
    ARG irt3mP16
    irt3mP14 = CALL get_one
    irt3mP15 = #1
    IF irt3mP14 == irt3mP15 GOTO L8
    GOTO  L9
LABEL L8 :
    irt3mP17 = irVar_xxx10_e
    irt3mP18 = #2
    irVar_xxx8_c = irt3mP17 * irt3mP18
LABEL L9 :
LABEL L7 :
LABEL L5 :
    GOTO  L1
LABEL L3 :
    irt3mP19 = irVar_xxx8_c
    RETURN irt3mP19
FUNCTION main : 
    zero = #0
    irVar_xxx12_p = #2
    irt3mP20 = irVar_xxx12_p
    ARG irt3mP20
    irt3mP21 = irVar_xxx12_p
    ARG irt3mP21
    irVar_xxx12_p = CALL deepWhileBr
    irt3mP22 = irVar_xxx12_p
    ARG irt3mP22
    CALL write
    irt3mP23 = #0
    RETURN irt3mP23
