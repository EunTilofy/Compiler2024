FUNCTION main : 
    zero = #0
    irVar_xxx5_b = #2
    irt3mP1 = #1
    irVar_xxx6_c = - irt3mP1
    irVar_xxx4_a = #1
    irt3mP3 = irVar_xxx4_a
    irt3mP4 = irVar_xxx5_b
    irt3mP2 = irt3mP3 + irt3mP4
    IF irt3mP2 != zero GOTO L1
    GOTO  L2
LABEL L1 :
    irVar_xxx4_a = #3
LABEL L2 :
    irt3mP6 = irVar_xxx6_c
    irt3mP5 = - irt3mP6
    IF irt3mP5 != zero GOTO L3
    GOTO  L4
LABEL L3 :
    irVar_xxx5_b = #4
LABEL L4 :
    irt3mP10 = irVar_xxx4_a
    irt3mP11 = irVar_xxx5_b
    irt3mP8 = irt3mP10 + irt3mP11
    irt3mP9 = irVar_xxx6_c
    irt3mP7 = irt3mP8 + irt3mP9
    ARG irt3mP7
    CALL write
    irt3mP12 = #0
    RETURN irt3mP12
