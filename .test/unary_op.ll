FUNCTION main : 
    zero = #0
    irVar_xxx4_a = #10
    irt3mP3 = irVar_xxx4_a
    irt3mP4 = #0
    irt3mP2 = #0
    IF irt3mP3 != irt3mP4 GOTO L4
    irt3mP2 = #1
LABEL L4 :
    irt3mP5 = #0
    irt3mP1 = #0
    IF irt3mP2 != irt3mP5 GOTO L5
    irt3mP1 = #1
LABEL L5 :
    IF irt3mP1 != zero GOTO L1
    GOTO  L2
LABEL L1 :
    irt3mP8 = #1
    irt3mP7 = - irt3mP8
    irt3mP6 = - irt3mP7
    irVar_xxx4_a = - irt3mP6
    GOTO  L3
LABEL L2 :
    irVar_xxx4_a = #0
LABEL L3 :
    irt3mP9 = irVar_xxx4_a
    ARG irt3mP9
    CALL write
    irt3mP10 = #0
    RETURN irt3mP10
