FUNCTION main : 
    zero = #0
    DEC irVar_xxx4_a #32
    irt3mP1 = irVar_xxx4_a
    irt3mP2 = #0
    irt3mP1 = irt3mP1 + irt3mP2
    *irt3mP1 = zero
    irt3mP3 = #4
    irt3mP1 = irt3mP1 + irt3mP3
    *irt3mP1 = zero
    irt3mP4 = #4
    irt3mP1 = irt3mP1 + irt3mP4
    *irt3mP1 = zero
    irt3mP5 = #4
    irt3mP1 = irt3mP1 + irt3mP5
    *irt3mP1 = zero
    irt3mP6 = #4
    irt3mP1 = irt3mP1 + irt3mP6
    *irt3mP1 = zero
    irt3mP7 = #4
    irt3mP1 = irt3mP1 + irt3mP7
    *irt3mP1 = zero
    irt3mP8 = #4
    irt3mP1 = irt3mP1 + irt3mP8
    *irt3mP1 = zero
    irt3mP9 = #4
    irt3mP1 = irt3mP1 + irt3mP9
    *irt3mP1 = zero
    irt3mP10 = #4
    irt3mP1 = irt3mP1 + irt3mP10
    irt3mP11 = #1
    irt3mP12 = irVar_xxx4_a
    irt3mP13 = #0
    irt3mP12 = irt3mP12 + irt3mP13
    *irt3mP12 = irt3mP11
    irt3mP14 = #2
    irt3mP15 = irVar_xxx4_a
    irt3mP16 = #4
    irt3mP15 = irt3mP15 + irt3mP16
    *irt3mP15 = irt3mP14
    irt3mP17 = #3
    irt3mP18 = irVar_xxx4_a
    irt3mP19 = #8
    irt3mP18 = irt3mP18 + irt3mP19
    *irt3mP18 = irt3mP17
    irt3mP20 = #4
    irt3mP21 = irVar_xxx4_a
    irt3mP22 = #12
    irt3mP21 = irt3mP21 + irt3mP22
    *irt3mP21 = irt3mP20
    irt3mP23 = #5
    irt3mP24 = irVar_xxx4_a
    irt3mP25 = #16
    irt3mP24 = irt3mP24 + irt3mP25
    *irt3mP24 = irt3mP23
    irt3mP26 = #6
    irt3mP27 = irVar_xxx4_a
    irt3mP28 = #20
    irt3mP27 = irt3mP27 + irt3mP28
    *irt3mP27 = irt3mP26
    irt3mP29 = #7
    irt3mP30 = irVar_xxx4_a
    irt3mP31 = #24
    irt3mP30 = irt3mP30 + irt3mP31
    *irt3mP30 = irt3mP29
    irt3mP32 = #8
    irt3mP33 = irVar_xxx4_a
    irt3mP34 = #28
    irt3mP33 = irt3mP33 + irt3mP34
    *irt3mP33 = irt3mP32
    irVar_xxx5_i = #0
LABEL L1 :
    irt3mP35 = irVar_xxx5_i
    irt3mP36 = #8
    IF irt3mP35 < irt3mP36 GOTO L2
    GOTO  L3
LABEL L2 :
    irt3mP38 = irVar_xxx4_a
    irt3mP39 = irVar_xxx5_i
    irt3mP40 = #4
    irt3mP39 = irt3mP39 * irt3mP40
    irt3mP38 = irt3mP38 + irt3mP39
    irt3mP37 = *irt3mP38
    ARG irt3mP37
    CALL write
    irt3mP41 = irVar_xxx5_i
    irt3mP42 = #1
    irVar_xxx5_i = irt3mP41 + irt3mP42
    GOTO  L1
LABEL L3 :
    irt3mP43 = #0
    RETURN irt3mP43
