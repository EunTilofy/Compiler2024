FUNCTION add : 
    PARAM irVar_xxx3_array
    zero = #0
    irt3mP1 = irVar_xxx3_array
    irt3mP2 = #0
    irt3mP3 = #4
    irt3mP2 = irt3mP2 * irt3mP3
    irt3mP1 = irt3mP1 + irt3mP2
    irt3mP7 = irVar_xxx3_array
    irt3mP8 = #0
    irt3mP9 = #4
    irt3mP8 = irt3mP8 * irt3mP9
    irt3mP7 = irt3mP7 + irt3mP8
    irt3mP5 = *irt3mP7
    irt3mP6 = #1
    irt3mP4 = irt3mP5 + irt3mP6
    *irt3mP1 = irt3mP4
    irt3mP10 = #1
    RETURN irt3mP10
FUNCTION main : 
    zero = #0
    irVar_xxx6_a = #10
    DEC irVar_xxx7_array #40
    irt3mP11 = irVar_xxx7_array
    irt3mP12 = #0
    irt3mP13 = #4
    irt3mP12 = irt3mP12 * irt3mP13
    irt3mP11 = irt3mP11 + irt3mP12
    irt3mP14 = #10
    *irt3mP11 = irt3mP14
    irt3mP15 = irVar_xxx6_a
    irt3mP16 = #10
    IF irt3mP15 == irt3mP16 GOTO L1
    GOTO  L4
LABEL L4 :
    irt3mP19 = irVar_xxx7_array
    irt3mP18 = irt3mP19
    ARG irt3mP18
    irt3mP17 = CALL add
    IF irt3mP17 != zero GOTO L1
    GOTO  L2
LABEL L1 :
    irt3mP21 = irVar_xxx7_array
    irt3mP22 = #0
    irt3mP23 = #4
    irt3mP22 = irt3mP22 * irt3mP23
    irt3mP21 = irt3mP21 + irt3mP22
    irt3mP20 = *irt3mP21
    ARG irt3mP20
    CALL write
    GOTO  L3
LABEL L2 :
    irt3mP25 = irVar_xxx7_array
    irt3mP26 = #0
    irt3mP27 = #4
    irt3mP26 = irt3mP26 * irt3mP27
    irt3mP25 = irt3mP25 + irt3mP26
    irt3mP24 = *irt3mP25
    ARG irt3mP24
    CALL write
LABEL L3 :
    irt3mP28 = #0
    RETURN irt3mP28
