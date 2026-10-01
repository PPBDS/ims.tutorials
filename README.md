
<!-- README.md is generated from README.Rmd. Edit ONLY this file if you need to make a change in README.md. But, after you edit it, you run `rmarkdown::render("README.Rmd")` in order to create the new README.md, which is the thing which is actually used. Must be a better way of doing this! -->

# Statistics 101 Tutorials

<!-- badges: start -->

[![R build
status](https://github.com/PPBDS/stat101.tutorials/workflows/R-CMD-check/badge.svg)](https://github.com/PPBDS/stat101.tutorials/actions)
<!-- badges: end -->

Package website: <https://ppbds.github.io/stat101.tutorials/>

## About this package

**stat101.tutorials** is a collection of tutorials covering the concepts
of an introductory statistics course, worked through in R. Makes
extensive use of the tools in the
**[tutorial.helpers](https://ppbds.github.io/tutorial.helpers/)**
package.

## Installation

Install the development version from [GitHub](https://github.com/) with:

``` r
remotes::install_github("PPBDS/stat101.tutorials")
```

## Tutorials

The recommended way to launch tutorials is with the [R Tutorials
extension for VS
Code](https://open-vsx.org/extension/PPBDS/vscode-r-tutorials), which
lists every installed tutorial and lets you start one with a click.

As a backup, you can launch a tutorial from the R console with
`learnr::run_tutorial()`, providing the short name of the tutorial and
the package name.

    learnr::run_tutorial(name = "01-example",
                         package = "stat101.tutorials")

There are no tutorials yet.
