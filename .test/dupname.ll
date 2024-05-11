FUNCTION f : 
    zero = #0
    irVar_xxx4_a = #1
    irVar_xxx5_b = #2
    irVar_xxx6_b = #3
    irt3mP1 = irVar_xxx4_a
    irt3mP2 = irVar_xxx6_b
    irVar_xxx4_a = irt3mP1 + irt3mP2
    irVar_xxx7_b = #4
    irt3mP3 = irVar_xxx4_a
    irt3mP4 = irVar_xxx7_b
    irVar_xxx4_a = irt3mP3 + irt3mP4
    irt3mP5 = irVar_xxx4_a
    irt3mP6 = irVar_xxx5_b
    irVar_xxx4_a = irt3mP5 + irt3mP6
    irt3mP7 = irVar_xxx4_a
    RETURN irt3mP7
FUNCTION main : 
    zero = #0
    irt3mP8 = CALL f
    ARG irt3mP8
    CALL write
    irt3mP9 = #0
    RETURN irt3mP9
