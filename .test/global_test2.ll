GLOBAL irVar_xxx3_prime:
    .WORD #2
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
    .WORD #0
GLOBAL irVar_xxx4_prime_count:
    .WORD #1
FUNCTION is_prime : 
    PARAM irVar_xxx5_x
    zero = #0
    irVar_xxx7_i = #0
LABEL L1 :
    irt3mP2 = irVar_xxx7_i
    irt3mP4 = &irVar_xxx4_prime_count
    irt3mP3 = *irt3mP4
    IF irt3mP2 < irt3mP3 GOTO L2
    GOTO  L3
LABEL L2 :
    irt3mP7 = irVar_xxx5_x
    irt3mP9 = &irVar_xxx3_prime
    irt3mP10 = irVar_xxx7_i
    irt3mP11 = #4
    irt3mP10 = irt3mP10 * irt3mP11
    irt3mP9 = irt3mP9 + irt3mP10
    irt3mP8 = *irt3mP9
    irt3mP5 = irt3mP7 % irt3mP8
    irt3mP6 = #0
    IF irt3mP5 == irt3mP6 GOTO L4
    GOTO  L5
LABEL L4 :
    irt3mP12 = #0
    RETURN irt3mP12
LABEL L5 :
    irt3mP13 = irVar_xxx7_i
    irt3mP14 = #1
    irVar_xxx7_i = irt3mP13 + irt3mP14
    GOTO  L1
LABEL L3 :
    irt3mP15 = #1
    RETURN irt3mP15
FUNCTION generate_prime : 
    zero = #0
    irVar_xxx9_i = #3
LABEL L6 :
    irt3mP16 = irVar_xxx9_i
    irt3mP17 = #100
    IF irt3mP16 < irt3mP17 GOTO L7
    GOTO  L8
LABEL L7 :
    irt3mP19 = irVar_xxx9_i
    ARG irt3mP19
    irt3mP18 = CALL is_prime
    IF irt3mP18 != zero GOTO L9
    GOTO  L10
LABEL L9 :
    irt3mP20 = &irVar_xxx3_prime
    irt3mP23 = &irVar_xxx4_prime_count
    irt3mP21 = *irt3mP23
    irt3mP22 = #4
    irt3mP21 = irt3mP21 * irt3mP22
    irt3mP20 = irt3mP20 + irt3mP21
    irt3mP24 = irVar_xxx9_i
    *irt3mP20 = irt3mP24
    irt3mP29 = &irVar_xxx4_prime_count
    irt3mP27 = *irt3mP29
    irt3mP28 = #1
    irt3mP25 = irt3mP27 + irt3mP28
    irt3mP26 = &irVar_xxx4_prime_count
    *irt3mP26 = irt3mP25
LABEL L10 :
    irt3mP30 = irVar_xxx9_i
    irt3mP31 = #2
    irVar_xxx9_i = irt3mP30 + irt3mP31
    GOTO  L6
LABEL L8 :
    RETURN 
FUNCTION main : 
    zero = #0
    CALL generate_prime
    irVar_xxx11_i = #0
LABEL L11 :
    irt3mP32 = irVar_xxx11_i
    irt3mP34 = &irVar_xxx4_prime_count
    irt3mP33 = *irt3mP34
    IF irt3mP32 < irt3mP33 GOTO L12
    GOTO  L13
LABEL L12 :
    irt3mP36 = &irVar_xxx3_prime
    irt3mP37 = irVar_xxx11_i
    irt3mP38 = #4
    irt3mP37 = irt3mP37 * irt3mP38
    irt3mP36 = irt3mP36 + irt3mP37
    irt3mP35 = *irt3mP36
    ARG irt3mP35
    CALL write
    irt3mP39 = irVar_xxx11_i
    irt3mP40 = #1
    irVar_xxx11_i = irt3mP39 + irt3mP40
    GOTO  L11
LABEL L13 :
    irt3mP41 = #0
    RETURN irt3mP41
