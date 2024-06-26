---
marp: true
theme: default
paginate: true
backgroundColor: #000
transition: fade
color: #eee
style: |
  table, tr, td, th, marp-pre code {
    color: #eee;
  }
  li {
    font-size: 0.95rem;
  }
  footer, header, section::after {
    color: #bbb;
  }
  muted, a {
    color: #bbb;
  }
  small, .small {
    font-size: 0.65rem;
    color: #bbb;
  }
  table {
    font-size: 0.55rem;
    text-align: left;
    border-radius: 0.15rem;
  }
  marp-pre, td, th {
    background-color: #080808;
  }
  .collumns {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
  }
  .center {
     margin: auto 0;
  }
  .gap {
    margin-top: 1rem;
  }
  /* Define the style of "morph" class */
  .morph {
    display: inline-block;
    view-transition-name: var(--morph-name);
    contain: layout;
    vertical-align: top;
  }
  footer {
    bottom: 0;
    left: 0;
    padding: 0.35rem 2rem 0.35rem 0.5rem;
    background-color: #00000088;
    border-radius: 0 0.5rem 0 0;
    backdrop-filter: blur(10px);
    font-size: 0.7rem;
  }
---

![bg left:40% 80% invert](assets/fingerprint-icon.png)

# Markdown

One Template to rule them all

<small>A template for all your markdown needs. Creating beautiful documents and slides by only using markdown.</small>

<!--
_backgroundImage: url('assets/defaults/hex_blue_950_hc_invert_0.svg')
_paginate: false
_transition: fade-out
 -->

---

![bg right:45% ](assets/Markdown-Logo.webp)

# Introduction

A template for all your markdown needs. Creating beautiful documents and slides by only using markdown.

<!--
_backgroundImage: url('assets/defaults/hex-outline_blue_900_hc_invert_1.svg')
_header: Introduction
 -->

---

![bg right:45% ](assets/chairs.jpg)

# Features

- Beautiful title page
- Automatic table of contents
- Bibliography support
- Full markdown support
- Easy to use
- Easy to extend

<!--
_backgroundImage: url('assets/defaults/hex-outline_blue_900_hc_invert_2.svg')
_header: Features
 -->

---

## <span class="morph" style="--morph-name:a1;">Writing your document</span>

Write your document in the `main.md` file. This file is the main file of your document and will be compiled to the final document using the Makefile. You can use all features of markdown in this file. For a detailed description of the markdown syntax see the [markdown guide](https://www.markdownguide.org/basic-syntax/)

<!--
_backgroundImage: url('assets/defaults/wave_violet_800_invert_0.svg')
_header: Writing
_footer: https://www.markdownguide.org/basic-syntax/
 -->

---

## <span class="morph" style="--morph-name:a1;">Writing your document</span>

In addition to the markdown syntax you can also use LaTeX commands in your document. This is useful if you want to use some advanced features of LaTeX.

<div class="collumns gap">
<div>

For example you can use the `\newpage` command to start a new page or the `\cite` command to cite a source.
For a detailed description of the LaTeX syntax see the [LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX)

</div>
<div class="center">

```latex
\newpage
\cite{einstein}
```

</div>

<!--
_backgroundImage: url('assets/defaults/wave_amber_900_invert_0.svg')
_header: Writing
_footer: https://en.wikibooks.org/wiki/LaTeX
 -->

---

# Installation

You can work on this template with any text editor you like. But you need to have some requirements installed on your system in order to compile the document. To install the requirements on your system you can use the Makefile. It will install all required dependencies for you automatically.

```bash
make install
```

<!--
Requirements:
- make
- pandoc
- texlive-core or Miktex
- nodejs
- texteditor like vscode
 -->

<!--
_backgroundImage: url('assets/defaults/blob_emerald_800_invert_0.svg')
_header: Installation
_transition: fade-out
 -->

---

# Compiling

To compile the document just use the Makefile.

```bash
make			# Renders the main.md and slides.md files to various formats. (Default)
make document		# Renders the main.md file to a PDF document.
make slides		# Renders the slides.md file to a PDF, HTML and PPTX file.
make clear		# Deletes all temporary files
make purge		# Deletes all temporary and output files
make setup		# Installs the template and all dependencies
make help		# Shows this help
```

<!--
make setup		# Installs the template and all dependencies.
make tex		# Renders the main.md file to a LaTeX document.
make slides		# Renders the slides.md file to a PDF, HTML and PPTX file.
make present	# Starts a live preview of the slides.md file in your browser.
make clear		# Deletes all temporary files.
 -->

<!--
_backgroundImage: url('assets/defaults/blob_teal_800_0.svg')
_header: Compiling
 -->

---

# <!-- fit --> Have fun writing! :rocket: :100: :tada:

<!--
_backgroundImage: url('assets/defaults/poly-outline_blue_900_hc_invert_0.svg')
_paginate: false
 -->
