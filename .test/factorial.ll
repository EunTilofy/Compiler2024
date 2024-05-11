FUNCTION factorial : 
    PARAM irVar_xxx3_n
    zero = #0
    irt3mP1 = irVar_xxx3_n
    irt3mP2 = #0
    IF irt3mP1 == irt3mP2 GOTO L1
    GOTO  L2
LABEL L1 :
    irt3mP3 = #1
    RETURN irt3mP3
LABEL L2 :
    irt3mP5 = irVar_xxx3_n
    irt3mP8 = irVar_xxx3_n
    irt3mP9 = #1
    irt3mP7 = irt3mP8 - irt3mP9
    ARG irt3mP7
    irt3mP6 = CALL factorial
    irt3mP4 = irt3mP5 * irt3mP6
    RETURN irt3mP4
FUNCTION main : 
    zero = #0
    irVar_xxx6_n = CALL read
    irt3mP10 = irVar_xxx6_n
    ARG irt3mP10
    irVar_xxx7_result = CALL factorial
    irt3mP11 = irVar_xxx7_result
    ARG irt3mP11
    CALL write
    irt3mP12 = #0
    RETURN irt3mP12
