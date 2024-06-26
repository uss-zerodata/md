---
title: Markdown
subtitle: One Template to rule them all
desc: "A template for all your markdown needs. Creating beautiful documents and slides by only using markdown."
course: ""
semester: ""
author: [github.com/uss-zerodata]
institute: []
date: "01.01.2024"

subject: "Markdown"
keywords:
  [
	Markdown,
	Pandoc,
	Template
  ]
lang: "en"

# fontsize: 12pt
# linestretch: 1.5
# fontfamily: "times"

titlepage: true,
titlepage-text-color: "FFFFFF"
titlepage-rule-color: "360049"
titlepage-rule-height: 0
titlepage-background: "assets/defaults/title.png"
titlepage-logo: ""
footnotes-pretty: true
toc-own-page: true

header-left: ""
header-center: ""
header-right: ""
footer-left: ""
footer-center: ""
footer-right: ""

bibtex: true
biblio-style: IEEEtran
bibliography: sources.bib
---

# Markdown Template

One Template to rule them all
A template for all your markdown needs. Creating beautiful documents written in markdown and rendered using pandoc.

<details>
<summary>Document Example</summary>

![Document Example](examples/example-document.png)

[Document Example PDF](examples/example-document.pdf)

</details>

<details>
<summary>Slides Example (Dark)</summary>

![Dark Slides Example](examples/example-slides_dark.png)

[Dark Slides Example PDF](examples/example-slides_dark.pdf)

</details>

<details>
<summary>Slides Example (Light)</summary>

![Light Slides Example](examples/example-slides_light.png)

[Light Slides Example PDF](examples/example-slides_light.pdf)

</details>

# Features

- Beautiful title page
- Table of contents
- Bibliography
- Full markdown support
- Easy to use
- Easy to extend

# Usage

Write your document in the `main.md` file. Then compile it using the Makefile. You can use all features of markdown in this file. For a detailed description of the markdown syntax see the [markdown guide](https://www.markdownguide.org/basic-syntax/) or the [markdown cheat-sheet](https://www.markdownguide.org/cheat-sheet/).

In addition to the markdown syntax you can also use LaTeX commands in your document. For example you can use `\newpage` to enforce a page break or `\cite` to quote a source from a bibliography file. For a detailed description of the LaTeX syntax see the [LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX) or the [LaTeX cheat-sheet](https://wch.github.io/latexsheet/).

Presentations can be created in the `slides.md`. In contrast to the main document, it does not support LaTeX commands. But you can use all Markdown features in combination with CSS.

## Compiling

After you finished writing your document you can compile it to a PDF file using `make`.

```bash
make			# Renders the main.md and slides.md files to various formats. (Default)
make document	  # Renders the main.md file to a PDF document.
make slides		# Renders the slides.md file to a PDF, HTML and PPTX file.
make clear		# Deletes all temporary files
make purge		# Deletes all temporary and output files
make setup		# Installs the template and all dependencies
make help		# Shows a help message with all available commands
```

# Setup

To automatically install all dependencies use the Makefile.

```bash
make setup
```

<details>
<summary>Reccomended Editor</summary>

For editing, we recommend using [Visual Studio Code](https://code.visualstudio.com/). It is a free and open source text editor, that can be customized with extensions to fit your needs. We recommend the following extensions.

- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [Excel to Markdown table](https://marketplace.visualstudio.com/items?itemName=csholmq.excel-to-markdown-table)
- [Image preview](https://marketplace.visualstudio.com/items?itemName=kisstkondoros.vscode-gutter-preview)
- [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
- [Markdown Shortcuts](https://marketplace.visualstudio.com/items?itemName=mdickin.markdown-shortcuts)
- [Markdown+Math](https://marketplace.visualstudio.com/items?itemName=goessner.mdmath)
- [Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode)
- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)

</details>

## Windows

If you are using Windows you can use [Chocolatey](https://chocolatey.org/)\cite{choco_chocolatey_nodate} to install the dependencies through the command line. If you don't have Chocolatey installed already, you can install it by following the instructions on the [Chocolatey website](https://chocolatey.org/install)\cite{choco_chocolatey_nodate}.

```bash
# Chocolatey
choco install pandoc miktex strawberryperl make nodejs python3
npm install

# Unzip document backgrounds
unzip -o assets/ assets/a4.zip

# Generate slide backgrounds
cd assets/textures
python3 generate_textures.py
```

<details>
<summary>Manual Installation</summary>

It is also possible to install the dependencies manually.

- [Pandoc](https://pandoc.org/installing.html)\cite{pandoc_pandoc_nodate}
- [MiKTeX](https://miktex.org/download)\cite{miktex_getting_nodate}
- [Strawberry Perl](http://strawberryperl.com/)\cite{perl_strawberry_nodate}
- [Make](http://gnuwin32.sourceforge.net/packages/make.htm)\cite{gnuwin_make_nodate}
- [Node.js](https://nodejs.org/en/download/)
- [Python 3](https://www.python.org/downloads/)

</details>

## Linux

If you are using Linux you can use the package manager of your distribution to install the dependencies. The following examples are for Debian based distributions like Ubuntu.

```bash
# Debian/Ubuntu
sudo apt update
sudo apt-get install pandoc texlive-full perl make nodejs python3
npm install

# Unzip document backgrounds
unzip -o assets/ assets/a4.zip

# Generate slide backgrounds
cd assets/textures
python3 generate_textures.py
```

<details>
<summary>Manual Installation</summary>

It is also possible to install the dependencies manually.

- [Pandoc](https://pandoc.org/installing.html)\cite{pandoc_pandoc_nodate}
- [TeX Live](https://www.tug.org/texlive/)\cite{texlive_tex_nodate}
- [Perl](https://www.perl.org/get.html)\cite{perl_perl_nodate}
- [Make](https://www.gnu.org/software/make/)\cite{gnu_make_nodate}
- [Node.js](https://nodejs.org/en/download/)
- [Python 3](https://www.python.org/downloads/)

</details>

# Customization

<details>
<summary>Pandoc Options</summary>

## Pandoc Options

You can customize the template by changing the `pandoc` options in the Makefile. Some examples are given below.

```bash
pandoc -o output.pdf input.md --template assets/eisvogel.tex

# favorite template for general purpose
pandoc -o output.pdf .main.md --template assets/eisvogel.tex --listings

# optional highlight style to use instead of --listings
# to get a list of all available styles, use: pandoc --list-highlight-styles
pandoc -o output.pdf .main.md --template assets/eisvogel.tex  --highlight-style kate

# favorite template for bigger scientific documents
pandoc -o output.pdf .main.md --template assets/eisvogel.tex --listings --toc --toc-depth 2 --number-sections

# special options for setting a book
pandoc -o output.pdf .main.md --template assets/eisvogel.tex --listings --toc --toc-depth 2 --number-sections -V book -V classoption=oneside --top-level-division=chapter
```

- `-o output.pdf`: output file is output.pdf
- `input.md`: input file is input.md
- `--template assets/eisvogel.tex`: use [eisvogel.tex](https://github.com/Wandmalfarbe/pandoc-latex-template) as template
- `--listings`: use listings package for code highlighting
- `--top-level-division=chapter`: use chapters instead of sections
- `--toc`: generate table of contents
- `--toc-depth 2`: set depth of table of contents to 2

</details>

<details>
<summary>Template Variables</summary>

## Template Variables

You can customize the template by changing the front matter of the `main.md` file. The following options are available.

- `titlepage` (defaults to `false`)

  turns on the title page when `true`

- `titlepage-color`

  the background color of the title page. The color value must be given as an HTML hex color like `D8DE2C` without the leading number sign (`#`). When specifying the color in YAML, it is advisable to enclose it in quotes like so `titlepage-color: "D8DE2C"` to avoid the truncation of the color (e.g. `000000` becoming `0`).

- `titlepage-text-color` (defaults to `5F5F5F`)

  the text color of the title page

- `titlepage-rule-color` (defaults to `435488`)

  the color of the rule on the top of the title page

- `titlepage-rule-height` (defaults to `4`)

  the height of the rule on the top of the title page (in points)

- `titlepage-logo`

  path to an image that will be displayed on the title page. The path is always relative to where pandoc is executed. The option `--resource-path` has no effect.

- `titlepage-background`

  the path to a background image for the title page. The background image is scaled to cover the entire page. In the examples folder under `titlepage-background` are a few example background images.

- `page-background`

  the path to a background image for any page. The background image is scaled to cover the entire page. In the examples folder under `page-background` are a few example background images.

- `page-background-opacity` (defaults to `0.2`)

  the background image opacity

- `caption-justification` (defaults to `raggedright`)

  justification setting for captions (uses the `justification` parameter of the [caption](https://ctan.org/pkg/caption?lang=en) package)

- `toc-own-page` (defaults to `false`)

  begin new page after table of contents, when `true`

- `listings-disable-line-numbers` (defaults to `false`)

  disables line numbers for all listings

- `listings-no-page-break` (defaults to `false`)

  avoid page break inside listings

- `disable-header-and-footer` (default to `false`)

  disables the header and footer completely on all pages

- `header-left` (defaults to the title)

  the text on the left side of the header

- `header-center`

  the text in the center of the header

- `header-right` (defaults to the date)

  the text on the right side of the header

- `footer-left` (defaults to the author)

  the text on the left side of the footer

- `footer-center`

  the text in the center of the footer

- `footer-right` (defaults to the page number)

  the text on the right side of the footer

- `footnotes-pretty` (defaults to `false`)

  prettifies formatting of footnotes (requires package `footmisc`)

- `footnotes-disable-backlinks` (defaults to `false`)

  disables making the reference from the footnote at the bottom of the page into a link back to the occurence of the footnote in the main text (enabling requires package `footnotebackref`).

- `book` (defaults to `false`)

  typeset as book

- `logo-width` (defaults to `35mm`)

  the width of the logo. One needs to specify the width with a (TeX) unit e.g. `100pt` or `35mm`. The following units can be used:

  - `pt`: Point
  - `pc`: pica (12 `pt`)
  - `in`: inch (72.27 `pt`)
  - `bp`: Big point (72 `bp` = 1 `in`)
  - `cm`: Centimeter
  - `mm`: Millimeter
  - `dd`: Didot point
  - `cc`: cicero (12 `dd`)
  - `sp`: Scaled point (65,536 `sp` = 1 `pt`)
  - `ex`: Nomimal x-height
  - `em`: Nominal m-width
  - `px`: Pixel (only for pdfTeX and LuaTeX) The dimension given to the `\pdfpxdimen` primitive; default value is 1 `bp`, corresponding to a pixel density of 72 dpi.

  A visual overview of the length units is available at <https://github.com/tweh/tex-units>.

- `first-chapter` (defaults to `1`)

  if typesetting a book with chapter numbers, specifies the number that will be assigned to the first chapter

- `float-placement-figure` (defaults to `H`)

  Reset the default placement specifier for figure environments to the supplied value e.g. `htbp`. The available specifiers are listed below. The first four placement specifiers can be combined.

  1.  `h`: Place the float _here_, i.e., approximately at the same point it occurs in the source text.
  2.  `t`: Place the float at the _top_ of the page.
  3.  `b`: Place the float at the _bottom_ of the page.
  4.  `p`: Place the float on the next _page_ that will contain only floats like figures and tables.
  5.  `H`: Place the float _HERE_ (exactly where it occurs in the source text). The `H` specifier is provided by the [float package](https://ctan.org/pkg/float) and may not be used in conjunction with any other placement specifiers.

- `table-use-row-colors` (defaults to `false`)

  enables row colors for tables. The default value is `false` because the coloring extends beyond the edge of the table and there is currently no way to change that.

- `code-block-font-size` (defaults to `\small`)

  LaTeX command to change the font size for code blocks. The available values are `\tiny`, `\scriptsize`, `\footnotesize`, `\small`, `\normalsize`, `\large`, `\Large`, `\LARGE`, `\huge` and `\Huge`. This option will change the font size for default code blocks using the verbatim environment and for code blocks generated with listings.

</details>

# Credits

- [Pandoc](https://pandoc.org/)
- [LaTeX](https://www.latex-project.org/)
- [Eisvogel Template](https://github.com/Wandmalfarbe/pandoc-latex-template)
