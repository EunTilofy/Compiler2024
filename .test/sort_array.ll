FUNCTION main : 
    zero = #0
    DEC irVar_xxx4_b #12
    DEC irVar_xxx5_c #40
    irVar_xxx6_i = #0
    DEC irVar_xxx9_a #20
LABEL L1 :
    irt3mP1 = irVar_xxx6_i
    irt3mP2 = #5
    IF irt3mP1 < irt3mP2 GOTO L2
    GOTO  L3
LABEL L2 :
    irt3mP3 = irVar_xxx9_a
    irt3mP4 = irVar_xxx6_i
    irt3mP5 = #4
    irt3mP4 = irt3mP4 * irt3mP5
    irt3mP3 = irt3mP3 + irt3mP4
    irt3mP6 = CALL read
    *irt3mP3 = irt3mP6
    irt3mP7 = irVar_xxx6_i
    irt3mP8 = #1
    irVar_xxx6_i = irt3mP7 + irt3mP8
    GOTO  L1
LABEL L3 :
    irVar_xxx6_i = #0
LABEL L4 :
    irt3mP9 = irVar_xxx6_i
    irt3mP10 = #4
    IF irt3mP9 < irt3mP10 GOTO L5
    GOTO  L6
LABEL L5 :
    irt3mP11 = irVar_xxx6_i
    irt3mP12 = #1
    irVar_xxx7_j = irt3mP11 + irt3mP12
LABEL L7 :
    irt3mP13 = irVar_xxx7_j
    irt3mP14 = #5
    IF irt3mP13 < irt3mP14 GOTO L8
    GOTO  L9
LABEL L8 :
    irt3mP17 = irVar_xxx9_a
    irt3mP18 = irVar_xxx6_i
    irt3mP19 = #4
    irt3mP18 = irt3mP18 * irt3mP19
    irt3mP17 = irt3mP17 + irt3mP18
    irt3mP15 = *irt3mP17
    irt3mP20 = irVar_xxx9_a
    irt3mP21 = irVar_xxx7_j
    irt3mP22 = #4
    irt3mP21 = irt3mP21 * irt3mP22
    irt3mP20 = irt3mP20 + irt3mP21
    irt3mP16 = *irt3mP20
    IF irt3mP15 > irt3mP16 GOTO L10
    GOTO  L11
LABEL L10 :
    irt3mP23 = irVar_xxx9_a
    irt3mP24 = irVar_xxx6_i
    irt3mP25 = #4
    irt3mP24 = irt3mP24 * irt3mP25
    irt3mP23 = irt3mP23 + irt3mP24
    irVar_xxx8_t = *irt3mP23
    irt3mP26 = irVar_xxx9_a
    irt3mP27 = irVar_xxx6_i
    irt3mP28 = #4
    irt3mP27 = irt3mP27 * irt3mP28
    irt3mP26 = irt3mP26 + irt3mP27
    irt3mP30 = irVar_xxx9_a
    irt3mP31 = irVar_xxx7_j
    irt3mP32 = #4
    irt3mP31 = irt3mP31 * irt3mP32
    irt3mP30 = irt3mP30 + irt3mP31
    irt3mP29 = *irt3mP30
    *irt3mP26 = irt3mP29
    irt3mP33 = irVar_xxx9_a
    irt3mP34 = irVar_xxx7_j
    irt3mP35 = #4
    irt3mP34 = irt3mP34 * irt3mP35
    irt3mP33 = irt3mP33 + irt3mP34
    irt3mP36 = irVar_xxx8_t
    *irt3mP33 = irt3mP36
LABEL L11 :
    irt3mP37 = irVar_xxx7_j
    irt3mP38 = #1
    irVar_xxx7_j = irt3mP37 + irt3mP38
    GOTO  L7
LABEL L9 :
    irt3mP39 = irVar_xxx6_i
    irt3mP40 = #1
    irVar_xxx6_i = irt3mP39 + irt3mP40
    GOTO  L4
LABEL L6 :
    irVar_xxx6_i = #0
LABEL L12 :
    irt3mP41 = irVar_xxx6_i
    irt3mP42 = #5
    IF irt3mP41 < irt3mP42 GOTO L13
    GOTO  L14
LABEL L13 :
    irt3mP44 = irVar_xxx9_a
    irt3mP45 = irVar_xxx6_i
    irt3mP46 = #4
    irt3mP45 = irt3mP45 * irt3mP46
    irt3mP44 = irt3mP44 + irt3mP45
    irt3mP43 = *irt3mP44
    ARG irt3mP43
    CALL write
    irt3mP47 = irVar_xxx6_i
    irt3mP48 = #1
    irVar_xxx6_i = irt3mP47 + irt3mP48
    GOTO  L12
LABEL L14 :
    irt3mP49 = #0
    RETURN irt3mP49
