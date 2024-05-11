GLOBAL irVar_xxx3_a:
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
FUNCTION check_sudoku : 
    PARAM irVar_xxx4_a
    zero = #0
    DEC irVar_xxx9_b #36
    irVar_xxx6_i = #0
LABEL L1 :
    irt3mP1 = irVar_xxx6_i
    irt3mP2 = #9
    IF irt3mP1 < irt3mP2 GOTO L2
    GOTO  L3
LABEL L2 :
    irVar_xxx7_j = #0
LABEL L4 :
    irt3mP3 = irVar_xxx7_j
    irt3mP4 = #9
    IF irt3mP3 < irt3mP4 GOTO L5
    GOTO  L6
LABEL L5 :
    irt3mP5 = irVar_xxx9_b
    irt3mP6 = irVar_xxx7_j
    irt3mP7 = #4
    irt3mP6 = irt3mP6 * irt3mP7
    irt3mP5 = irt3mP5 + irt3mP6
    irt3mP8 = #0
    *irt3mP5 = irt3mP8
    irt3mP9 = irVar_xxx7_j
    irt3mP10 = #1
    irVar_xxx7_j = irt3mP9 + irt3mP10
    GOTO  L4
LABEL L6 :
    irVar_xxx7_j = #0
LABEL L7 :
    irt3mP11 = irVar_xxx7_j
    irt3mP12 = #9
    IF irt3mP11 < irt3mP12 GOTO L8
    GOTO  L9
LABEL L8 :
    irt3mP14 = irVar_xxx4_a
    irt3mP15 = irVar_xxx6_i
    irt3mP16 = #36
    irt3mP15 = irt3mP15 * irt3mP16
    irt3mP14 = irt3mP14 + irt3mP15
    irt3mP17 = irVar_xxx7_j
    irt3mP18 = #4
    irt3mP17 = irt3mP17 * irt3mP18
    irt3mP14 = irt3mP14 + irt3mP17
    irt3mP13 = *irt3mP14
    IF irt3mP13 != zero GOTO L10
    GOTO  L11
LABEL L10 :
    irt3mP21 = irVar_xxx9_b
    irt3mP26 = irVar_xxx4_a
    irt3mP27 = irVar_xxx6_i
    irt3mP28 = #36
    irt3mP27 = irt3mP27 * irt3mP28
    irt3mP26 = irt3mP26 + irt3mP27
    irt3mP29 = irVar_xxx7_j
    irt3mP30 = #4
    irt3mP29 = irt3mP29 * irt3mP30
    irt3mP26 = irt3mP26 + irt3mP29
    irt3mP24 = *irt3mP26
    irt3mP25 = #1
    irt3mP22 = irt3mP24 - irt3mP25
    irt3mP23 = #4
    irt3mP22 = irt3mP22 * irt3mP23
    irt3mP21 = irt3mP21 + irt3mP22
    irt3mP20 = *irt3mP21
    irt3mP31 = #0
    irt3mP19 = #0
    IF irt3mP20 != irt3mP31 GOTO L15
    irt3mP19 = #1
LABEL L15 :
    IF irt3mP19 != zero GOTO L12
    GOTO  L13
LABEL L12 :
    irt3mP32 = irVar_xxx9_b
    irt3mP37 = irVar_xxx4_a
    irt3mP38 = irVar_xxx6_i
    irt3mP39 = #36
    irt3mP38 = irt3mP38 * irt3mP39
    irt3mP37 = irt3mP37 + irt3mP38
    irt3mP40 = irVar_xxx7_j
    irt3mP41 = #4
    irt3mP40 = irt3mP40 * irt3mP41
    irt3mP37 = irt3mP37 + irt3mP40
    irt3mP35 = *irt3mP37
    irt3mP36 = #1
    irt3mP33 = irt3mP35 - irt3mP36
    irt3mP34 = #4
    irt3mP33 = irt3mP33 * irt3mP34
    irt3mP32 = irt3mP32 + irt3mP33
    irt3mP42 = #1
    *irt3mP32 = irt3mP42
    GOTO  L14
LABEL L13 :
    irt3mP43 = #0
    RETURN irt3mP43
LABEL L14 :
LABEL L11 :
    irt3mP44 = irVar_xxx7_j
    irt3mP45 = #1
    irVar_xxx7_j = irt3mP44 + irt3mP45
    GOTO  L7
LABEL L9 :
    irt3mP46 = irVar_xxx6_i
    irt3mP47 = #1
    irVar_xxx6_i = irt3mP46 + irt3mP47
    GOTO  L1
LABEL L3 :
    irVar_xxx6_i = #0
LABEL L16 :
    irt3mP48 = irVar_xxx6_i
    irt3mP49 = #9
    IF irt3mP48 < irt3mP49 GOTO L17
    GOTO  L18
LABEL L17 :
    irVar_xxx7_j = #0
LABEL L19 :
    irt3mP50 = irVar_xxx7_j
    irt3mP51 = #9
    IF irt3mP50 < irt3mP51 GOTO L20
    GOTO  L21
LABEL L20 :
    irt3mP52 = irVar_xxx9_b
    irt3mP53 = irVar_xxx7_j
    irt3mP54 = #4
    irt3mP53 = irt3mP53 * irt3mP54
    irt3mP52 = irt3mP52 + irt3mP53
    irt3mP55 = #0
    *irt3mP52 = irt3mP55
    irt3mP56 = irVar_xxx7_j
    irt3mP57 = #1
    irVar_xxx7_j = irt3mP56 + irt3mP57
    GOTO  L19
LABEL L21 :
    irVar_xxx7_j = #0
LABEL L22 :
    irt3mP58 = irVar_xxx7_j
    irt3mP59 = #9
    IF irt3mP58 < irt3mP59 GOTO L23
    GOTO  L24
LABEL L23 :
    irt3mP61 = irVar_xxx4_a
    irt3mP62 = irVar_xxx7_j
    irt3mP63 = #36
    irt3mP62 = irt3mP62 * irt3mP63
    irt3mP61 = irt3mP61 + irt3mP62
    irt3mP64 = irVar_xxx6_i
    irt3mP65 = #4
    irt3mP64 = irt3mP64 * irt3mP65
    irt3mP61 = irt3mP61 + irt3mP64
    irt3mP60 = *irt3mP61
    IF irt3mP60 != zero GOTO L25
    GOTO  L26
LABEL L25 :
    irt3mP68 = irVar_xxx9_b
    irt3mP73 = irVar_xxx4_a
    irt3mP74 = irVar_xxx7_j
    irt3mP75 = #36
    irt3mP74 = irt3mP74 * irt3mP75
    irt3mP73 = irt3mP73 + irt3mP74
    irt3mP76 = irVar_xxx6_i
    irt3mP77 = #4
    irt3mP76 = irt3mP76 * irt3mP77
    irt3mP73 = irt3mP73 + irt3mP76
    irt3mP71 = *irt3mP73
    irt3mP72 = #1
    irt3mP69 = irt3mP71 - irt3mP72
    irt3mP70 = #4
    irt3mP69 = irt3mP69 * irt3mP70
    irt3mP68 = irt3mP68 + irt3mP69
    irt3mP67 = *irt3mP68
    irt3mP78 = #0
    irt3mP66 = #0
    IF irt3mP67 != irt3mP78 GOTO L30
    irt3mP66 = #1
LABEL L30 :
    IF irt3mP66 != zero GOTO L27
    GOTO  L28
LABEL L27 :
    irt3mP79 = irVar_xxx9_b
    irt3mP84 = irVar_xxx4_a
    irt3mP85 = irVar_xxx7_j
    irt3mP86 = #36
    irt3mP85 = irt3mP85 * irt3mP86
    irt3mP84 = irt3mP84 + irt3mP85
    irt3mP87 = irVar_xxx6_i
    irt3mP88 = #4
    irt3mP87 = irt3mP87 * irt3mP88
    irt3mP84 = irt3mP84 + irt3mP87
    irt3mP82 = *irt3mP84
    irt3mP83 = #1
    irt3mP80 = irt3mP82 - irt3mP83
    irt3mP81 = #4
    irt3mP80 = irt3mP80 * irt3mP81
    irt3mP79 = irt3mP79 + irt3mP80
    irt3mP89 = #1
    *irt3mP79 = irt3mP89
    GOTO  L29
LABEL L28 :
    irt3mP90 = #0
    RETURN irt3mP90
LABEL L29 :
LABEL L26 :
    irt3mP91 = irVar_xxx7_j
    irt3mP92 = #1
    irVar_xxx7_j = irt3mP91 + irt3mP92
    GOTO  L22
LABEL L24 :
    irt3mP93 = irVar_xxx6_i
    irt3mP94 = #1
    irVar_xxx6_i = irt3mP93 + irt3mP94
    GOTO  L16
LABEL L18 :
    irVar_xxx6_i = #0
LABEL L31 :
    irt3mP95 = irVar_xxx6_i
    irt3mP96 = #3
    IF irt3mP95 < irt3mP96 GOTO L32
    GOTO  L33
LABEL L32 :
    irVar_xxx7_j = #0
LABEL L34 :
    irt3mP97 = irVar_xxx7_j
    irt3mP98 = #3
    IF irt3mP97 < irt3mP98 GOTO L35
    GOTO  L36
LABEL L35 :
    irVar_xxx8_k = #0
LABEL L37 :
    irt3mP99 = irVar_xxx8_k
    irt3mP100 = #9
    IF irt3mP99 < irt3mP100 GOTO L38
    GOTO  L39
LABEL L38 :
    irt3mP101 = irVar_xxx9_b
    irt3mP102 = irVar_xxx8_k
    irt3mP103 = #4
    irt3mP102 = irt3mP102 * irt3mP103
    irt3mP101 = irt3mP101 + irt3mP102
    irt3mP104 = #0
    *irt3mP101 = irt3mP104
    irt3mP105 = irVar_xxx8_k
    irt3mP106 = #1
    irVar_xxx8_k = irt3mP105 + irt3mP106
    GOTO  L37
LABEL L39 :
    irVar_xxx8_k = #0
LABEL L40 :
    irt3mP107 = irVar_xxx8_k
    irt3mP108 = #3
    IF irt3mP107 < irt3mP108 GOTO L41
    GOTO  L42
LABEL L41 :
    irVar_xxx10_l = #0
LABEL L43 :
    irt3mP109 = irVar_xxx10_l
    irt3mP110 = #3
    IF irt3mP109 < irt3mP110 GOTO L44
    GOTO  L45
LABEL L44 :
    irt3mP111 = irVar_xxx4_a
    irt3mP116 = irVar_xxx6_i
    irt3mP117 = #3
    irt3mP114 = irt3mP116 * irt3mP117
    irt3mP115 = irVar_xxx8_k
    irt3mP112 = irt3mP114 + irt3mP115
    irt3mP113 = #36
    irt3mP112 = irt3mP112 * irt3mP113
    irt3mP111 = irt3mP111 + irt3mP112
    irt3mP122 = irVar_xxx7_j
    irt3mP123 = #3
    irt3mP120 = irt3mP122 * irt3mP123
    irt3mP121 = irVar_xxx10_l
    irt3mP118 = irt3mP120 + irt3mP121
    irt3mP119 = #4
    irt3mP118 = irt3mP118 * irt3mP119
    irt3mP111 = irt3mP111 + irt3mP118
    irVar_xxx11_m = *irt3mP111
    irt3mP124 = irVar_xxx11_m
    IF irt3mP124 != zero GOTO L46
    GOTO  L47
LABEL L46 :
    irt3mP127 = irVar_xxx9_b
    irt3mP130 = irVar_xxx11_m
    irt3mP131 = #1
    irt3mP128 = irt3mP130 - irt3mP131
    irt3mP129 = #4
    irt3mP128 = irt3mP128 * irt3mP129
    irt3mP127 = irt3mP127 + irt3mP128
    irt3mP126 = *irt3mP127
    irt3mP132 = #0
    irt3mP125 = #0
    IF irt3mP126 != irt3mP132 GOTO L51
    irt3mP125 = #1
LABEL L51 :
    IF irt3mP125 != zero GOTO L48
    GOTO  L49
LABEL L48 :
    irt3mP133 = irVar_xxx9_b
    irt3mP136 = irVar_xxx11_m
    irt3mP137 = #1
    irt3mP134 = irt3mP136 - irt3mP137
    irt3mP135 = #4
    irt3mP134 = irt3mP134 * irt3mP135
    irt3mP133 = irt3mP133 + irt3mP134
    irt3mP138 = #1
    *irt3mP133 = irt3mP138
    GOTO  L50
LABEL L49 :
    irt3mP139 = #0
    RETURN irt3mP139
LABEL L50 :
LABEL L47 :
    irt3mP140 = irVar_xxx10_l
    irt3mP141 = #1
    irVar_xxx10_l = irt3mP140 + irt3mP141
    GOTO  L43
LABEL L45 :
    irt3mP142 = irVar_xxx8_k
    irt3mP143 = #1
    irVar_xxx8_k = irt3mP142 + irt3mP143
    GOTO  L40
LABEL L42 :
    irt3mP144 = irVar_xxx7_j
    irt3mP145 = #1
    irVar_xxx7_j = irt3mP144 + irt3mP145
    GOTO  L34
LABEL L36 :
    irt3mP146 = irVar_xxx6_i
    irt3mP147 = #1
    irVar_xxx6_i = irt3mP146 + irt3mP147
    GOTO  L31
LABEL L33 :
    irt3mP148 = #1
    RETURN irt3mP148
FUNCTION solve_sudoku : 
    zero = #0
    irVar_xxx17_done = #1
    irVar_xxx13_i = #0
LABEL L52 :
    irt3mP149 = irVar_xxx13_i
    irt3mP150 = #9
    IF irt3mP149 < irt3mP150 GOTO L55
    GOTO  L54
LABEL L55 :
    irt3mP151 = irVar_xxx17_done
    IF irt3mP151 != zero GOTO L53
    GOTO  L54
LABEL L53 :
    irVar_xxx14_j = #0
LABEL L56 :
    irt3mP152 = irVar_xxx14_j
    irt3mP153 = #9
    IF irt3mP152 < irt3mP153 GOTO L59
    GOTO  L58
LABEL L59 :
    irt3mP154 = irVar_xxx17_done
    IF irt3mP154 != zero GOTO L57
    GOTO  L58
LABEL L57 :
    irt3mP157 = &irVar_xxx3_a
    irt3mP158 = irVar_xxx13_i
    irt3mP159 = #36
    irt3mP158 = irt3mP158 * irt3mP159
    irt3mP157 = irt3mP157 + irt3mP158
    irt3mP160 = irVar_xxx14_j
    irt3mP161 = #4
    irt3mP160 = irt3mP160 * irt3mP161
    irt3mP157 = irt3mP157 + irt3mP160
    irt3mP155 = *irt3mP157
    irt3mP156 = #0
    IF irt3mP155 == irt3mP156 GOTO L60
    GOTO  L61
LABEL L60 :
    irVar_xxx17_done = #0
    irVar_xxx15_solve_i = irVar_xxx13_i
    irVar_xxx16_solve_j = irVar_xxx14_j
LABEL L61 :
    irt3mP162 = irVar_xxx14_j
    irt3mP163 = #1
    irVar_xxx14_j = irt3mP162 + irt3mP163
    GOTO  L56
LABEL L58 :
    irt3mP164 = irVar_xxx13_i
    irt3mP165 = #1
    irVar_xxx13_i = irt3mP164 + irt3mP165
    GOTO  L52
LABEL L54 :
    irt3mP166 = irVar_xxx17_done
    IF irt3mP166 != zero GOTO L62
    GOTO  L63
LABEL L62 :
    irt3mP169 = &irVar_xxx3_a
    irt3mP168 = irt3mP169
    ARG irt3mP168
    irt3mP167 = CALL check_sudoku
    RETURN irt3mP167
LABEL L63 :
    irVar_xxx13_i = #1
LABEL L64 :
    irt3mP170 = irVar_xxx13_i
    irt3mP171 = #9
    IF irt3mP170 <= irt3mP171 GOTO L65
    GOTO  L66
LABEL L65 :
    irt3mP172 = &irVar_xxx3_a
    irt3mP173 = irVar_xxx15_solve_i
    irt3mP174 = #36
    irt3mP173 = irt3mP173 * irt3mP174
    irt3mP172 = irt3mP172 + irt3mP173
    irt3mP175 = irVar_xxx16_solve_j
    irt3mP176 = #4
    irt3mP175 = irt3mP175 * irt3mP176
    irt3mP172 = irt3mP172 + irt3mP175
    irt3mP177 = irVar_xxx13_i
    *irt3mP172 = irt3mP177
    irt3mP180 = &irVar_xxx3_a
    irt3mP179 = irt3mP180
    ARG irt3mP179
    irt3mP178 = CALL check_sudoku
    IF irt3mP178 != zero GOTO L67
    GOTO  L68
LABEL L67 :
    irt3mP181 = CALL solve_sudoku
    IF irt3mP181 != zero GOTO L69
    GOTO  L70
LABEL L69 :
    irt3mP182 = #1
    RETURN irt3mP182
LABEL L70 :
LABEL L68 :
    irt3mP183 = irVar_xxx13_i
    irt3mP184 = #1
    irVar_xxx13_i = irt3mP183 + irt3mP184
    GOTO  L64
LABEL L66 :
    irt3mP185 = &irVar_xxx3_a
    irt3mP186 = irVar_xxx15_solve_i
    irt3mP187 = #36
    irt3mP186 = irt3mP186 * irt3mP187
    irt3mP185 = irt3mP185 + irt3mP186
    irt3mP188 = irVar_xxx16_solve_j
    irt3mP189 = #4
    irt3mP188 = irt3mP188 * irt3mP189
    irt3mP185 = irt3mP185 + irt3mP188
    irt3mP190 = #0
    *irt3mP185 = irt3mP190
    irt3mP191 = #0
    RETURN irt3mP191
FUNCTION main : 
    zero = #0
    irVar_xxx19_i = #0
    irVar_xxx20_j = #0
    irVar_xxx21_solve = #0
LABEL L71 :
    irt3mP192 = irVar_xxx19_i
    irt3mP193 = #9
    IF irt3mP192 < irt3mP193 GOTO L72
    GOTO  L73
LABEL L72 :
    irVar_xxx20_j = #0
LABEL L74 :
    irt3mP194 = irVar_xxx20_j
    irt3mP195 = #9
    IF irt3mP194 < irt3mP195 GOTO L75
    GOTO  L76
LABEL L75 :
    irt3mP196 = &irVar_xxx3_a
    irt3mP197 = irVar_xxx19_i
    irt3mP198 = #36
    irt3mP197 = irt3mP197 * irt3mP198
    irt3mP196 = irt3mP196 + irt3mP197
    irt3mP199 = irVar_xxx20_j
    irt3mP200 = #4
    irt3mP199 = irt3mP199 * irt3mP200
    irt3mP196 = irt3mP196 + irt3mP199
    irt3mP201 = CALL read
    *irt3mP196 = irt3mP201
    irt3mP204 = &irVar_xxx3_a
    irt3mP205 = irVar_xxx19_i
    irt3mP206 = #36
    irt3mP205 = irt3mP205 * irt3mP206
    irt3mP204 = irt3mP204 + irt3mP205
    irt3mP207 = irVar_xxx20_j
    irt3mP208 = #4
    irt3mP207 = irt3mP207 * irt3mP208
    irt3mP204 = irt3mP204 + irt3mP207
    irt3mP202 = *irt3mP204
    irt3mP203 = #0
    IF irt3mP202 < irt3mP203 GOTO L77
    GOTO  L80
LABEL L80 :
    irt3mP211 = &irVar_xxx3_a
    irt3mP212 = irVar_xxx19_i
    irt3mP213 = #36
    irt3mP212 = irt3mP212 * irt3mP213
    irt3mP211 = irt3mP211 + irt3mP212
    irt3mP214 = irVar_xxx20_j
    irt3mP215 = #4
    irt3mP214 = irt3mP214 * irt3mP215
    irt3mP211 = irt3mP211 + irt3mP214
    irt3mP209 = *irt3mP211
    irt3mP210 = #9
    IF irt3mP209 > irt3mP210 GOTO L77
    GOTO  L78
LABEL L77 :
    irt3mP216 = #0
    ARG irt3mP216
    CALL write
    irt3mP217 = #0
    RETURN irt3mP217
    GOTO  L79
LABEL L78 :
    irt3mP220 = &irVar_xxx3_a
    irt3mP221 = irVar_xxx19_i
    irt3mP222 = #36
    irt3mP221 = irt3mP221 * irt3mP222
    irt3mP220 = irt3mP220 + irt3mP221
    irt3mP223 = irVar_xxx20_j
    irt3mP224 = #4
    irt3mP223 = irt3mP223 * irt3mP224
    irt3mP220 = irt3mP220 + irt3mP223
    irt3mP218 = *irt3mP220
    irt3mP219 = #0
    IF irt3mP218 == irt3mP219 GOTO L81
    GOTO  L82
LABEL L81 :
    irVar_xxx21_solve = #1
LABEL L82 :
LABEL L79 :
    irt3mP225 = irVar_xxx20_j
    irt3mP226 = #1
    irVar_xxx20_j = irt3mP225 + irt3mP226
    GOTO  L74
LABEL L76 :
    irt3mP227 = irVar_xxx19_i
    irt3mP228 = #1
    irVar_xxx19_i = irt3mP227 + irt3mP228
    GOTO  L71
LABEL L73 :
    irt3mP229 = irVar_xxx21_solve
    IF irt3mP229 != zero GOTO L83
    GOTO  L84
LABEL L83 :
    irt3mP230 = CALL solve_sudoku
    IF irt3mP230 != zero GOTO L86
    GOTO  L87
LABEL L86 :
    irVar_xxx19_i = #0
LABEL L89 :
    irt3mP231 = irVar_xxx19_i
    irt3mP232 = #9
    IF irt3mP231 < irt3mP232 GOTO L90
    GOTO  L91
LABEL L90 :
    irVar_xxx20_j = #0
LABEL L92 :
    irt3mP233 = irVar_xxx20_j
    irt3mP234 = #9
    IF irt3mP233 < irt3mP234 GOTO L93
    GOTO  L94
LABEL L93 :
    irt3mP236 = &irVar_xxx3_a
    irt3mP237 = irVar_xxx19_i
    irt3mP238 = #36
    irt3mP237 = irt3mP237 * irt3mP238
    irt3mP236 = irt3mP236 + irt3mP237
    irt3mP239 = irVar_xxx20_j
    irt3mP240 = #4
    irt3mP239 = irt3mP239 * irt3mP240
    irt3mP236 = irt3mP236 + irt3mP239
    irt3mP235 = *irt3mP236
    ARG irt3mP235
    CALL write
    irt3mP241 = irVar_xxx20_j
    irt3mP242 = #1
    irVar_xxx20_j = irt3mP241 + irt3mP242
    GOTO  L92
LABEL L94 :
    irt3mP243 = irVar_xxx19_i
    irt3mP244 = #1
    irVar_xxx19_i = irt3mP243 + irt3mP244
    GOTO  L89
LABEL L91 :
    GOTO  L88
LABEL L87 :
    irt3mP245 = #0
    ARG irt3mP245
    CALL write
LABEL L88 :
    GOTO  L85
LABEL L84 :
    irt3mP248 = &irVar_xxx3_a
    irt3mP247 = irt3mP248
    ARG irt3mP247
    irt3mP246 = CALL check_sudoku
    IF irt3mP246 != zero GOTO L95
    GOTO  L96
LABEL L95 :
    irt3mP249 = #1
    ARG irt3mP249
    CALL write
    GOTO  L97
LABEL L96 :
    irt3mP250 = #0
    ARG irt3mP250
    CALL write
LABEL L97 :
LABEL L85 :
    irt3mP251 = #0
    RETURN irt3mP251
