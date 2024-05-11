FUNCTION if_ifElse_ : 
    zero = #0
    irVar_xxx4_a = #5
    irVar_xxx5_b = #10
    irt3mP1 = irVar_xxx4_a
    irt3mP2 = #5
    IF irt3mP1 == irt3mP2 GOTO L1
    GOTO  L2
LABEL L1 :
    irt3mP3 = irVar_xxx5_b
    irt3mP4 = #10
    IF irt3mP3 == irt3mP4 GOTO L3
    GOTO  L4
LABEL L3 :
    irVar_xxx4_a = #25
    GOTO  L5
LABEL L4 :
    irt3mP5 = irVar_xxx4_a
    irt3mP6 = #15
    irVar_xxx4_a = irt3mP5 + irt3mP6
LABEL L5 :
LABEL L2 :
    irt3mP7 = irVar_xxx4_a
    RETURN irt3mP7
FUNCTION main : 
    zero = #0
    irt3mP8 = CALL if_ifElse_
    ARG irt3mP8
    CALL write
    irt3mP9 = #0
    RETURN irt3mP9
