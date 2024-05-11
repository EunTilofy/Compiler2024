FUNCTION main : 
    zero = #0
    irVar_xxx4_a = #5
    irVar_xxx5_b = #5
    irVar_xxx6_c = #1
    irt3mP1 = #2
    irVar_xxx7_d = - irt3mP1
    irVar_xxx8_result = #2
    irt3mP6 = irVar_xxx7_d
    irt3mP7 = #1
    irt3mP4 = irt3mP6 * irt3mP7
    irt3mP5 = #2
    irt3mP2 = irt3mP4 / irt3mP5
    irt3mP3 = #0
    IF irt3mP2 < irt3mP3 GOTO L1
    GOTO  L3
LABEL L3 :
    irt3mP10 = irVar_xxx4_a
    irt3mP11 = irVar_xxx5_b
    irt3mP8 = irt3mP10 - irt3mP11
    irt3mP9 = #0
    IF irt3mP8 != irt3mP9 GOTO L4
    GOTO  L2
LABEL L4 :
    irt3mP16 = irVar_xxx6_c
    irt3mP17 = #3
    irt3mP14 = irt3mP16 + irt3mP17
    irt3mP15 = #2
    irt3mP12 = irt3mP14 % irt3mP15
    irt3mP13 = #0
    IF irt3mP12 != irt3mP13 GOTO L1
    GOTO  L2
LABEL L1 :
    irt3mP18 = irVar_xxx8_result
    ARG irt3mP18
    CALL write
LABEL L2 :
    irt3mP23 = irVar_xxx7_d
    irt3mP24 = #2
    irt3mP21 = irt3mP23 % irt3mP24
    irt3mP22 = #67
    irt3mP19 = irt3mP21 + irt3mP22
    irt3mP20 = #0
    IF irt3mP19 < irt3mP20 GOTO L5
    GOTO  L7
LABEL L7 :
    irt3mP27 = irVar_xxx4_a
    irt3mP28 = irVar_xxx5_b
    irt3mP25 = irt3mP27 - irt3mP28
    irt3mP26 = #0
    IF irt3mP25 != irt3mP26 GOTO L8
    GOTO  L6
LABEL L8 :
    irt3mP33 = irVar_xxx6_c
    irt3mP34 = #2
    irt3mP31 = irt3mP33 + irt3mP34
    irt3mP32 = #2
    irt3mP29 = irt3mP31 % irt3mP32
    irt3mP30 = #0
    IF irt3mP29 != irt3mP30 GOTO L5
    GOTO  L6
LABEL L5 :
    irVar_xxx8_result = #4
    irt3mP35 = irVar_xxx8_result
    ARG irt3mP35
    CALL write
LABEL L6 :
    irt3mP36 = #0
    RETURN irt3mP36
