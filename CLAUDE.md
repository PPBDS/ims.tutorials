# CLAUDE.md — ims.tutorials

`ims.tutorials` is a tutorial package, one tutorial per chapter of
*Introduction to Modern Statistics*, covering the concepts of an
**introductory statistics course** — distributions, sampling,
estimation, uncertainty, regression, and the rest — worked through in R.
It is organized and maintained like
[`vscode.tutorials`](https://github.com/PPBDS/vscode.tutorials) —
tutorials in `inst/tutorials/`, launched from the R Tutorials extension,
checked by tests and a CI render in the student image — but it is built
on **[learnr2](https://github.com/PPBDS/learnr2)** (development version,
via `Remotes:`), not learnr or tutorial.helpers.

## Read first: ai-rules

The rules for writing tutorials live in
**[PPBDS/ai-rules](https://github.com/PPBDS/ai-rules)** (locally:
[`../ai-rules/`](https://ppbds.github.io/ai-rules/)), not here. Read, in
order:

1.  [`claude-md/CLAUDE.md`](https://github.com/PPBDS/ai-rules/blob/main/claude-md/CLAUDE.md)
    — the map of which guide governs which package.
2.  [`claude-md/tutorials/CLAUDE.md`](https://github.com/PPBDS/ai-rules/blob/main/claude-md/tutorials/CLAUDE.md)
    ([local](https://ppbds.github.io/ai-rules/claude-md/tutorials/CLAUDE.md))
    — the **base tutorial guide**: the AI-era philosophy, exercise
    rhythm, knowledge drops (at most two sentences), submission
    evidence, and formatting. It governs every tutorial here.

This file adds only what is specific to `ims.tutorials`. On anything
both cover, the base guide wins unless an override is recorded below.
When a lesson learned here applies to every tutorial package, fix it in
ai-rules rather than here. The local checkout may be ahead of GitHub;
prefer it when both exist.

## Companion book: *Introduction to Modern Statistics*

Our guide for constructing tutorials is **[*Introduction to Modern
Statistics*](https://openintrostat.github.io/ims/)** (2nd edition) by
Mine Çetinkaya-Rundel and Johanna Hardin, free online under a CC BY-SA
3.0 license. It decides what we teach, in what order, and with what
vocabulary.

How the book shapes a tutorial:

- **Each tutorial is a companion to specific chapters.** Per the base
  guide’s companion-text rule, the tutorial’s first sentence names and
  links the exact chapter, not just the book.
- **Knowledge drops pull key points from that chapter** (the base
  guide’s first kind of drop). Students usually won’t read the chapter,
  so the tutorial is where its main ideas reach them. Use the book’s
  terms (*sampling distribution*, *standard error*, *point estimate*)
  exactly as it defines them.
- **Follow the book’s order.** Never quiz a concept the book introduces
  in a later chapter.
- **Simulation before formulas.** The book teaches inference first
  through randomization and the bootstrap (Part 4) and only then through
  the normal model. Tutorials should do the same: students simulate
  first, then check the result against the formula.
- **Data.** The book’s examples use real datasets, mostly from the
  **[openintro](https://openintrostat.github.io/openintro/)** R package
  (also **usdata**, **cherryblossom**, **palmerpenguins**). Prefer the
  chapter’s own dataset, or another from these packages, so the tutorial
  and the chapter tell the same story. Add any package used to
  `Suggests`.
- **The book shows no R code.** It teaches concepts with tables and
  figures. Our tutorials supply the R work, done by students with AI in
  `analysis.qmd`.

OpenIntro also publishes learnr tutorials and R labs for the book
([openintro.org/book/ims](https://www.openintro.org/book/ims/)), built
on the **tidyverse** and **infer**. They are useful for seeing which
exercises the authors pair with each chapter. They follow a different
philosophy (students type code into exercise chunks), so do not copy
their structure.

| Part | Chapter |
|----|----|
| 1\. Introduction to data | 1 [Hello data](https://openintrostat.github.io/ims/data-hello.html) · 2 [Study design](https://openintrostat.github.io/ims/data-design.html) · 3 [Applications: Data](https://openintrostat.github.io/ims/data-applications.html) |
| 2\. Exploratory data analysis | 4 [Exploring categorical data](https://openintrostat.github.io/ims/explore-categorical.html) · 5 [Exploring numerical data](https://openintrostat.github.io/ims/explore-numerical.html) · 6 [Applications: Explore](https://openintrostat.github.io/ims/explore-applications.html) |
| 3\. Regression modeling | 7 [Linear regression with a single predictor](https://openintrostat.github.io/ims/model-slr.html) · 8 [Linear regression with multiple predictors](https://openintrostat.github.io/ims/model-mlr.html) · 9 [Logistic regression](https://openintrostat.github.io/ims/model-logistic.html) · 10 [Applications: Model](https://openintrostat.github.io/ims/model-applications.html) |
| 4\. Foundations of inference | 11 [Hypothesis testing with randomization](https://openintrostat.github.io/ims/foundations-randomization.html) · 12 [Confidence intervals with bootstrapping](https://openintrostat.github.io/ims/foundations-bootstrapping.html) · 13 [Inference with mathematical models](https://openintrostat.github.io/ims/foundations-mathematical.html) · 14 [Decision errors](https://openintrostat.github.io/ims/foundations-errors.html) · 15 [Applications: Foundations](https://openintrostat.github.io/ims/foundations-applications.html) |
| 5\. Statistical inference | 16 [Inference for a single proportion](https://openintrostat.github.io/ims/inference-one-prop.html) · 17 [Comparing two proportions](https://openintrostat.github.io/ims/inference-two-props.html) · 18 [Two-way tables](https://openintrostat.github.io/ims/inference-tables.html) · 19 [A single mean](https://openintrostat.github.io/ims/inference-one-mean.html) · 20 [Two independent means](https://openintrostat.github.io/ims/inference-two-means.html) · 21 [Paired means](https://openintrostat.github.io/ims/inference-paired-means.html) · 22 [Many means](https://openintrostat.github.io/ims/inference-many-means.html) · 23 [Applications: Infer](https://openintrostat.github.io/ims/inference-applications.html) |
| 6\. Inferential modeling | 24 [Inference for regression, single predictor](https://openintrostat.github.io/ims/inf-model-slr.html) · 25 [Multiple predictors](https://openintrostat.github.io/ims/inf-model-mlr.html) · 26 [Logistic regression](https://openintrostat.github.io/ims/inf-model-logistic.html) · 27 [Applications: Model and infer](https://openintrostat.github.io/ims/inf-model-applications.html) |

### One tutorial per chapter

- **Each chapter gets exactly one tutorial**, in the book’s order. Its
  directory is the two-digit chapter number plus a slug of the chapter
  title, and its title is the chapter title in Title Case: Chapter 1,
  “Hello data,” is `01-hello-data`, titled “Hello Data,” with work repo
  `hello-data`.
- **60 minutes or less**, which generally means **around 40 questions**.
  A chapter with more material than that gets its most important ideas,
  not all of them.
- **At most two topics.** Per the *Tutorials in the Age of AI* article
  (see the base guide’s *Sources*), a one-hour AI tutorial has at most
  two topics between the Introduction and the Summary. Follow the
  chapter’s sections in order, merging them into two topics when the
  chapter has more, each built on the chapter’s own datasets.
- **Introduction and Summary follow the *Tutorials for Books* article.**
  The Introduction’s first sentence: “This tutorial covers [Chapter N:
  Title](https://ppbds.github.io/ims.tutorials/url) from [*Introduction
  to Modern Statistics*](https://openintrostat.github.io/ims/) by Mine
  Çetinkaya-Rundel and Johanna Hardin.” Then one sentence on what
  students will learn. The Summary repeats that paragraph in the past
  tense, then points to one or two of the best further readings, ideally
  a source the chapter cites that an earlier knowledge drop already
  mentioned.
- **Knowledge drops quote the chapter.** Pick the chapter’s most
  important sentences, its definitions and its warnings, and quote them
  directly, in quotation marks, so the student meets the book’s exact
  wording. The other drop sentence ties the quote to what the student’s
  output just showed. Never more than two sentences.
- **Students only code, using AI.** There are no multiple-choice or quiz
  questions (base guide §3). Each concept the chapter defines is taught
  by an exercise whose output displays it: averaging `interest_rate`
  shows what makes a variable numerical, and counting the levels of
  `grade` shows a categorical one. The knowledge drop then names the
  concept in the book’s words.
- **Help-page exercises.** Per *Tutorials for Books*, have students run
  `?dataset` in the R Terminal and paste part of the help page, at least
  once per dataset. Our answer is the relevant excerpt. Help pages are
  also where documentation and data disagree, which makes them good
  material for knowledge drops.
- **Override: one exercise per library.** The base guide (§4,
  Introduction step 2) loads every library in one exercise. Here each
  library gets its own exercise, per *Tutorials for Books*, adding to
  the setup chunk in turn. Each is a knowledge-drop opportunity about
  that package’s place in the book.
- **Override: no interpretation exercises.** The base guide (§4,
  *Analysis path*) asks for a written interpretation after each major
  plot. Here students only code, so the takeaway goes in the plot’s
  subtitle instead, written as part of the plot-improvement exercise,
  per *Tutorials in the Age of AI*. Each topic ends with a plot built in
  one exercise and improved in the next.

## learnr2, not learnr

Each tutorial is a Quarto document, `inst/tutorials/<name>/<name>.qmd`,
with `format: live-html` and `engine: knitr`. Questions, the
student-information block, and the download button are
[`learnr2::question()`](https://ppbds.github.io/learnr2/reference/question.html),
[`learnr2::student_info()`](https://ppbds.github.io/learnr2/reference/student_info.html),
and
[`learnr2::download_answers_button()`](https://ppbds.github.io/learnr2/reference/download_answers_button.html)
calls in `{r}` chunks with `#| echo: false`. **Read learnr2’s
[`AGENTS.md`](https://github.com/PPBDS/learnr2/blob/main/AGENTS.md)
before writing a tutorial** — it is the authoring guide for the file
format (frontmatter, chunk labels, exercises, hints, solutions, quizzes,
the `webr: packages:` list, and the traps). Use
[`learnr2::create_tutorial()`](https://ppbds.github.io/learnr2/reference/create_tutorial.html)
or the bundled `intro-vectors` tutorial as a starting point. Never add
[`library(learnr)`](https://rstudio.github.io/learnr/),
[`library(tutorial.helpers)`](https://ppbds.github.io/tutorial.helpers/),
child documents, or a `tutorial: id:` field.

The `_extensions/` directory is added at render time by
[`learnr2::run_tutorial()`](https://ppbds.github.io/learnr2/reference/run_tutorial.html);
it is git-ignored and build-ignored, never committed.

## Relationship to the base tutorial guide

The base guide
([`claude-md/tutorials/CLAUDE.md`](https://github.com/PPBDS/ai-rules/blob/main/claude-md/tutorials/CLAUDE.md))
is the default contract for this package, and **`ims.tutorials` follows
it in full**; where it conflicts with learnr2’s own guide, the base
guide wins (see the mapping below). These are normal tutorials: a
statistics topic explored through data, with the full analysis path (get
data, explore it, build a plot or table, interpret, publish), the
`analysis.qmd` working chunk, render + Live Server, CP/CR, and the
standard Introduction/Summary structure. Read the base guide first.

### How the base guide maps onto learnr2

`inst/tutorials/01-hello-data/` is the reference implementation of this
mapping and of everything in this file; copy its patterns.

- **The student workflow is unchanged.** Students work in a Codespace on
  their own `analysis.qmd`, render with Live Server, commit, and submit
  `show_file()` output with CP/CR. This overrides learnr2’s “no local R
  dependency” rule, which assumes a reader with nothing but a browser.
- **`show_file()` comes from learnr2, not tutorial.helpers.** It is
  installed with this package (learnr2 is in `Imports`), and the
  standing note on the first `show_file()` exercise names
  [`library(learnr2)`](https://github.com/PPBDS/learnr2). Its default
  differs from the base guide’s version: for a file with code chunks it
  shows only the last chunk. So the evidence call is
  `show_file("analysis.qmd")`, never `chunk = "Last"`, and the Summary’s
  whole-file check is `show_file("analysis.qmd", start = 0)`. Files
  without chunks, like `.gitignore`, print whole by default.
- **Questions** are
  `learnr2::question("CP/CR.", type = "reflection_editable")`, the
  equivalent of the base guide’s no-answer `question_text()`. URL and
  interpretation questions use the same type with a different prompt
  (“Paste the URL of your published page.”).
- **Pacing.** learnr2 gates every `##`/`###` section behind a Continue
  button, and a bare `###` line renders as an empty section, so the base
  guide’s two `###` dividers (question → our answer → knowledge drop)
  work unchanged. `toc-depth: 2` keeps the dividers and `### Exercise N`
  headings out of the sidebar.
- **Our answers** are render-time `{r}` chunks with `#| echo: true`, as
  in the base guide, backed by a hidden setup chunk
  (`#| include: false`) that loads the tidyverse. This overrides
  learnr2’s rule that `{r}` chunks hold only widget calls: every package
  these chunks use must be in `Suggests`. No
  [webr](https://github.com/cardiomoon/webr) cells; the base guide’s ban
  on exercise code chunks stands.
- **Chunk labels** follow the base guide’s `section-name-N` (question)
  and `section-name-N-test` (answer) format. The question’s label is its
  learnr2 `id`.
- **No install exercises.** Every package a tutorial uses, including the
  book’s data packages (**openintro**, **usdata**, and others), goes in
  `Suggests` in DESCRIPTION. The student image installs each course
  package’s `Suggests`, so students never install packages by hand.

### Departures recorded (as of “Histograms”)

Per the base guide’s override protocol — name the departure, justify it:

1.  **No `show_file()`; evidence is submitted in the browser.** learnr2
    has no `show_file()`, so the base guide’s evidence forms map onto
    question types: QMD-edit and working-chunk evidence becomes a
    `type = "reflection_editable"` question where the student pastes
    their code (CP/CR shorthand still applies to terminal pastes); our
    answer is a `### What you should see` block with the faked output or
    our code, the stand-in for the base guide’s `echo = TRUE` answer
    chunk; interpretation questions use `type = "reflection"` with a
    model answer. The Summary’s whole-file check
    (`show_file("analysis.qmd")`) becomes a screenshot of the rendered
    page pasted into a `reflection_editable` question with
    `allow_image = TRUE`; the GitHub-based Summary step still ends at
    the repo URL.
2.  **The intro names its environment.** The base guide says an intro
    must not mention Codespaces or `codespace-starter`. This package’s
    entry point (below) fixes both, and every faked terminal answer
    needs a real prompt (`histograms $`) and a real `/workspaces/...`
    path, so tutorials here name them.
3.  **Repo setup is taught by hand.** Where the base guide’s standard
    repo line says “create one and connect to it”, the Histograms
    tutorial walks the real `gh`/`git` sequence and forbids
    `connect-repo`, so students practice the commands they will reuse
    this term. The rest of the base guide’s structure (three-exercise
    cache arc, per-section commits, `###`-gated expected output then
    knowledge drop, Summary sequence) is followed as written.

Unlike `vscode.tutorials`, there is **no mechanics exception**. Students
arrive having done `vscode.tutorials` through the Quarto tutorial — the
boundary the base guide assumes — and nothing here re-teaches those
mechanics. When a tutorial needs a skill not taught through Quarto,
scaffold it explicitly or fix it upstream; never assume it silently.

### Choosing topics

The base guide (§7) leaves topic choice to each project. Here, the topic
of each tutorial is one chapter of *Introduction to Modern Statistics*,
including the “Applications” chapters (see *One tutorial per chapter*,
above). Use the chapter’s own datasets; when a dataset hides a
discoverable anomaly, as `county` does with Kalawao County’s 0%
homeownership, build an exercise that lets the student find it.

### The universal entry point

Same as every package: open a Codespace on `main` from
`PPBDS/codespace-starter`, then start the tutorial from the R Tutorials
extension. Every tutorial’s intro uses the standard repo line: *“You
should be doing this tutorial in a repo named `whatever`. If you are
not, create one and then connect to it. You may need to restart this
tutorial after you do so.”*

## Authoring conventions

The project-wide syntactic conventions apply exactly as in the base
guide:

- **Per-chunk options use Quarto’s `#| key: value` syntax**, never
  inline `, key = value` on the header — including `#| label:`, which
  every chunk needs.
- **Hint/solution divs must precede the first `###` of their `##`
  section.** learnr2’s quiz.js excludes any level-3 section containing
  `.exercise-hint` or `.solution` from progressive gating, so an
  exercise placed after a `###` heading reveals that knowledge drop
  without a Continue click. Keep each section’s exercise + hint +
  solution before its first `###`; display-only demo cells use
  `#| autorun: true` so their output is ready when the section unlocks.

### Terminal terminology

Use the fixed vocabulary taught in `vscode.tutorials`: **Panel** (the
bottom region), **the Terminal** (the Terminal view in the Panel),
**terminal** (one session, selected by its **tab**), **bash Terminal** /
**R Terminal**. Instructions always name which one — “In the bash
Terminal, run `quarto render analysis.qmd`” — never bare “the Terminal.”

## Consistency rules

### The bash prompt in example answers

`codespace-starter` sets `PS1='\W \$ '`, so the prompt is the basename
of the working directory, a space, and a dollar sign: `hello-data $`.
Never GitHub’s stock long prompt, never a bare `$`. The home directory
is `/home/rstudio` (prompt `~ $`).

### Repo names derive from tutorial titles

Every tutorial uses its own work repo, named after its **title**:
lowercase, with each run of spaces and other non-alphanumeric characters
collapsed to a single dash (“Hello Data” → `hello-data`, “Applications:
Data” → `applications-data`). When a title changes, update the repo-name
instruction, every prompt line, every `/workspaces/<name>` path, and
every URL (`github.com/<user>/<name>`, `<user>.github.io/<name>/`). Do
not change the directory name, `.qmd` file name, or chunk labels (a
`question()` chunk’s label is the key for the student’s saved answer). A
title must never map to `codespace-starter`.

### Refer to tutorials by title, not number

In prose, refer to a tutorial by its **title**, never its `NN-slug`
directory name. Reserve the directory name for paths, URLs,
`run_tutorial()` calls, and ids. Quote a title written out as a title
(*the next tutorial, “Study Design,” covers…*); short attributive
references (the Hello Data tutorial) stay unquoted.

### Renumbering tutorials (directory renames)

Tutorial directories are `inst/tutorials/NN-slug/`, holding
`NN-slug.qmd`. Renaming one fans out:

1.  `learnr2::run_tutorial(name = "NN-slug", ...)` calls in README.Rmd
    (re-render README.md after editing) and inside tutorials.
2.  Files students download from GitHub must **not** live under a
    numbered tutorial directory. Keep them in `inst/extdata/` or at the
    repo root, so a rename never changes the URL. Add a check for each
    such URL in `tests/testthat/test-downloads.R` (see the
    `vscode.tutorials` version for the pattern).
3.  Cross-references in prose, README.Rmd’s tutorial list, the tutorial
    list in `R/ims.tutorials-package.R` (run `devtools::document()`
    after), and this file.
4.  The `.qmd` file name and the `filename_prefix` of
    `download_answers_button()` — both **must always equal the directory
    name.**

NEWS.md entries are historical records — never retro-renumber them.

### Adding a tutorial

1.  Create `inst/tutorials/NN-slug/NN-slug.qmd`, with
    `download_answers_button(filename_prefix = "NN-slug")`.
2.  List every non-base package its
    [webr](https://github.com/cardiomoon/webr) cells use under
    `webr: packages:` in the frontmatter, and add any package its `{r}`
    chunks use to `Suggests` in DESCRIPTION. Students’ devcontainer
    image has only what the course packages declare, and the
    `student-env-render` CI job fails if a tutorial needs something
    undeclared.
3.  List it in README.Rmd (re-render README.md) and in
    `R/ims.tutorials-package.R` (re-run `devtools::document()`).

### The devcontainer image pin (`ghcr.io/ppbds/devcontainer:X.Y.Z`)

`.github/workflows/R-CMD-check.yaml`‘s `student-env-render` job runs in
the image students’ Codespaces use. Keep its tag in sync with the
`"image"` pin in [PPBDS/codespace-starter
`.devcontainer/devcontainer.json`](https://github.com/PPBDS/codespace-starter/blob/main/.devcontainer/devcontainer.json).
