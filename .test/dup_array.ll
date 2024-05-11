FUNCTION f : 
    zero = #0
    irVar_xxx4_a = #1
    DEC irVar_xxx5_b #16
    irt3mP1 = irVar_xxx5_b
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
    irt3mP7 = #1
    irt3mP8 = irVar_xxx5_b
    irt3mP9 = #0
    irt3mP8 = irt3mP8 + irt3mP9
    *irt3mP8 = irt3mP7
    irt3mP10 = #2
    irt3mP11 = irVar_xxx5_b
    irt3mP12 = #4
    irt3mP11 = irt3mP11 + irt3mP12
    *irt3mP11 = irt3mP10
    irt3mP13 = #3
    irt3mP14 = irVar_xxx5_b
    irt3mP15 = #8
    irt3mP14 = irt3mP14 + irt3mP15
    *irt3mP14 = irt3mP13
    irt3mP16 = #4
    irt3mP17 = irVar_xxx5_b
    irt3mP18 = #12
    irt3mP17 = irt3mP17 + irt3mP18
    *irt3mP17 = irt3mP16
    irVar_xxx6_b = #3
    irt3mP19 = irVar_xxx4_a
    irt3mP20 = irVar_xxx6_b
    irVar_xxx4_a = irt3mP19 + irt3mP20
    DEC irVar_xxx7_b #8
    irt3mP21 = irVar_xxx7_b
    irt3mP22 = #0
    irt3mP21 = irt3mP21 + irt3mP22
    *irt3mP21 = zero
    irt3mP23 = #4
    irt3mP21 = irt3mP21 + irt3mP23
    *irt3mP21 = zero
    irt3mP24 = #4
    irt3mP21 = irt3mP21 + irt3mP24
    irt3mP25 = #4
    irt3mP26 = irVar_xxx7_b
    irt3mP27 = #0
    irt3mP26 = irt3mP26 + irt3mP27
    *irt3mP26 = irt3mP25
    irt3mP28 = #8
    irt3mP29 = irVar_xxx7_b
    irt3mP30 = #4
    irt3mP29 = irt3mP29 + irt3mP30
    *irt3mP29 = irt3mP28
    irt3mP31 = irVar_xxx4_a
    irt3mP33 = irVar_xxx7_b
    irt3mP34 = #0
    irt3mP35 = #4
    irt3mP34 = irt3mP34 * irt3mP35
    irt3mP33 = irt3mP33 + irt3mP34
    irt3mP32 = *irt3mP33
    irVar_xxx4_a = irt3mP31 + irt3mP32
    irt3mP36 = irVar_xxx4_a
    irt3mP38 = irVar_xxx5_b
    irt3mP39 = #1
    irt3mP40 = #4
    irt3mP39 = irt3mP39 * irt3mP40
    irt3mP38 = irt3mP38 + irt3mP39
    irt3mP37 = *irt3mP38
    irVar_xxx4_a = irt3mP36 + irt3mP37
    irt3mP41 = irVar_xxx4_a
    RETURN irt3mP41
FUNCTION main : 
    zero = #0
    irt3mP42 = CALL f
    ARG irt3mP42
    CALL write
    irt3mP43 = #0
    RETURN irt3mP43
