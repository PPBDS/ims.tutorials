# IMS Tutorials

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
[`learnr2::run_tutorial()`](https://ppbds.github.io/learnr2/reference/run_tutorial.html),
providing the short name of the tutorial and the package name.

``` R
learnr2::run_tutorial(name = "01-hello-data",
                     package = "ims.tutorials")
```

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
