FUNCTION main : 
    zero = #0
    irVar_xxx4_flag = #0
    irVar_xxx5_a = #1
    irVar_xxx6_b = #0
    irVar_xxx7_c = #1
    irVar_xxx8_d = #2
    irVar_xxx9_e = #4
    irt3mP5 = irVar_xxx5_a
    irt3mP6 = irVar_xxx6_b
    irt3mP3 = irt3mP5 * irt3mP6
    irt3mP4 = irVar_xxx7_c
    irt3mP1 = irt3mP3 / irt3mP4
    irt3mP7 = irVar_xxx9_e
    irt3mP8 = irVar_xxx8_d
    irt3mP2 = irt3mP7 + irt3mP8
    IF irt3mP1 == irt3mP2 GOTO L4
    GOTO  L3
LABEL L4 :
    irt3mP13 = irVar_xxx5_a
    irt3mP15 = irVar_xxx5_a
    irt3mP16 = irVar_xxx6_b
    irt3mP14 = irt3mP15 + irt3mP16
    irt3mP11 = irt3mP13 * irt3mP14
    irt3mP12 = irVar_xxx7_c
    irt3mP9 = irt3mP11 + irt3mP12
    irt3mP17 = irVar_xxx8_d
    irt3mP18 = irVar_xxx9_e
    irt3mP10 = irt3mP17 + irt3mP18
    IF irt3mP9 <= irt3mP10 GOTO L1
    GOTO  L3
LABEL L3 :
    irt3mP21 = irVar_xxx5_a
    irt3mP23 = irVar_xxx6_b
    irt3mP24 = irVar_xxx7_c
    irt3mP22 = irt3mP23 * irt3mP24
    irt3mP19 = irt3mP21 - irt3mP22
    irt3mP25 = irVar_xxx8_d
    irt3mP27 = irVar_xxx5_a
    irt3mP28 = irVar_xxx7_c
    irt3mP26 = irt3mP27 / irt3mP28
    irt3mP20 = irt3mP25 - irt3mP26
    IF irt3mP19 == irt3mP20 GOTO L1
    GOTO  L2
LABEL L1 :
    irVar_xxx4_flag = #1
LABEL L2 :
    irt3mP29 = irVar_xxx4_flag
    ARG irt3mP29
    CALL write
    irt3mP30 = #0
    RETURN irt3mP30
