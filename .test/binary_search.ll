FUNCTION main : 
    zero = #0
    DEC irVar_xxx5_arr #40
    irVar_xxx4_num = CALL read
    irt3mP1 = irVar_xxx4_num
    irt3mP2 = #10
    IF irt3mP1 > irt3mP2 GOTO L1
    GOTO  L2
LABEL L1 :
    irVar_xxx4_num = #10
LABEL L2 :
    irVar_xxx7_i = #0
LABEL L3 :
    irt3mP3 = irVar_xxx7_i
    irt3mP4 = irVar_xxx4_num
    IF irt3mP3 < irt3mP4 GOTO L4
    GOTO  L5
LABEL L4 :
    irt3mP5 = irVar_xxx5_arr
    irt3mP6 = irVar_xxx7_i
    irt3mP7 = #4
    irt3mP6 = irt3mP6 * irt3mP7
    irt3mP5 = irt3mP5 + irt3mP6
    irt3mP8 = CALL read
    *irt3mP5 = irt3mP8
    irt3mP9 = irVar_xxx7_i
    irt3mP10 = #1
    irVar_xxx7_i = irt3mP9 + irt3mP10
    GOTO  L3
LABEL L5 :
    irVar_xxx6_key = CALL read
    irVar_xxx9_left = #0
    irt3mP11 = irVar_xxx4_num
    irt3mP12 = #1
    irVar_xxx10_right = irt3mP11 - irt3mP12
LABEL L6 :
    irt3mP13 = irVar_xxx9_left
    irt3mP14 = irVar_xxx10_right
    IF irt3mP13 < irt3mP14 GOTO L7
    GOTO  L8
LABEL L7 :
    irt3mP17 = irVar_xxx9_left
    irt3mP18 = irVar_xxx10_right
    irt3mP15 = irt3mP17 + irt3mP18
    irt3mP16 = #2
    irVar_xxx7_i = irt3mP15 / irt3mP16
    irt3mP21 = irVar_xxx5_arr
    irt3mP22 = irVar_xxx7_i
    irt3mP23 = #4
    irt3mP22 = irt3mP22 * irt3mP23
    irt3mP21 = irt3mP21 + irt3mP22
    irt3mP19 = *irt3mP21
    irt3mP20 = irVar_xxx6_key
    IF irt3mP19 == irt3mP20 GOTO L9
    GOTO  L10
LABEL L9 :
    irt3mP24 = irVar_xxx7_i
    ARG irt3mP24
    CALL write
    irt3mP25 = #0
    RETURN irt3mP25
    GOTO  L11
LABEL L10 :
    irt3mP28 = irVar_xxx5_arr
    irt3mP29 = irVar_xxx7_i
    irt3mP30 = #4
    irt3mP29 = irt3mP29 * irt3mP30
    irt3mP28 = irt3mP28 + irt3mP29
    irt3mP26 = *irt3mP28
    irt3mP27 = irVar_xxx6_key
    IF irt3mP26 > irt3mP27 GOTO L12
    GOTO  L13
LABEL L12 :
    irt3mP31 = irVar_xxx7_i
    irt3mP32 = #1
    irVar_xxx10_right = irt3mP31 - irt3mP32
    GOTO  L14
LABEL L13 :
    irt3mP33 = irVar_xxx7_i
    irt3mP34 = #1
    irVar_xxx9_left = irt3mP33 + irt3mP34
LABEL L14 :
LABEL L11 :
    GOTO  L6
LABEL L8 :
    irt3mP35 = #0
    RETURN irt3mP35
