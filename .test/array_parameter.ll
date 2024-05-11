FUNCTION print_array : 
    PARAM irVar_xxx3_a
    PARAM irVar_xxx4_len
    zero = #0
    irVar_xxx6_i = #0
LABEL L1 :
    irt3mP1 = irVar_xxx6_i
    irt3mP2 = irVar_xxx4_len
    IF irt3mP1 < irt3mP2 GOTO L2
    GOTO  L3
LABEL L2 :
    irt3mP4 = irVar_xxx3_a
    irt3mP5 = irVar_xxx6_i
    irt3mP6 = #4
    irt3mP5 = irt3mP5 * irt3mP6
    irt3mP4 = irt3mP4 + irt3mP5
    irt3mP3 = *irt3mP4
    ARG irt3mP3
    CALL write
    irt3mP7 = irVar_xxx6_i
    irt3mP8 = #1
    irVar_xxx6_i = irt3mP7 + irt3mP8
    GOTO  L1
LABEL L3 :
    RETURN 
FUNCTION main : 
    zero = #0
    DEC irVar_xxx8_a #32
    irt3mP9 = irVar_xxx8_a
    irt3mP10 = #0
    irt3mP11 = #8
    irt3mP10 = irt3mP10 * irt3mP11
    irt3mP9 = irt3mP9 + irt3mP10
    irt3mP12 = #0
    irt3mP13 = #4
    irt3mP12 = irt3mP12 * irt3mP13
    irt3mP9 = irt3mP9 + irt3mP12
    irt3mP14 = #1
    *irt3mP9 = irt3mP14
    irt3mP15 = irVar_xxx8_a
    irt3mP16 = #0
    irt3mP17 = #8
    irt3mP16 = irt3mP16 * irt3mP17
    irt3mP15 = irt3mP15 + irt3mP16
    irt3mP18 = #1
    irt3mP19 = #4
    irt3mP18 = irt3mP18 * irt3mP19
    irt3mP15 = irt3mP15 + irt3mP18
    irt3mP20 = #2
    *irt3mP15 = irt3mP20
    irt3mP21 = irVar_xxx8_a
    irt3mP22 = #1
    irt3mP23 = #8
    irt3mP22 = irt3mP22 * irt3mP23
    irt3mP21 = irt3mP21 + irt3mP22
    irt3mP24 = #0
    irt3mP25 = #4
    irt3mP24 = irt3mP24 * irt3mP25
    irt3mP21 = irt3mP21 + irt3mP24
    irt3mP26 = #3
    *irt3mP21 = irt3mP26
    irt3mP27 = irVar_xxx8_a
    irt3mP28 = #1
    irt3mP29 = #8
    irt3mP28 = irt3mP28 * irt3mP29
    irt3mP27 = irt3mP27 + irt3mP28
    irt3mP30 = #1
    irt3mP31 = #4
    irt3mP30 = irt3mP30 * irt3mP31
    irt3mP27 = irt3mP27 + irt3mP30
    irt3mP32 = #4
    *irt3mP27 = irt3mP32
    irt3mP33 = irVar_xxx8_a
    irt3mP34 = #2
    irt3mP35 = #8
    irt3mP34 = irt3mP34 * irt3mP35
    irt3mP33 = irt3mP33 + irt3mP34
    irt3mP36 = #0
    irt3mP37 = #4
    irt3mP36 = irt3mP36 * irt3mP37
    irt3mP33 = irt3mP33 + irt3mP36
    irt3mP38 = #5
    *irt3mP33 = irt3mP38
    irt3mP39 = irVar_xxx8_a
    irt3mP40 = #2
    irt3mP41 = #8
    irt3mP40 = irt3mP40 * irt3mP41
    irt3mP39 = irt3mP39 + irt3mP40
    irt3mP42 = #1
    irt3mP43 = #4
    irt3mP42 = irt3mP42 * irt3mP43
    irt3mP39 = irt3mP39 + irt3mP42
    irt3mP44 = #6
    *irt3mP39 = irt3mP44
    irt3mP45 = irVar_xxx8_a
    irt3mP46 = #3
    irt3mP47 = #8
    irt3mP46 = irt3mP46 * irt3mP47
    irt3mP45 = irt3mP45 + irt3mP46
    irt3mP48 = #0
    irt3mP49 = #4
    irt3mP48 = irt3mP48 * irt3mP49
    irt3mP45 = irt3mP45 + irt3mP48
    irt3mP50 = #7
    *irt3mP45 = irt3mP50
    irt3mP51 = irVar_xxx8_a
    irt3mP52 = #3
    irt3mP53 = #8
    irt3mP52 = irt3mP52 * irt3mP53
    irt3mP51 = irt3mP51 + irt3mP52
    irt3mP54 = #1
    irt3mP55 = #4
    irt3mP54 = irt3mP54 * irt3mP55
    irt3mP51 = irt3mP51 + irt3mP54
    irt3mP56 = #8
    *irt3mP51 = irt3mP56
    irt3mP58 = irVar_xxx8_a
    irt3mP59 = #2
    irt3mP60 = #8
    irt3mP59 = irt3mP59 * irt3mP60
    irt3mP58 = irt3mP58 + irt3mP59
    irt3mP57 = irt3mP58
    ARG irt3mP57
    irt3mP61 = #2
    ARG irt3mP61
    CALL print_array
    irt3mP63 = irVar_xxx8_a
    irt3mP64 = #1
    irt3mP65 = #8
    irt3mP64 = irt3mP64 * irt3mP65
    irt3mP63 = irt3mP63 + irt3mP64
    irt3mP62 = irt3mP63
    ARG irt3mP62
    irt3mP66 = #2
    ARG irt3mP66
    CALL print_array
    irt3mP68 = irVar_xxx8_a
    irt3mP69 = #0
    irt3mP70 = #8
    irt3mP69 = irt3mP69 * irt3mP70
    irt3mP68 = irt3mP68 + irt3mP69
    irt3mP67 = irt3mP68
    ARG irt3mP67
    irt3mP71 = #2
    ARG irt3mP71
    CALL print_array
    irt3mP73 = irVar_xxx8_a
    irt3mP74 = #3
    irt3mP75 = #8
    irt3mP74 = irt3mP74 * irt3mP75
    irt3mP73 = irt3mP73 + irt3mP74
    irt3mP72 = irt3mP73
    ARG irt3mP72
    irt3mP76 = #2
    ARG irt3mP76
    CALL print_array
    irt3mP77 = #0
    RETURN irt3mP77
