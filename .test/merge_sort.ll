FUNCTION main : 
    zero = #0
    irVar_xxx4_n = #5
    DEC irVar_xxx5_arr #20
    DEC irVar_xxx6_tmp #20
    irVar_xxx7_i = #0
LABEL L1 :
    irt3mP1 = irVar_xxx7_i
    irt3mP2 = irVar_xxx4_n
    IF irt3mP1 < irt3mP2 GOTO L2
    GOTO  L3
LABEL L2 :
    irt3mP3 = irVar_xxx5_arr
    irt3mP4 = irVar_xxx7_i
    irt3mP5 = #4
    irt3mP4 = irt3mP4 * irt3mP5
    irt3mP3 = irt3mP3 + irt3mP4
    irt3mP6 = CALL read
    *irt3mP3 = irt3mP6
    irt3mP7 = irVar_xxx7_i
    irt3mP8 = #1
    irVar_xxx7_i = irt3mP7 + irt3mP8
    GOTO  L1
LABEL L3 :
    irVar_xxx8_intv = #1
LABEL L4 :
    irt3mP9 = irVar_xxx8_intv
    irt3mP10 = irVar_xxx4_n
    IF irt3mP9 < irt3mP10 GOTO L5
    GOTO  L6
LABEL L5 :
    irVar_xxx7_i = #0
LABEL L7 :
    irt3mP11 = irVar_xxx7_i
    irt3mP13 = irVar_xxx4_n
    irt3mP15 = #2
    irt3mP16 = irVar_xxx8_intv
    irt3mP14 = irt3mP15 * irt3mP16
    irt3mP12 = irt3mP13 - irt3mP14
    IF irt3mP11 <= irt3mP12 GOTO L8
    GOTO  L9
LABEL L8 :
    irVar_xxx9_s1 = irVar_xxx7_i
    irt3mP17 = irVar_xxx9_s1
    irt3mP18 = irVar_xxx8_intv
    irVar_xxx10_e1 = irt3mP17 + irt3mP18
    irVar_xxx11_cur1 = irVar_xxx9_s1
    irVar_xxx12_s2 = irVar_xxx10_e1
    irt3mP19 = irVar_xxx12_s2
    irt3mP20 = irVar_xxx8_intv
    irVar_xxx13_e2 = irt3mP19 + irt3mP20
    irVar_xxx14_cur2 = irVar_xxx12_s2
LABEL L10 :
    irt3mP21 = irVar_xxx11_cur1
    irt3mP22 = irVar_xxx10_e1
    IF irt3mP21 < irt3mP22 GOTO L13
    GOTO  L12
LABEL L13 :
    irt3mP23 = irVar_xxx14_cur2
    irt3mP24 = irVar_xxx13_e2
    IF irt3mP23 < irt3mP24 GOTO L11
    GOTO  L12
LABEL L11 :
    irt3mP27 = irVar_xxx5_arr
    irt3mP28 = irVar_xxx11_cur1
    irt3mP29 = #4
    irt3mP28 = irt3mP28 * irt3mP29
    irt3mP27 = irt3mP27 + irt3mP28
    irt3mP25 = *irt3mP27
    irt3mP30 = irVar_xxx5_arr
    irt3mP31 = irVar_xxx14_cur2
    irt3mP32 = #4
    irt3mP31 = irt3mP31 * irt3mP32
    irt3mP30 = irt3mP30 + irt3mP31
    irt3mP26 = *irt3mP30
    IF irt3mP25 < irt3mP26 GOTO L14
    GOTO  L15
LABEL L14 :
    irt3mP33 = irVar_xxx6_tmp
    irt3mP34 = irVar_xxx7_i
    irt3mP35 = #4
    irt3mP34 = irt3mP34 * irt3mP35
    irt3mP33 = irt3mP33 + irt3mP34
    irt3mP37 = irVar_xxx5_arr
    irt3mP38 = irVar_xxx11_cur1
    irt3mP39 = #4
    irt3mP38 = irt3mP38 * irt3mP39
    irt3mP37 = irt3mP37 + irt3mP38
    irt3mP36 = *irt3mP37
    *irt3mP33 = irt3mP36
    irt3mP40 = irVar_xxx11_cur1
    irt3mP41 = #1
    irVar_xxx11_cur1 = irt3mP40 + irt3mP41
    GOTO  L16
LABEL L15 :
    irt3mP42 = irVar_xxx6_tmp
    irt3mP43 = irVar_xxx7_i
    irt3mP44 = #4
    irt3mP43 = irt3mP43 * irt3mP44
    irt3mP42 = irt3mP42 + irt3mP43
    irt3mP46 = irVar_xxx5_arr
    irt3mP47 = irVar_xxx14_cur2
    irt3mP48 = #4
    irt3mP47 = irt3mP47 * irt3mP48
    irt3mP46 = irt3mP46 + irt3mP47
    irt3mP45 = *irt3mP46
    *irt3mP42 = irt3mP45
    irt3mP49 = irVar_xxx14_cur2
    irt3mP50 = #1
    irVar_xxx14_cur2 = irt3mP49 + irt3mP50
LABEL L16 :
    irt3mP51 = irVar_xxx7_i
    irt3mP52 = #1
    irVar_xxx7_i = irt3mP51 + irt3mP52
    GOTO  L10
LABEL L12 :
LABEL L17 :
    irt3mP53 = irVar_xxx11_cur1
    irt3mP54 = irVar_xxx10_e1
    IF irt3mP53 < irt3mP54 GOTO L18
    GOTO  L19
LABEL L18 :
    irt3mP55 = irVar_xxx6_tmp
    irt3mP56 = irVar_xxx7_i
    irt3mP57 = #4
    irt3mP56 = irt3mP56 * irt3mP57
    irt3mP55 = irt3mP55 + irt3mP56
    irt3mP59 = irVar_xxx5_arr
    irt3mP60 = irVar_xxx11_cur1
    irt3mP61 = #4
    irt3mP60 = irt3mP60 * irt3mP61
    irt3mP59 = irt3mP59 + irt3mP60
    irt3mP58 = *irt3mP59
    *irt3mP55 = irt3mP58
    irt3mP62 = irVar_xxx11_cur1
    irt3mP63 = #1
    irVar_xxx11_cur1 = irt3mP62 + irt3mP63
    irt3mP64 = irVar_xxx7_i
    irt3mP65 = #1
    irVar_xxx7_i = irt3mP64 + irt3mP65
    GOTO  L17
LABEL L19 :
LABEL L20 :
    irt3mP66 = irVar_xxx14_cur2
    irt3mP67 = irVar_xxx13_e2
    IF irt3mP66 < irt3mP67 GOTO L21
    GOTO  L22
LABEL L21 :
    irt3mP68 = irVar_xxx6_tmp
    irt3mP69 = irVar_xxx7_i
    irt3mP70 = #4
    irt3mP69 = irt3mP69 * irt3mP70
    irt3mP68 = irt3mP68 + irt3mP69
    irt3mP72 = irVar_xxx5_arr
    irt3mP73 = irVar_xxx14_cur2
    irt3mP74 = #4
    irt3mP73 = irt3mP73 * irt3mP74
    irt3mP72 = irt3mP72 + irt3mP73
    irt3mP71 = *irt3mP72
    *irt3mP68 = irt3mP71
    irt3mP75 = irVar_xxx14_cur2
    irt3mP76 = #1
    irVar_xxx14_cur2 = irt3mP75 + irt3mP76
    irt3mP77 = irVar_xxx7_i
    irt3mP78 = #1
    irVar_xxx7_i = irt3mP77 + irt3mP78
    GOTO  L20
LABEL L22 :
    GOTO  L7
LABEL L9 :
    irt3mP81 = irVar_xxx7_i
    irt3mP82 = irVar_xxx8_intv
    irt3mP79 = irt3mP81 + irt3mP82
    irt3mP80 = irVar_xxx4_n
    IF irt3mP79 < irt3mP80 GOTO L23
    GOTO  L24
LABEL L23 :
    irVar_xxx9_s1 = irVar_xxx7_i
    irt3mP83 = irVar_xxx9_s1
    irt3mP84 = irVar_xxx8_intv
    irVar_xxx10_e1 = irt3mP83 + irt3mP84
    irVar_xxx11_cur1 = irVar_xxx9_s1
    irVar_xxx12_s2 = irVar_xxx10_e1
    irVar_xxx13_e2 = irVar_xxx4_n
    irVar_xxx14_cur2 = irVar_xxx12_s2
LABEL L26 :
    irt3mP85 = irVar_xxx11_cur1
    irt3mP86 = irVar_xxx10_e1
    IF irt3mP85 < irt3mP86 GOTO L29
    GOTO  L28
LABEL L29 :
    irt3mP87 = irVar_xxx14_cur2
    irt3mP88 = irVar_xxx13_e2
    IF irt3mP87 < irt3mP88 GOTO L27
    GOTO  L28
LABEL L27 :
    irt3mP91 = irVar_xxx5_arr
    irt3mP92 = irVar_xxx11_cur1
    irt3mP93 = #4
    irt3mP92 = irt3mP92 * irt3mP93
    irt3mP91 = irt3mP91 + irt3mP92
    irt3mP89 = *irt3mP91
    irt3mP94 = irVar_xxx5_arr
    irt3mP95 = irVar_xxx14_cur2
    irt3mP96 = #4
    irt3mP95 = irt3mP95 * irt3mP96
    irt3mP94 = irt3mP94 + irt3mP95
    irt3mP90 = *irt3mP94
    IF irt3mP89 < irt3mP90 GOTO L30
    GOTO  L31
LABEL L30 :
    irt3mP97 = irVar_xxx6_tmp
    irt3mP98 = irVar_xxx7_i
    irt3mP99 = #4
    irt3mP98 = irt3mP98 * irt3mP99
    irt3mP97 = irt3mP97 + irt3mP98
    irt3mP101 = irVar_xxx5_arr
    irt3mP102 = irVar_xxx11_cur1
    irt3mP103 = #4
    irt3mP102 = irt3mP102 * irt3mP103
    irt3mP101 = irt3mP101 + irt3mP102
    irt3mP100 = *irt3mP101
    *irt3mP97 = irt3mP100
    irt3mP104 = irVar_xxx11_cur1
    irt3mP105 = #1
    irVar_xxx11_cur1 = irt3mP104 + irt3mP105
    irt3mP106 = irVar_xxx7_i
    irt3mP107 = #1
    irVar_xxx7_i = irt3mP106 + irt3mP107
    GOTO  L32
LABEL L31 :
    irt3mP108 = irVar_xxx6_tmp
    irt3mP109 = irVar_xxx7_i
    irt3mP110 = #4
    irt3mP109 = irt3mP109 * irt3mP110
    irt3mP108 = irt3mP108 + irt3mP109
    irt3mP112 = irVar_xxx5_arr
    irt3mP113 = irVar_xxx14_cur2
    irt3mP114 = #4
    irt3mP113 = irt3mP113 * irt3mP114
    irt3mP112 = irt3mP112 + irt3mP113
    irt3mP111 = *irt3mP112
    *irt3mP108 = irt3mP111
    irt3mP115 = irVar_xxx14_cur2
    irt3mP116 = #1
    irVar_xxx14_cur2 = irt3mP115 + irt3mP116
    irt3mP117 = irVar_xxx7_i
    irt3mP118 = #1
    irVar_xxx7_i = irt3mP117 + irt3mP118
LABEL L32 :
    GOTO  L26
LABEL L28 :
LABEL L33 :
    irt3mP119 = irVar_xxx11_cur1
    irt3mP120 = irVar_xxx10_e1
    IF irt3mP119 < irt3mP120 GOTO L34
    GOTO  L35
LABEL L34 :
    irt3mP121 = irVar_xxx6_tmp
    irt3mP122 = irVar_xxx7_i
    irt3mP123 = #4
    irt3mP122 = irt3mP122 * irt3mP123
    irt3mP121 = irt3mP121 + irt3mP122
    irt3mP125 = irVar_xxx5_arr
    irt3mP126 = irVar_xxx11_cur1
    irt3mP127 = #4
    irt3mP126 = irt3mP126 * irt3mP127
    irt3mP125 = irt3mP125 + irt3mP126
    irt3mP124 = *irt3mP125
    *irt3mP121 = irt3mP124
    irt3mP128 = irVar_xxx11_cur1
    irt3mP129 = #1
    irVar_xxx11_cur1 = irt3mP128 + irt3mP129
    irt3mP130 = irVar_xxx7_i
    irt3mP131 = #1
    irVar_xxx7_i = irt3mP130 + irt3mP131
    GOTO  L33
LABEL L35 :
LABEL L36 :
    irt3mP132 = irVar_xxx14_cur2
    irt3mP133 = irVar_xxx13_e2
    IF irt3mP132 < irt3mP133 GOTO L37
    GOTO  L38
LABEL L37 :
    irt3mP134 = irVar_xxx6_tmp
    irt3mP135 = irVar_xxx7_i
    irt3mP136 = #4
    irt3mP135 = irt3mP135 * irt3mP136
    irt3mP134 = irt3mP134 + irt3mP135
    irt3mP138 = irVar_xxx5_arr
    irt3mP139 = irVar_xxx14_cur2
    irt3mP140 = #4
    irt3mP139 = irt3mP139 * irt3mP140
    irt3mP138 = irt3mP138 + irt3mP139
    irt3mP137 = *irt3mP138
    *irt3mP134 = irt3mP137
    irt3mP141 = irVar_xxx14_cur2
    irt3mP142 = #1
    irVar_xxx14_cur2 = irt3mP141 + irt3mP142
    irt3mP143 = irVar_xxx7_i
    irt3mP144 = #1
    irVar_xxx7_i = irt3mP143 + irt3mP144
    GOTO  L36
LABEL L38 :
    GOTO  L25
LABEL L24 :
LABEL L39 :
    irt3mP145 = irVar_xxx7_i
    irt3mP146 = irVar_xxx4_n
    IF irt3mP145 < irt3mP146 GOTO L40
    GOTO  L41
LABEL L40 :
    irt3mP147 = irVar_xxx6_tmp
    irt3mP148 = irVar_xxx7_i
    irt3mP149 = #4
    irt3mP148 = irt3mP148 * irt3mP149
    irt3mP147 = irt3mP147 + irt3mP148
    irt3mP151 = irVar_xxx5_arr
    irt3mP152 = irVar_xxx7_i
    irt3mP153 = #4
    irt3mP152 = irt3mP152 * irt3mP153
    irt3mP151 = irt3mP151 + irt3mP152
    irt3mP150 = *irt3mP151
    *irt3mP147 = irt3mP150
    irt3mP154 = irVar_xxx7_i
    irt3mP155 = #1
    irVar_xxx7_i = irt3mP154 + irt3mP155
    GOTO  L39
LABEL L41 :
LABEL L25 :
    irVar_xxx7_i = #0
LABEL L42 :
    irt3mP156 = irVar_xxx7_i
    irt3mP157 = irVar_xxx4_n
    IF irt3mP156 < irt3mP157 GOTO L43
    GOTO  L44
LABEL L43 :
    irt3mP158 = irVar_xxx5_arr
    irt3mP159 = irVar_xxx7_i
    irt3mP160 = #4
    irt3mP159 = irt3mP159 * irt3mP160
    irt3mP158 = irt3mP158 + irt3mP159
    irt3mP162 = irVar_xxx6_tmp
    irt3mP163 = irVar_xxx7_i
    irt3mP164 = #4
    irt3mP163 = irt3mP163 * irt3mP164
    irt3mP162 = irt3mP162 + irt3mP163
    irt3mP161 = *irt3mP162
    *irt3mP158 = irt3mP161
    irt3mP165 = irVar_xxx7_i
    irt3mP166 = #1
    irVar_xxx7_i = irt3mP165 + irt3mP166
    GOTO  L42
LABEL L44 :
    irt3mP167 = irVar_xxx8_intv
    irt3mP168 = #2
    irVar_xxx8_intv = irt3mP167 * irt3mP168
    GOTO  L4
LABEL L6 :
    irVar_xxx7_i = #0
LABEL L45 :
    irt3mP169 = irVar_xxx7_i
    irt3mP170 = irVar_xxx4_n
    IF irt3mP169 < irt3mP170 GOTO L46
    GOTO  L47
LABEL L46 :
    irt3mP172 = irVar_xxx5_arr
    irt3mP173 = irVar_xxx7_i
    irt3mP174 = #4
    irt3mP173 = irt3mP173 * irt3mP174
    irt3mP172 = irt3mP172 + irt3mP173
    irt3mP171 = *irt3mP172
    ARG irt3mP171
    CALL write
    irt3mP175 = irVar_xxx7_i
    irt3mP176 = #1
    irVar_xxx7_i = irt3mP175 + irt3mP176
    GOTO  L45
LABEL L47 :
    irt3mP177 = #0
    RETURN irt3mP177
