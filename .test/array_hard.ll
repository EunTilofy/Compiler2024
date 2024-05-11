FUNCTION initW : 
    PARAM irVar_xxx3_w
    zero = #0
    irt3mP1 = irVar_xxx3_w
    irt3mP2 = #0
    irt3mP3 = #4
    irt3mP2 = irt3mP2 * irt3mP3
    irt3mP1 = irt3mP1 + irt3mP2
    irt3mP4 = #0
    *irt3mP1 = irt3mP4
    irt3mP5 = irVar_xxx3_w
    irt3mP6 = #1
    irt3mP7 = #4
    irt3mP6 = irt3mP6 * irt3mP7
    irt3mP5 = irt3mP5 + irt3mP6
    irt3mP8 = #1
    *irt3mP5 = irt3mP8
    irt3mP9 = irVar_xxx3_w
    irt3mP10 = #2
    irt3mP11 = #4
    irt3mP10 = irt3mP10 * irt3mP11
    irt3mP9 = irt3mP9 + irt3mP10
    irt3mP12 = #2
    *irt3mP9 = irt3mP12
    irt3mP13 = irVar_xxx3_w
    irt3mP14 = #3
    irt3mP15 = #4
    irt3mP14 = irt3mP14 * irt3mP15
    irt3mP13 = irt3mP13 + irt3mP14
    irt3mP16 = #5
    *irt3mP13 = irt3mP16
    irt3mP17 = irVar_xxx3_w
    irt3mP18 = #4
    irt3mP19 = #4
    irt3mP18 = irt3mP18 * irt3mP19
    irt3mP17 = irt3mP17 + irt3mP18
    irt3mP20 = #6
    *irt3mP17 = irt3mP20
    irt3mP21 = irVar_xxx3_w
    irt3mP22 = #5
    irt3mP23 = #4
    irt3mP22 = irt3mP22 * irt3mP23
    irt3mP21 = irt3mP21 + irt3mP22
    irt3mP24 = #7
    *irt3mP21 = irt3mP24
    irt3mP25 = #0
    RETURN irt3mP25
FUNCTION initV : 
    PARAM irVar_xxx5_v
    zero = #0
    irt3mP26 = irVar_xxx5_v
    irt3mP27 = #0
    irt3mP28 = #4
    irt3mP27 = irt3mP27 * irt3mP28
    irt3mP26 = irt3mP26 + irt3mP27
    irt3mP29 = #0
    *irt3mP26 = irt3mP29
    irt3mP30 = irVar_xxx5_v
    irt3mP31 = #1
    irt3mP32 = #4
    irt3mP31 = irt3mP31 * irt3mP32
    irt3mP30 = irt3mP30 + irt3mP31
    irt3mP33 = #1
    *irt3mP30 = irt3mP33
    irt3mP34 = irVar_xxx5_v
    irt3mP35 = #2
    irt3mP36 = #4
    irt3mP35 = irt3mP35 * irt3mP36
    irt3mP34 = irt3mP34 + irt3mP35
    irt3mP37 = #6
    *irt3mP34 = irt3mP37
    irt3mP38 = irVar_xxx5_v
    irt3mP39 = #3
    irt3mP40 = #4
    irt3mP39 = irt3mP39 * irt3mP40
    irt3mP38 = irt3mP38 + irt3mP39
    irt3mP41 = #18
    *irt3mP38 = irt3mP41
    irt3mP42 = irVar_xxx5_v
    irt3mP43 = #4
    irt3mP44 = #4
    irt3mP43 = irt3mP43 * irt3mP44
    irt3mP42 = irt3mP42 + irt3mP43
    irt3mP45 = #22
    *irt3mP42 = irt3mP45
    irt3mP46 = irVar_xxx5_v
    irt3mP47 = #5
    irt3mP48 = #4
    irt3mP47 = irt3mP47 * irt3mP48
    irt3mP46 = irt3mP46 + irt3mP47
    irt3mP49 = #28
    *irt3mP46 = irt3mP49
    irt3mP50 = #0
    RETURN irt3mP50
FUNCTION main : 
    zero = #0
    DEC irVar_xxx8_weight #24
    DEC irVar_xxx9_value #24
    DEC irVar_xxx10_results #288
    irt3mP52 = irVar_xxx8_weight
    irt3mP51 = irt3mP52
    ARG irt3mP51
    CALL initW
    irt3mP54 = irVar_xxx9_value
    irt3mP53 = irt3mP54
    ARG irt3mP53
    CALL initV
    irVar_xxx11_r_i = #0
LABEL L1 :
    irt3mP55 = irVar_xxx11_r_i
    irt3mP56 = #6
    IF irt3mP55 < irt3mP56 GOTO L2
    GOTO  L3
LABEL L2 :
    irVar_xxx12_r_j = #0
LABEL L4 :
    irt3mP57 = irVar_xxx12_r_j
    irt3mP58 = #12
    IF irt3mP57 < irt3mP58 GOTO L5
    GOTO  L6
LABEL L5 :
    irt3mP59 = irVar_xxx10_results
    irt3mP60 = irVar_xxx11_r_i
    irt3mP61 = #48
    irt3mP60 = irt3mP60 * irt3mP61
    irt3mP59 = irt3mP59 + irt3mP60
    irt3mP62 = irVar_xxx12_r_j
    irt3mP63 = #4
    irt3mP62 = irt3mP62 * irt3mP63
    irt3mP59 = irt3mP59 + irt3mP62
    irt3mP64 = #0
    *irt3mP59 = irt3mP64
    irt3mP65 = irVar_xxx12_r_j
    irt3mP66 = #1
    irVar_xxx12_r_j = irt3mP65 + irt3mP66
    GOTO  L4
LABEL L6 :
    irt3mP67 = irVar_xxx11_r_i
    irt3mP68 = #1
    irVar_xxx11_r_i = irt3mP67 + irt3mP68
    GOTO  L1
LABEL L3 :
    irVar_xxx13_ki = #1
LABEL L7 :
    irt3mP69 = irVar_xxx13_ki
    irt3mP70 = #6
    IF irt3mP69 < irt3mP70 GOTO L8
    GOTO  L9
LABEL L8 :
    irVar_xxx14_kj = #1
LABEL L10 :
    irt3mP71 = irVar_xxx14_kj
    irt3mP72 = #12
    IF irt3mP71 < irt3mP72 GOTO L11
    GOTO  L12
LABEL L11 :
    irt3mP73 = irVar_xxx14_kj
    irt3mP75 = irVar_xxx8_weight
    irt3mP76 = irVar_xxx13_ki
    irt3mP77 = #4
    irt3mP76 = irt3mP76 * irt3mP77
    irt3mP75 = irt3mP75 + irt3mP76
    irt3mP74 = *irt3mP75
    IF irt3mP73 < irt3mP74 GOTO L13
    GOTO  L14
LABEL L13 :
    irt3mP78 = irVar_xxx10_results
    irt3mP79 = irVar_xxx13_ki
    irt3mP80 = #48
    irt3mP79 = irt3mP79 * irt3mP80
    irt3mP78 = irt3mP78 + irt3mP79
    irt3mP81 = irVar_xxx14_kj
    irt3mP82 = #4
    irt3mP81 = irt3mP81 * irt3mP82
    irt3mP78 = irt3mP78 + irt3mP81
    irt3mP84 = irVar_xxx10_results
    irt3mP87 = irVar_xxx13_ki
    irt3mP88 = #1
    irt3mP85 = irt3mP87 - irt3mP88
    irt3mP86 = #48
    irt3mP85 = irt3mP85 * irt3mP86
    irt3mP84 = irt3mP84 + irt3mP85
    irt3mP89 = irVar_xxx14_kj
    irt3mP90 = #4
    irt3mP89 = irt3mP89 * irt3mP90
    irt3mP84 = irt3mP84 + irt3mP89
    irt3mP83 = *irt3mP84
    *irt3mP78 = irt3mP83
    GOTO  L15
LABEL L14 :
    irt3mP93 = irVar_xxx10_results
    irt3mP96 = irVar_xxx13_ki
    irt3mP97 = #1
    irt3mP94 = irt3mP96 - irt3mP97
    irt3mP95 = #48
    irt3mP94 = irt3mP94 * irt3mP95
    irt3mP93 = irt3mP93 + irt3mP94
    irt3mP98 = irVar_xxx14_kj
    irt3mP99 = #4
    irt3mP98 = irt3mP98 * irt3mP99
    irt3mP93 = irt3mP93 + irt3mP98
    irt3mP91 = *irt3mP93
    irt3mP102 = irVar_xxx9_value
    irt3mP103 = irVar_xxx13_ki
    irt3mP104 = #4
    irt3mP103 = irt3mP103 * irt3mP104
    irt3mP102 = irt3mP102 + irt3mP103
    irt3mP100 = *irt3mP102
    irt3mP105 = irVar_xxx10_results
    irt3mP108 = irVar_xxx13_ki
    irt3mP109 = #1
    irt3mP106 = irt3mP108 - irt3mP109
    irt3mP107 = #48
    irt3mP106 = irt3mP106 * irt3mP107
    irt3mP105 = irt3mP105 + irt3mP106
    irt3mP112 = irVar_xxx14_kj
    irt3mP114 = irVar_xxx8_weight
    irt3mP115 = irVar_xxx13_ki
    irt3mP116 = #4
    irt3mP115 = irt3mP115 * irt3mP116
    irt3mP114 = irt3mP114 + irt3mP115
    irt3mP113 = *irt3mP114
    irt3mP110 = irt3mP112 - irt3mP113
    irt3mP111 = #4
    irt3mP110 = irt3mP110 * irt3mP111
    irt3mP105 = irt3mP105 + irt3mP110
    irt3mP101 = *irt3mP105
    irt3mP92 = irt3mP100 + irt3mP101
    IF irt3mP91 > irt3mP92 GOTO L16
    GOTO  L17
LABEL L16 :
    irt3mP117 = irVar_xxx10_results
    irt3mP118 = irVar_xxx13_ki
    irt3mP119 = #48
    irt3mP118 = irt3mP118 * irt3mP119
    irt3mP117 = irt3mP117 + irt3mP118
    irt3mP120 = irVar_xxx14_kj
    irt3mP121 = #4
    irt3mP120 = irt3mP120 * irt3mP121
    irt3mP117 = irt3mP117 + irt3mP120
    irt3mP123 = irVar_xxx10_results
    irt3mP126 = irVar_xxx13_ki
    irt3mP127 = #1
    irt3mP124 = irt3mP126 - irt3mP127
    irt3mP125 = #48
    irt3mP124 = irt3mP124 * irt3mP125
    irt3mP123 = irt3mP123 + irt3mP124
    irt3mP128 = irVar_xxx14_kj
    irt3mP129 = #4
    irt3mP128 = irt3mP128 * irt3mP129
    irt3mP123 = irt3mP123 + irt3mP128
    irt3mP122 = *irt3mP123
    *irt3mP117 = irt3mP122
    GOTO  L18
LABEL L17 :
    irt3mP130 = irVar_xxx10_results
    irt3mP131 = irVar_xxx13_ki
    irt3mP132 = #48
    irt3mP131 = irt3mP131 * irt3mP132
    irt3mP130 = irt3mP130 + irt3mP131
    irt3mP133 = irVar_xxx14_kj
    irt3mP134 = #4
    irt3mP133 = irt3mP133 * irt3mP134
    irt3mP130 = irt3mP130 + irt3mP133
    irt3mP138 = irVar_xxx9_value
    irt3mP139 = irVar_xxx13_ki
    irt3mP140 = #4
    irt3mP139 = irt3mP139 * irt3mP140
    irt3mP138 = irt3mP138 + irt3mP139
    irt3mP136 = *irt3mP138
    irt3mP141 = irVar_xxx10_results
    irt3mP144 = irVar_xxx13_ki
    irt3mP145 = #1
    irt3mP142 = irt3mP144 - irt3mP145
    irt3mP143 = #48
    irt3mP142 = irt3mP142 * irt3mP143
    irt3mP141 = irt3mP141 + irt3mP142
    irt3mP148 = irVar_xxx14_kj
    irt3mP150 = irVar_xxx8_weight
    irt3mP151 = irVar_xxx13_ki
    irt3mP152 = #4
    irt3mP151 = irt3mP151 * irt3mP152
    irt3mP150 = irt3mP150 + irt3mP151
    irt3mP149 = *irt3mP150
    irt3mP146 = irt3mP148 - irt3mP149
    irt3mP147 = #4
    irt3mP146 = irt3mP146 * irt3mP147
    irt3mP141 = irt3mP141 + irt3mP146
    irt3mP137 = *irt3mP141
    irt3mP135 = irt3mP136 + irt3mP137
    *irt3mP130 = irt3mP135
LABEL L18 :
LABEL L15 :
    irt3mP153 = irVar_xxx14_kj
    irt3mP154 = #1
    irVar_xxx14_kj = irt3mP153 + irt3mP154
    GOTO  L10
LABEL L12 :
    irt3mP155 = irVar_xxx13_ki
    irt3mP156 = #1
    irVar_xxx13_ki = irt3mP155 + irt3mP156
    GOTO  L7
LABEL L9 :
    irt3mP158 = irVar_xxx10_results
    irt3mP159 = #5
    irt3mP160 = #48
    irt3mP159 = irt3mP159 * irt3mP160
    irt3mP158 = irt3mP158 + irt3mP159
    irt3mP161 = #11
    irt3mP162 = #4
    irt3mP161 = irt3mP161 * irt3mP162
    irt3mP158 = irt3mP158 + irt3mP161
    irt3mP157 = *irt3mP158
    ARG irt3mP157
    CALL write
    irt3mP163 = #0
    RETURN irt3mP163
