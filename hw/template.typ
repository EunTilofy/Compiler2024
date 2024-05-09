#let font_song = ("New Computer Modern", "Simsun", "STSong", "Source Han Serif SC")
#let font_fangsong = ("FangSong", "STFangSong")
#let font_hei = ("Source Han Sans SC", "Source Han Sans HW SC", "SimHei", "Microsoft YaHei", "STHeiti")
#let font_kai = ("KaiTi_GB2312", "KaiTi", "STKaiti")

#let definition_counter = state("definition_counter", 0)
#let theorem_counter = state("theorem_counter", 0)
#let problem_counter = state("problem_counter", 0)
#let page_num = 0
#let fake_par = [#text()[#v(0pt, weak: true)];#text()[#h(0em)]]

#let project(course: "", title: "", date: none, 
             authors: "Zhixin Zhang", footer: "papercloud(@zju.edu.cn)", has_cover: true, 
             body) = {
  // 文档基本信息
  set document(author: "张志心", title: title)
  set page(
    paper: "a4",
    margin: (left: 20mm, right: 20mm, top: 30mm, bottom: 30mm),
    numbering: "1",
    number-align: center
  )

  // show page: it => [
  //   #page_num = #page_num + 1
  // ]
  
  // 页眉
  set page(
    header: locate(loc => {
      if (counter(page).at(loc).at(0) > 1 or has_cover == false) {
        set text(font: font_song, 10pt, baseline: 8pt, spacing: 2pt)
        grid(
          columns: (1fr, 1fr, 1fr),
          align(left, title),
          align(center, authors),
          align(right, date),
        )
        line(length: 100%, stroke: 0.5pt)
      }
  }))
    
  //   ..(if counter(page).at() > 1 {
  //   (header: {
  //     set text(font: font_song, 10pt, baseline: 8pt, spacing: 2pt)
  //     grid(
  //       columns: (1fr, 1fr, 1fr),
  //       align(left, course),
  //       align(center, title),
  //       align(right, date),
  //     )
  //     line(length: 100%, stroke: 0.5pt)
  //   })
  // }))

  // 页脚
  set page(
    footer: {
      set text(font: font_song, 10pt, baseline: 8pt, spacing: 3pt)
      set align(center)
      
      grid(
        columns: (1fr, 1fr),
        align(left, footer),
        align(right, counter(page).display("1")),
      )
    }
  )

  set text(font: font_song, lang: "zh", size: 10pt)
  show math.equation: set text(weight: 400)

  // Set paragraph spacing.
  show par: set block(above: 1.2em, below: 1.2em)

  set heading(numbering: "1.1")
  set par(leading: 0.75em)

  // Title row.
  align(center)[
    #block(text(font: font_song, weight: 1000, lang: "en", 1.5em, [#title]))
    #v(1.1em, weak: true)
  ]

  // Author information and date
  pad(
    top: 0.5em,
    bottom: 0.8em,
    align(center)[
      #block(text(font: font_song, weight: "semibold", 1.1em, authors))
      // #v(1.1em, weak: true)
      // #block(text(font: font_fangsong, weight: "regular", 1.1em, date))
    ]
  )

  
  // Main body.
  set par(justify: true)

  show "。": "．"

  show heading.where(level: 1): it => [
    #definition_counter.update(x => 0)
    #theorem_counter.update(x => 0)
    #it
  ]

  show heading.where(level: 2): it => [
    #theorem_counter.update(x => 0)
    #it
  ]

  set par(first-line-indent: 2em)
  show heading: it => {text()[#v(1.7em, weak: true)];it;fake_par}

  show raw.where(block: true): block.with(
    width: 100%,
    stroke: 0.5pt + luma(200),
    radius: 4pt,
    inset: 8pt,
    fill: luma(250)
  )

  body
}

#let def(x) = { text("【" + x + "】", weight: "bold") }
#let deft(x) = { text("【" + x + "】", weight: "bold", fill: rgb("#FFFFFF")) }
#let bold(x) = { text(x, weight: "bold") }


#let badge(content, fill: rgb("#000000")) = box(
	fill: fill,
	radius: 4pt,
	inset: 1pt,
	outset: 3pt,
	text(
		content,
		weight: "bold",
		size: 10pt,
		fill: rgb("#ffffff")
	)
)

#let ac = badge("Correct", fill: rgb("#25ad40"))
#let pc = badge("Partially Correct", fill: rgb("#01bab2"))
#let wa = badge("Wrong Answer", fill: rgb("#ff4f4f"))
#let un = badge("Unknown", fill: rgb("#5c5c5c"))

#import "@preview/physica:0.9.1": *

#let dp = math.display
#let sp = math.space
#let eps = math.epsilon
#let sim = "~ "
#let st = "s.t. "
#let cond = "cond"
#let other = "othwerwise"
#let kk = " "
#let pm = math.plus.minus
#let mp = math.minus.plus

#let dx = math.upright("d") + math.italic("x")
#let dy = math.upright("d") + math.italic("y")
#let dt = math.upright("d") + math.italic("t")
#let du = math.upright("d") + math.italic("u")
#let dv = math.upright("d") + math.italic("v")
#let ds = math.upright("d") + math.italic("s")
#let dz = math.upright("d") + math.italic("z")
#let Dx = math.Delta + math.italic("x")
#let Dy = math.Delta + math.italic("y")
#let Dt = math.Delta + math.italic("t")
#let Du = math.Delta + math.italic("u")
#let Dv = math.Delta + math.italic("v")
#let ddy = math.attach(math.upright("d"), tr: "2") + math.italic("y")
#let dddy = math.attach(math.upright("d"), tr: "3") + math.italic("y")
#let dny = math.attach(math.upright("d"), tr: "n") + math.italic("y")
#let hat(x) = vu(x)
#let arr(x) = va(x)
#let am = vb("a")
#let bm = vb("b")
#let um = vb("u")
#let vm = vb("v")
#let xm = vb("x")
#let ym = vb("y")
#let zm = vb("z")
#let Xm = vb("X")
#let Ym = vb("Y")
#let Zm = vb("Z")
#let Am = vb("A")
#let leq = math.lt.eq
#let geq = math.gt.eq
#let langle = math.angle.l
#let rangle = math.angle.r
#let varphi = math.phi.alt
#let BB(i) = math.bb(i)
#let emptyset = math.nothing
#let CAL(i) = math.cal(i)
#let bmatrix(..args) = math.mat(delim: "[", ..args)
#let infty = math.oo
#let bvec(..args) = math.vec(delim: "[", ..args)
#let CPP = raw.with(lang: "cpp")
#let dfrac(a, b) = $display(frac(#a, #b))$

#let arccot = math.op("arccot")
// add math opts

#show math.attach: it => {
  import math: *
  if it.has("b") and it.b.func() != upright[].func() and it.b.has("text") and it.b.text.len() == 1 {
    let args = it.fields()
    let _ = args.remove("base")
    let _ = args.remove("b")
    attach(it.base, b: upright(it.b), ..args)
  } else {
    it
  }
}

#let song(it) = text(it, font: font_song)
#let fangsong(it) = text(it, font: font_fangsong)
#let hei(it) = text(it, font: font_hei)
#let kai(it) = text(it, font: font_kai)

#let bold = (it) => [#strong[#it]]

#let definition(it) = {block(width: 100%)[
  // #definition_counter.update(x => (x + 1))
  #theorem_counter.update(x => (x + 1))
  #strong[
    #hei[定义]#locate(loc => [#counter(heading).at(loc).at(0)]).#theorem_counter.display()
    // #hei[定义]#locate(loc => [#counter(heading).at(loc).at(0)]).#definition_counter.display()
  ]
  #math.space#it
];fake_par}

#let theorem(it, name: "", tag: "定理") = {block(width: 100%)[
  #theorem_counter.update(x => (x + 1))
  #strong[
    // #hei[#tag]#locate(loc => [#counter(heading).at(loc).at(0).#counter(heading).at(loc).at(1)]).
    #hei[#tag]#locate(loc => [#counter(heading).at(loc).at(0)]).#theorem_counter.display()
  ]
  #if (name != "") [(#kai[#name])]
  #math.space#it
];fake_par}
#let lemma(it, name: "") = theorem(it, name: name, tag: "引理")
#let corollary(it, name: "") = theorem(it, name: name, tag: "推论")
#let property(it, name: "") = theorem(it, name: name, tag: "性质")
#let conclusion(it, name: "") = theorem(it, name: name, tag: "结论")
#let Remark(it, name: "") = theorem(it, name: name, tag: "注解")

#let problem(it, name: "") = {block(width: 100%)[
  #problem_counter.update(x => (x + 1))
  #strong[
    #hei[例]#problem_counter.display()
  ]
  #if (name != "") [(#kai[#name])]
  #math.space#it
];fake_par}
#let solution(it, tag: "解") = {block(width: 100%)[
  #strong[#hei[#tag:]]
  #math.space#it
  #place(
  right + bottom,
  float: true,
  clearance: 6pt,
  [□]
  )
];fake_par}
#let Proof(it, tag: "证明") = {block(width: 100%)[
  #strong[#hei[#tag:]]
  #math.space#it
  #place(
  right + bottom,
  float: true,
  clearance: 6pt,
  [□]
  )
];fake_par}

#let HWProb(it, name: "", color : black) = {block(
  below: 1em, stroke: 0.5pt + color, radius: 3pt,
  width: 100%, inset: 7pt)[
  #if (name != "") [
    #set text(font: "Noto Sans", fill: color)
    #strong[#name]
  ]
  #let fontcolor = color.darken(20%)
  #set text(fill: fontcolor)
  #set par(first-line-indent: 0em)
  #it
];fake_par}

#let named_block(it, name: "", color: red, inset: 11pt) = {block(
  below: 1em, stroke: 0.5pt + color, radius: 3pt,
  width: 100%, inset: inset
)[
  #place(
    top + left,
    dy: -6pt - inset, // Account for inset of block
    dx: 8pt - inset,
    block(fill: white, inset: 2pt)[
			#set text(font: "Noto Sans", fill: color)
			#strong[#name]
		]
  )
  #let fontcolor = color.darken(20%)
  #set text(fill: fontcolor)
  #set par(first-line-indent: 0em)
  #it
];fake_par}
#let example(it) = named_block(it, name: "Example", color: gray.darken(60%))
#let proof(it) = named_block(it, name: "Proof", color: rgb(120, 120, 120))
#let abstract(it) = named_block(it, name: "Abstract", color: rgb(0, 133, 143))
#let summary(it) = named_block(it, name: "Summary", color: rgb(0, 133, 143))
#let info(it) = named_block(it, name: "Info", color: rgb(68, 115, 218))
#let note(it) = named_block(it, name: "Note", color: rgb(68, 115, 218))
#let tip(it) = named_block(it, name: "Tip", color: rgb(0, 133, 91))
#let hint(it) = named_block(it, name: "Hint", color: rgb(0, 133, 91))
#let success(it) = named_block(it, name: "Success", color: rgb(62, 138, 0))
#let help(it) = named_block(it, name: "Help", color: rgb(153, 110, 36))
#let warning(it) = named_block(it, name: "Warning", color: rgb(184, 95, 0))
#let attention(it) = named_block(it, name: "Attention", color: rgb(216, 58, 49))
#let caution(it) = named_block(it, name: "Caution", color: rgb(216, 58, 49))
#let failure(it) = named_block(it, name: "Failure", color: rgb(216, 58, 49))
#let danger(it) = named_block(it, name: "Danger", color: rgb(216, 58, 49))
#let error(it) = named_block(it, name: "Error", color: rgb(216, 58, 49))
#let bug(it) = named_block(it, name: "Bug", color: rgb(204, 51, 153))
#let quote(it) = named_block(it, name: "Quote", color: rgb(132, 90, 231))
#let cite(it) = blockx(it, name: "Cite", color: rgb(132, 90, 231))
#let experiment(it) = named_block(it, name: "Experiment", color: rgb(132, 90, 231))
#let question(it) = nanamed_block(it, name: "Question", color: rgb(132, 90, 231))
#let analysis(it) = named_block(it, name: "Analysis", color: rgb(0, 133, 91))
#let mycite(it) = named_block(it, name: "Cite", color: rgb(132, 90, 231))
#let prob(it) = named_block(it, name: "Problem", color: luma(100))
#let Box(it, name : "") = named_block(it, name : name, color : black)

// Enum 
// #block[
// #set enum(numbering: "1.a)") ]

// Fixed height vector
#let fvec(..children, delim: "(", gap: 1.5em) = { // change default gap there
  style(styles => 
    math.vec(
      delim: delim,
      gap: 0em,
      ..for el in children.pos() {
        ({
          box(
            width: measure(el, styles).width,
            height: gap, place(horizon, el)
          )
        },) // this is an array
        // `for` merges all these arrays, then we pass it to arguments
      }
    )
  )
}

// fixed hight matrix
// accepts also row-gap, column-gap and gap
#let fmat(..rows, delim: "(", augment: none) = {
  let args = rows.named()
  let (gap, row-gap, column-gap) = (none,)*3;

  if "gap" in args {
    gap = args.at("gap")
    row-gap = args.at("row-gap", default: gap)
    column-gap = args.at("row-gap", default: gap)
  }
  else {
    // change default vertical there
    row-gap = args.at("row-gap", default: 1.5em) 
    // and horizontal there
    column-gap = rows.named().at("column-gap", default: 0.5em)
  }

  style(styles =>
    math.mat(
      delim: delim,
      row-gap: 0em,
      column-gap: column-gap,
      ..for row in rows.pos() {
        (for el in row {
          ({
          box(
            width: measure(el, styles).width,
            height: row-gap, place(horizon, el)
          )
        },)
        }, )
      }
    )
  )
}
#import "@preview/codelst:2.0.0": sourcecode
#let mycode(it, size : 1em, lang: "cpp") = block[
  #set text(size: size)
  #sourcecode(it)
];

// uasge -> mycode
// #block[
//   #set text(size : 12pt)
//   #sourcecode[
//   ```cpp
  
//   ```
// ]
// ];

#let codex(code, lang: none, size: 1em, border: true) = {
  if code.len() > 0 {
    if code.ends-with("\n") {
      code = code.slice(0, code.len() - 1)
    }
  } else {
    code = "// no code"
  }
  set text(size: size)
  align(left)[
    #if border == true {
      block(
        width: 100%,
        stroke: 0.5pt + luma(150),
        radius: 4pt,
        inset: 8pt,
      )[
        #raw(lang: lang, block: true, code)
      ]
    } else {
      raw(lang: lang, block: true, code)
    }
  ]
}

#let importCode(file, namespace: none, lang: "cpp") = {
  let source_code = read(file)
  let code = ""
  let note = ""
  let flag = false
  let firstlines = true

  for line in source_code.split("\n") {
    if namespace != none and line == ("} // namespace " + namespace) {
      flag = false
    }
    if namespace == none or flag {
      if firstlines and line.starts-with("// ") {
        note += line.slice(3) + "\n"
      } else {
        code += line + "\n"
        firstlines = false
      }
    }
    if namespace != none and line == ("namespace " + namespace + " {") {
      flag = true
    }
  }

  if note.len() > 0 {
    block(note)
  }

  codex(code, lang: lang, size: 1.05em)
}

#let bib_cite(..names) = {
  for name in names.pos() {
    cite(name)
  }
}

#let references(path) = {
  set heading(level: 1, numbering: none)

  set par(justify: false, leading: 1.24em, first-line-indent: 2em)

  bibliography(path, title:"参考文献")
}

#import "@preview/tablex:0.0.6": tablex, hlinex
#import "@preview/tablem:0.1.0": tablem

#let three-line-table = tablem.with(
  render: (columns: auto, ..args) => {
    tablex(
      columns: columns,
      auto-lines: false,
      align: center + horizon,
      hlinex(y: 0),
      hlinex(y: 1),
      ..args,
      hlinex(),
    )
  }
)

#show figure.caption: it => {
  layout(size => style(styles => [
    #let text-size = measure(
      it.supplement + it.separator + it.body,
      styles,
    )

    #let my-align

    #if text-size.width < size.width {
      my-align = center
    } else {
      my-align = left
    }

    #align(my-align, it)

  ]))
}

#import "@preview/tablex:0.0.8": tablex, gridx, hlinex, vlinex, colspanx, rowspanx

#let figurex(
  img,
  caption,
) = {
  show figure.caption: it => {
    set text(size: 0.9em, fill: luma(100), weight: 700)
    it
    v(0.1em)
  }
  set figure.caption(separator: ":")
  figure(
    img,
    caption: [
      #set text(weight: 400)
      #caption
    ]
  )
}