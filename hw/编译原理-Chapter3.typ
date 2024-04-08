#import "../template.typ": *

#show: project.with(
	course: "编译原理",
	title: "Compilers Principals - Chapter3",
	date: "2024.3.07",
	authors: "Zhixin Zhang, 3210106357",
	has_cover: false
)

// #show: rest => columns(2, rest)

*Problems：3.6，3.9，3.13，3.14.*

= Problem 3.6

#HWProb[
	a. Calculate nullable, FIRST, and FOLLOW for this grammar:

	$
		&S arrow u B D z \
		&B arrow B v \
		&B arrow w \
		&D arrow E F \
		&E arrow y \
		&E arrow \
		&F arrow x \
		&F arrow 
	$

	b. Construct the LL(1) parsing table.

	c. Give evidence that this grammar is not LL(1).

	d. Modify the grammar *as little as possible* to make an LL(1) grammar that accepts the same language.
]

#solution[ \
	a.
	#figure(caption: "nullable, FIRST and FOLLOW")[
	#tablem[
	|| *nullable* | *FIRST*    | *FOLLOW* |
  | - | ---- | - | - |
  | S | no  | u   | |
	| B | no   | w  | x, y, z|
	| D | yes  | x, y | z |
	| E | yes  | y  | x, z |
	| F | yes  | x  | z |
	]
	]
	b.
	#figure(caption: "LL(1) parsing table")[
	#tablem[
	|| u | v | w | x | y | z |
  | -    | - | - | - | - | - | - |
  | S    | $S arrow u B D z$ |  |   |   |   |   |
	| B    |   |   | $B arrow w, B arrow B v$  |   |   |   |
	| D    |   |   |  | $D arrow E F$  | $D arrow E F$ | $D arrow E F$  |
	| E    |   |   |   |  $E arrow $ |  $E arrow y$ | $E arrow $  |
	| F    |   |   |   |  $F arrow x$ |  | $F arrow $  |
	]
	]

c. No, according to the parsing table, we get two possible production when
 the top of stack of non-terminal is B and the input token is w, $B arrow w, B arrow B v$.
\
d. I modify the grammar as follows:
$
&S arrow u B E F z \
&B arrow w B' \
&B' arrow v B' \
&B' arrow \
&E arrow y \
&E arrow \
&F arrow x \
&F arrow
$
]

= Problem 3.9

#HWProb[
	Diagram the LR(0) states for Grammar 3.26, build the SLR parsing table, and identify the conflicts.
]

#solution[ \
	#import "@preview/diagraph:0.2.0": *
#let renderc(code) = render(code.text)
#box(scale(70%, origin: top)[
#figure(caption: "LR(0) state diagram")[
#renderc(
  ```
  digraph G {
    rankdir = TB;
    ranksep = 0.2
		100 [style = invis, label = ""];
    node [shape = rectangle];
		1 [label = "1.
		S' → S$
								S → .V=E
								S → .E 
								E → .V 
								V → .x 
								V → .*E"]; 
    3 [label = "3. S → E"]; 
    2 [label = "2. S → V.=E 
						    E → V"]; 
    4 [label = "4.
		V → *.E
	E → .V
								V → .x 
								V → .*E"]; 
    5 [label = "5.E → V."];
    6 [label = "6. V → *E."]; 
    7 [label = "7. V → x."];
    8 [label = "8.
S → V=.E 
					E → .V
								V → .x 
								V → .*E"];
    9 [label = "9. S → V=E"];
		10 [label = "10. S' → S.$"] 
		{rank=same; 1, 7;}
    {rank=same; 2, 3, 5, 4;}
    // assis1 [style = invis, label = ""];
    // 3->assis1 [style = invis];
    {rank=same; 8, 9;}
		{rank=same; 10, 6;}
    
    
    100->1;
    1->2 [label = "V"];
		1->10 [label = "S"];
		1->3 [label = "E"];
		1->4 [label = "*"];
		4->4 [label = "*"];
		4->6 [label = "E"];
		4->5 [label = "V"];
		4->7 [label = "x"];
		1->7 [label = "x"];
		8->7 [label = "x"];
		8->4 [label = "*"];
		8->9 [label = "E"];
		8->5 [label = "V"];
		2->8 [label = "="];

 	}
  ```
)]])

	#figure(caption: "SLR parsing table")[
	#tablem[
	|| x | \* | \$ | = | E | V | S |
  | -    | - | - | - | - | - | - | - |
  | 1    | s7  | s4  |   |   |  g3 |  g2 |  g10  |
	| 2    |     |     |  r3 | s8, r3  |   |   |    |
	| 3    |  r10   | r10 | r10 | r10 |  |   |    |
	| 4    |  s7  | s4  |   |   | g6 | g5 |    |
	| 5    |     |     | r6  | r6  |   |   |    |
	| 6    |     |     | r5 |  r5 |   |   |    |
	| 7    |     |     | r2  | r2  |   |   |    |
	| 8    |  s7   | s4  |   |   | g9  | g5  |    |
	| 9    |     |     |  r10 |   |   |   |    |
	| 10   |     |     |  a |   |   |   |    |
	]
	]
]

= Problem 3.13

#HWProb[
	Show that this grammar is LALR(1) but not SLR:
	$
		&kk_0 quad S arrow X kk \$
		quad quad quad quad
		kk_3 quad X arrow d kk c \

		&kk_1 quad X arrow M kk a
		quad quad quad kk kk
		kk_4 quad X arrow b kk d kk a \

		&kk_2 quad X arrow b kk M kk c
		quad quad quad
		kk_5 quad M arrow d \
	$
]

#solution[\
Follow(x) = {\$}, Follow(M) = {a, c}

		#import "@preview/diagraph:0.2.0": *
#let renderc(code) = render(code.text)
#box(scale(70%, origin: top)[
#figure(caption: "SLR state diagram")[
#renderc(
  ```
  digraph G {
    rankdir = TB;
    ranksep = 0.2
		100 [style = invis, label = ""];
    node [shape = rectangle];
		1 [label = "1.
		S → .X$
								X → .Ma
								X → .bMc 
								X → .dc 
								X → .bda 
								M → .d"]; 
    3 [label = "3. X → M.a"]; 
    2 [label = "2. S → X.$ "]; 
    4 [label = "4. 
		X → b.Mc
		M → .d
		X → b.da"]; 
    5 [label = "5. 
		M → d.
								X → d.c"];
    6 [label = "6. X → dc."]; 
    7 [label = "7. X → Ma."];
    8 [label = "8. X → bM.c"];
    9 [label = "9. M → d.
							  X → bd.a"];
		10 [label = "10. X → bMc."] 
		11 [label = "11. x → bda."]
		{rank=same; 1;}
    {rank=same; 2, 3, 4, 5, 6;}
    // assis1 [style = invis, label = ""];
    // 3->assis1 [style = invis];
    {rank=same; 7, 8, 9;}
		{rank=same; 10, 11;}
    
    
    100->1;
    1->2 [label = "X"];
		1->5 [label = "d"];
		1->3 [label = "M"];
		1->4 [label = "b"];
		4->8 [label = "M"];
		4->9 [label = "d"];
		5->6 [label = "c"];
		3->7 [label = "a"];
		8->10 [label = "c"];
		9->11 [label = "a"];
 	}
  ```
)]])

At state 5 and the input is c,
we have two possible ways,
either to reduce to state 3 or
to shift to state 6.
So it is not SLR.

#box(scale(70%, origin: top)[
#figure(caption: "LR(1) state diagram")[
#renderc(
  ```
  digraph G {
    rankdir = TB;
    ranksep = 0.2
		100 [style = invis, label = ""];
    node [shape = rectangle];
		1 [label = "1.
		S → .X$ ?
								X → .Ma $
								X → .bMc $
								X → .dc $
								X → .bda $
								M → .d   a"]; 
    3 [label = "3. X → M.a"]; 
    2 [label = "2. S → X.$ ?"]; 
    4 [label = "4. 
		X → b.Mc $
		M → .d  c
		X → b.da $"]; 
    5 [label = "5. 
		M → d.  a
								X → d.c  $"];
		6 [label = "6. X → dc. $"]
    7 [label = "7. X → Ma. $"];
    8 [label = "8. X → bM.c $"];
    9 [label = "9. M → d.  c
							  X → bd.a $"];
		10 [label = "10. X → bMc. $"] 
		11 [label = "11. x → bda. $"]
		{rank=same; 1;}
    {rank=same; 2, 3, 4, 5, 6;}
    // assis1 [style = invis, label = ""];
    // 3->assis1 [style = invis];
    {rank=same; 7, 8, 9;}
		{rank=same; 10, 11;}
    
    
    100->1;
    1->2 [label = "X"];
		1->5 [label = "d"];
		1->3 [label = "M"];
		1->4 [label = "b"];
		4->8 [label = "M"];
		4->9 [label = "d"];
		5->6 [label = "c"];
		3->7 [label = "a"];
		8->10 [label = "c"];
		9->11 [label = "a"];
 	}
  ```
)]])

The language is LALR(1).
	#figure(caption: "LALR(1) parsing table")[
	#tablem[
	|| a | b | c | d | \$ | X | M |
  | -    | - | - | - | - | - | - | - |
  | 1    |   | s4  |   | s5  |   |  g2 |  g3  |
	| 2    |   |     |   |     | a |     |      |
	| 3    | s6 |     |   |    |   |   |   |
	| 4    |     |  |  |  s8  |  |   |  g7  |
	| 5    |  r3   |     |    | s9  |   |   |    |
	| 6    |       |     |    |     | r2 |   |    |
	| 7    |       |     | s10 |   |   |   |    |
	| 8    |  s11  |     | r7  |   |   |   |    |
	| 9    |       |     |     |   | r2  |   |    |
	| 10   |       |     |     |   | r2  |   |    |
	| 11   |       |     |     |   | r2  |   |    |
	]
	]
]

= Problem 3.14

#show math.equation: set align(left)

#HWProb[
	Show that this grammar is LL(1) but not LALR(1):
	$
		quad quad quad quad quad quad quad quad quad quad quad quad quad quad quad 
		&kk_1 quad S arrow ( kk X
		quad quad quad
		&kk_5 quad X arrow F kk ] \

		&kk_2 quad S arrow E kk ]
		&kk_6 quad E arrow A \

		&kk_3 quad S arrow F kk)
		&kk_7 quad F arrow A \

		&kk_4 quad X arrow E kk)
		&kk_8 quad A arrow \
	$
]

#solution[
The language is LL(1).
#figure(caption: "LL(1) Parsing table")[
	#tablex(
  columns: 5,
  // auto-hlines: false,
  auto-vlines: false,
  (), vlinex(), (), (), (),
	[] , "(", ")", "[", "]",
  [X], [], $X arrow E)$, [], $X arrow F ]$,
  [S], [$S arrow (X$], [$S arrow F)$], [], [$S arrow E ]$],
	[E], [], [$E arrow A$], [], [$E arrow A$],
	[F], [], [$F arrow A$], [], [$F arrow A$],
	[A], [], [$A arrow$], [], [$A arrow$]
)]
In state 7, there is a reduce-reduce conflict, so it is not LALR(1).
#import "@preview/diagraph:0.2.0": *
#let renderc(code) = render(code.text)
#block[
#box(scale(60%, origin: top)[
#figure(caption: "LALR(1) state diagram")[
#renderc(
  ```
  digraph G {
    rankdir = TB;
    ranksep = 0.2
		100 [style = invis, label = ""];
    node [shape = rectangle];
		1 [label = "1.
								S → .( X $
								S → .E ] $
								S → .F ) $
								E → . A ]
								X → . A ]
								M → .  )]"]; 
    3 [label = "3. S → E.]$"]; 
    2 [label = "2.
								S → (.X $
								X → . F ] $
								X → . E ) $
								E → . A   )
								F → . A   ]
								A → .   ) ]"]; 
    4 [label = "4. S → F.) $"]; 
    5 [label = "5. S → E ] $"];
    6 [label = "6. S → F). $"]; 
    7 [label = "7. E → A. )]
							     F → A. )]"];
    8 [label = "8. S → (X. $"];
    9 [label = "9. X → F]. $"];
		10 [label = "10. X → E.) $"] 
		11 [label = "11. X → F].$"]
		12 [label = "12. X → E).$"]
		{rank=same; 1, 2;}
    {rank=same; 3, 4, 7, 9, 8, 10;}
    // assis1 [style = invis, label = ""];
    // 3->assis1 [style = invis];
    {rank=same; 5, 6, 11, 12;}
    
    
    100->1;
    1->3 [label = "E"];
		1->4 [label = "F"];
		1->7 [label = "A"];
		3->5 [label = "]"];
		4->6 [label = ")"];
		1->2 [label = "("];
		2->7 [label = "A"];
		2->9 [label = "F"];
		9->11 [label = "]"];
		2->10 [label = "E"];
		10->12 [label = ")"];
		2->8 [lable = "X"];
 	}
  ```
)]])]

]