FUNCTION whileIf : 
    zero = #0
    irVar_xxx4_a = #0
    irVar_xxx5_b = #0
LABEL L1 :
    irt3mP1 = irVar_xxx4_a
    irt3mP2 = #100
    IF irt3mP1 < irt3mP2 GOTO L2
    GOTO  L3
LABEL L2 :
    irt3mP3 = irVar_xxx4_a
    irt3mP4 = #5
    IF irt3mP3 == irt3mP4 GOTO L4
    GOTO  L5
LABEL L4 :
    irVar_xxx5_b = #25
    GOTO  L6
LABEL L5 :
    irt3mP5 = irVar_xxx4_a
    irt3mP6 = #10
    IF irt3mP5 == irt3mP6 GOTO L7
    GOTO  L8
LABEL L7 :
    irVar_xxx5_b = #42
    GOTO  L9
LABEL L8 :
    irt3mP7 = irVar_xxx4_a
    irt3mP8 = #2
    irVar_xxx5_b = irt3mP7 * irt3mP8
LABEL L9 :
LABEL L6 :
    irt3mP9 = irVar_xxx4_a
    irt3mP10 = #1
    irVar_xxx4_a = irt3mP9 + irt3mP10
    GOTO  L1
LABEL L3 :
    irt3mP11 = irVar_xxx5_b
    RETURN irt3mP11
FUNCTION main : 
    zero = #0
    irt3mP12 = CALL whileIf
    ARG irt3mP12
    CALL write
    irt3mP13 = #0
    RETURN irt3mP13
