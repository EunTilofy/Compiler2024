FUNCTION ifWhile : 
    zero = #0
    irVar_xxx4_a = #0
    irVar_xxx5_b = #3
    irt3mP1 = irVar_xxx4_a
    irt3mP2 = #5
    IF irt3mP1 == irt3mP2 GOTO L1
    GOTO  L2
LABEL L1 :
LABEL L4 :
    irt3mP3 = irVar_xxx5_b
    irt3mP4 = #2
    IF irt3mP3 == irt3mP4 GOTO L5
    GOTO  L6
LABEL L5 :
    irt3mP5 = irVar_xxx5_b
    irt3mP6 = #2
    irVar_xxx5_b = irt3mP5 + irt3mP6
    GOTO  L4
LABEL L6 :
    irt3mP7 = irVar_xxx5_b
    irt3mP8 = #25
    irVar_xxx5_b = irt3mP7 + irt3mP8
    GOTO  L3
LABEL L2 :
LABEL L7 :
    irt3mP9 = irVar_xxx4_a
    irt3mP10 = #5
    IF irt3mP9 < irt3mP10 GOTO L8
    GOTO  L9
LABEL L8 :
    irt3mP11 = irVar_xxx5_b
    irt3mP12 = #2
    irVar_xxx5_b = irt3mP11 * irt3mP12
    irt3mP13 = irVar_xxx4_a
    irt3mP14 = #1
    irVar_xxx4_a = irt3mP13 + irt3mP14
    GOTO  L7
LABEL L9 :
LABEL L3 :
    irt3mP15 = irVar_xxx5_b
    RETURN irt3mP15
FUNCTION main : 
    zero = #0
    irt3mP16 = CALL ifWhile
    ARG irt3mP16
    CALL write
    irt3mP17 = #0
    RETURN irt3mP17
