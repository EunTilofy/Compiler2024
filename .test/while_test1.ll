FUNCTION doubleWhile : 
    zero = #0
    irVar_xxx4_i = #5
    irVar_xxx5_j = #7
LABEL L1 :
    irt3mP1 = irVar_xxx4_i
    irt3mP2 = #100
    IF irt3mP1 < irt3mP2 GOTO L2
    GOTO  L3
LABEL L2 :
    irt3mP3 = irVar_xxx4_i
    irt3mP4 = #30
    irVar_xxx4_i = irt3mP3 + irt3mP4
LABEL L4 :
    irt3mP5 = irVar_xxx5_j
    irt3mP6 = #100
    IF irt3mP5 < irt3mP6 GOTO L5
    GOTO  L6
LABEL L5 :
    irt3mP7 = irVar_xxx5_j
    irt3mP8 = #6
    irVar_xxx5_j = irt3mP7 + irt3mP8
    GOTO  L4
LABEL L6 :
    irt3mP9 = irVar_xxx5_j
    irt3mP10 = #100
    irVar_xxx5_j = irt3mP9 - irt3mP10
    GOTO  L1
LABEL L3 :
    irt3mP11 = irVar_xxx5_j
    RETURN irt3mP11
FUNCTION main : 
    zero = #0
    irt3mP12 = CALL doubleWhile
    ARG irt3mP12
    CALL write
    irt3mP13 = #0
    RETURN irt3mP13
