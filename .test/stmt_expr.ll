FUNCTION main : 
    zero = #0
    irVar_xxx5_n = #10
    irVar_xxx6_i = #0
    irVar_xxx4_k = #1
LABEL L1 :
    irt3mP1 = irVar_xxx6_i
    irt3mP3 = irVar_xxx5_n
    irt3mP4 = #1
    irt3mP2 = irt3mP3 - irt3mP4
    IF irt3mP1 <= irt3mP2 GOTO L2
    GOTO  L3
LABEL L2 :
    irt3mP5 = irVar_xxx6_i
    irt3mP6 = #1
    irVar_xxx6_i = irt3mP5 + irt3mP6
    irt3mP7 = irVar_xxx4_k
    irt3mP8 = #1
    irt3mP9 = irVar_xxx4_k
    irt3mP10 = irVar_xxx4_k
    irVar_xxx4_k = irt3mP9 + irt3mP10
    GOTO  L1
LABEL L3 :
    irt3mP11 = irVar_xxx4_k
    ARG irt3mP11
    CALL write
    irt3mP12 = #0
    RETURN irt3mP12
