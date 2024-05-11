FUNCTION factorial : 
    PARAM irVar_xxx3_m
    zero = #0
    irVar_xxx5_f_res = #1
LABEL L1 :
    irt3mP1 = irVar_xxx3_m
    irt3mP2 = #1
    IF irt3mP1 > irt3mP2 GOTO L2
    GOTO  L3
LABEL L2 :
    irt3mP3 = irVar_xxx5_f_res
    irt3mP4 = irVar_xxx3_m
    irVar_xxx5_f_res = irt3mP3 * irt3mP4
    irt3mP5 = irVar_xxx3_m
    irt3mP6 = #1
    irVar_xxx3_m = irt3mP5 - irt3mP6
    GOTO  L1
LABEL L3 :
    irt3mP7 = irVar_xxx5_f_res
    RETURN irt3mP7
FUNCTION cal_combiniation : 
    PARAM irVar_xxx6_c_base
    PARAM irVar_xxx7_c_num
    zero = #0
    irt3mP11 = irVar_xxx6_c_base
    ARG irt3mP11
    irt3mP9 = CALL factorial
    irt3mP14 = irVar_xxx7_c_num
    ARG irt3mP14
    irt3mP12 = CALL factorial
    irt3mP16 = irVar_xxx6_c_base
    irt3mP17 = irVar_xxx7_c_num
    irt3mP15 = irt3mP16 - irt3mP17
    ARG irt3mP15
    irt3mP13 = CALL factorial
    irt3mP10 = irt3mP12 * irt3mP13
    irt3mP8 = irt3mP9 / irt3mP10
    RETURN irt3mP8
FUNCTION cal_permutation : 
    PARAM irVar_xxx9_p_base
    PARAM irVar_xxx10_p_num
    zero = #0
    irt3mP21 = irVar_xxx9_p_base
    ARG irt3mP21
    irt3mP19 = CALL factorial
    irt3mP23 = irVar_xxx9_p_base
    irt3mP24 = irVar_xxx10_p_num
    irt3mP22 = irt3mP23 - irt3mP24
    ARG irt3mP22
    irt3mP20 = CALL factorial
    irt3mP18 = irt3mP19 / irt3mP20
    RETURN irt3mP18
FUNCTION main : 
    zero = #0
    irVar_xxx13_n = CALL read
    irVar_xxx14_k = CALL read
    irt3mP26 = irVar_xxx13_n
    ARG irt3mP26
    irt3mP27 = irVar_xxx14_k
    ARG irt3mP27
    irt3mP25 = CALL cal_combiniation
    ARG irt3mP25
    CALL write
    irt3mP29 = irVar_xxx13_n
    ARG irt3mP29
    irt3mP30 = irVar_xxx14_k
    ARG irt3mP30
    irt3mP28 = CALL cal_permutation
    ARG irt3mP28
    CALL write
    irt3mP31 = #0
    RETURN irt3mP31
