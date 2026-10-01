# CLAUDE.md — stat101.tutorials

`stat101.tutorials` is a tutorial package covering the concepts of an
**introductory statistics course** — distributions, sampling,
estimation, uncertainty, regression, and the rest — worked through in R.
It is built and maintained exactly like
[`vscode.tutorials`](https://github.com/PPBDS/vscode.tutorials): learnr
tutorials in `inst/tutorials/`, launched from the R Tutorials extension,
checked by the same tests and CI.

## Relationship to the base tutorial guide

The base guide
([`claude-md/tutorials/CLAUDE.md`](https://github.com/PPBDS/ai-rules/blob/main/claude-md/tutorials/CLAUDE.md))
is the default contract for this package, and **`stat101.tutorials`
follows it with no departures.** These are normal tutorials: a
statistics topic explored through data, with the full analysis path (get
data, explore it, build a plot or table, interpret, publish), the
`analysis.qmd` working chunk, render + Live Server, CP/CR, and the
standard Introduction/Summary structure. Read the base guide first.

Unlike `vscode.tutorials`, there is **no mechanics exception**. Students
arrive having done `vscode.tutorials` through the Quarto tutorial — the
boundary the base guide assumes — and nothing here re-teaches those
mechanics. When a tutorial needs a skill not taught through Quarto,
scaffold it explicitly or fix it upstream; never assume it silently.

### Choosing topics

The base guide (§7) leaves topic choice to each project. **TODO: define
the topic model here** — the sequence of statistics concepts, which
dataset(s) each tutorial uses, and how a concept maps onto the analysis
path.

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

- **Per-chunk options use Quarto’s `#| key: value` syntax**, not inline
  `, key = value` on the header. The only inline options on the header
  line are `include = FALSE` on the setup chunk and `child = ...` on
  info-section / download-answers child chunks.

### Terminal terminology

Use the fixed vocabulary taught in `vscode.tutorials`: **Panel** (the
bottom region), **the Terminal** (the Terminal view in the Panel),
**terminal** (one session, selected by its **tab**), **bash Terminal** /
**R Terminal**. Instructions always name which one — “In the bash
Terminal, run `quarto render analysis.qmd`” — never bare “the Terminal.”

## Consistency rules

### The bash prompt in example answers

`codespace-starter` sets `PS1='\W \$ '`, so the prompt is the basename
of the working directory, a space, and a dollar sign: `sampling $`.
Never GitHub’s stock long prompt, never a bare `$`. The home directory
is `/home/rstudio` (prompt `~ $`).

### Repo names derive from tutorial titles

Every tutorial uses its own work repo, named after its **title**:
lowercase, with spaces and other non-alphanumeric characters replaced by
dashes (“Sampling Distributions” → `sampling-distributions`). When a
title changes, update the repo-name instruction, every prompt line,
every `/workspaces/<name>` path, and every URL
(`github.com/<user>/<name>`, `<user>.github.io/<name>/`). Do not change
the `id:`, directory name, or chunk labels. A title must never map to
`codespace-starter`.

### Refer to tutorials by title, not number

In prose, refer to a tutorial by its **title**, never its `NN-slug`
directory name. Reserve the directory name for paths, URLs,
`run_tutorial()` calls, and ids. Quote a title written out as a title
(*the next tutorial, “Sampling,” covers…*); short attributive references
(the Sampling tutorial) stay unquoted.

### Renumbering tutorials (directory renames)

Tutorial directories are `inst/tutorials/NN-slug/`. Renaming one fans
out:

1.  `learnr::run_tutorial(name = "NN-slug", ...)` calls in README.Rmd
    (re-render README.md after editing) and inside tutorials.
2.  Files students download from GitHub must **not** live under a
    numbered tutorial directory. Keep them in `inst/extdata/` or at the
    repo root, so a rename never changes the URL. Add a check for each
    such URL in `tests/testthat/test-downloads.R` (see the
    `vscode.tutorials` version for the pattern).
3.  Cross-references in prose, README.Rmd’s tutorial list, the tutorial
    list in `R/stat101.tutorials-package.R` (run `devtools::document()`
    after), and this file.
4.  The YAML `id:` — **the id must always equal the directory name.**

NEWS.md entries are historical records — never retro-renumber them.

### Adding a tutorial

1.  Create `inst/tutorials/NN-slug/tutorial.Rmd` with `id: NN-slug`.
2.  Add any package it uses to `Suggests` in DESCRIPTION. Students’
    devcontainer image has only what the course packages declare, and
    the `student-env-render` CI job fails if a tutorial needs something
    undeclared.
3.  List it in README.Rmd (re-render README.md) and in
    `R/stat101.tutorials-package.R` (re-run `devtools::document()`).

### The devcontainer image pin (`ghcr.io/ppbds/devcontainer:X.Y.Z`)

`.github/workflows/R-CMD-check.yaml`‘s `student-env-render` job runs in
the image students’ Codespaces use. Keep its tag in sync with the
`"image"` pin in [PPBDS/codespace-starter
`.devcontainer/devcontainer.json`](https://github.com/PPBDS/codespace-starter/blob/main/.devcontainer/devcontainer.json).
