
<!-- README.md is generated from README.Rmd. Edit ONLY this file if you need to make a change in README.md. But, after you edit it, you run `rmarkdown::render("README.Rmd")` in order to create the new README.md, which is the thing which is actually used. Must be a better way of doing this! -->

# IMS Tutorials

<!-- badges: start -->

[![R build
status](https://github.com/PPBDS/ims.tutorials/workflows/R-CMD-check/badge.svg)](https://github.com/PPBDS/ims.tutorials/actions)
<!-- badges: end -->

Package website: <https://ppbds.github.io/ims.tutorials/>

## About this package

**ims.tutorials** is a collection of tutorials, one per chapter,
accompanying [*Introduction to Modern
Statistics*](https://openintrostat.github.io/ims/) by Mine
Çetinkaya-Rundel and Johanna Hardin. Students work through each
chapter’s ideas in R, using AI to build an analysis in their own Quarto
document. Built with **[learnr2](https://github.com/PPBDS/learnr2)**:
each tutorial is a Quarto document rendered to a static web page.

## Installation

Install the development version from [GitHub](https://github.com/) with:

``` r
remotes::install_github("PPBDS/ims.tutorials", dependencies = TRUE)
```

This also installs the development version of **learnr2** and every
package the tutorials use, including the book’s data packages,
**openintro** and **usdata**. Rendering a tutorial requires the [Quarto
CLI](https://quarto.org/docs/get-started/).

## Tutorials

The recommended way to launch tutorials is with the [R Tutorials
extension for VS
Code](https://open-vsx.org/extension/PPBDS/vscode-r-tutorials), which
lists every installed tutorial and lets you start one with a click.

As a backup, you can launch a tutorial from the R console with
`learnr2::run_tutorial()`, providing the short name of the tutorial and
the package name.

    learnr2::run_tutorial(name = "01-hello-data",
                         package = "ims.tutorials")

- *Hello Data* (“01-hello-data”). Chapter 1: the stent experiment, cases
  and variables in `loan50`, associations among US counties, and
  experiments versus observational studies.
- *Study Design* (“02-study-design”). Chapter 2: populations and samples
  using `mlb` salaries, simple random and stratified sampling, and the
  malaria vaccine experiment.
- *Applications: Data* (“03-applications-data”). Chapter 3: getting to
  know `paralympic_1500`, and Simpson’s paradox in 1500m gold medal
  times.
- *Exploring Categorical Data* (“04-exploring-categorical-data”).
  Chapter 4: contingency tables, bar plots, and conditional proportions
  in `loans_full_schema`, and comparing county incomes across groups.
- *Exploring Numerical Data* (“05-exploring-numerical-data”). Chapter 5:
  histograms, shape, and summary statistics for `loan50`, and
  transformations and intensity maps of `county`.
- *Histograms* (“06-histograms”). Read, make, and interpret histograms:
  what the bars count, how to choose the bins, center, spread, and
  shape, comparing groups with facets, and a log scale for skewed data,
  using `ggplot2::mpg` and `ggplot2::diamonds`. Students connect a repo
  of their own with `gh` and `git`, build `analysis.qmd` as they go, and
  submit the repository URL at the end.
