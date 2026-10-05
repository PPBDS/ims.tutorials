# Tutorials for Introduction to Modern Statistics

The ims.tutorials package provides interactive tutorials covering the
concepts of an introductory statistics course, worked through in R.

## Details

A collection of interactive tutorials, one per chapter, accompanying
*Introduction to Modern Statistics* by Mine Çetinkaya-Rundel and Johanna
Hardin. Tutorials are built with the learnr2 package: Quarto documents
rendered to static web pages. Students do the work in their own
`analysis.qmd`, using AI, and submit evidence of each step.

## Tutorials

- **Hello Data** (01-hello-data): Chapter 1 — cases, variables,
  associations, and experiments versus observational studies

- **Study Design** (02-study-design): Chapter 2 — populations and
  samples, sampling methods, and the principles of experiments

- **Applications: Data** (03-applications-data): Chapter 3 — getting to
  know a new dataset, and Simpson's paradox

- **Exploring Categorical Data** (04-exploring-categorical-data):
  Chapter 4 — contingency tables, bar plots, conditional proportions,
  and comparing numerical data across groups

- **Exploring Numerical Data** (05-exploring-numerical-data): Chapter 5
  — histograms, shape, mean and standard deviation, box plots and robust
  statistics, transformations, and maps

## Running Tutorials

To run a tutorial, use:
`learnr2::run_tutorial(name = "tutorial_name", package = "ims.tutorials")`

## See also

Useful links:

- <https://ppbds.github.io/ims.tutorials/>

- <https://github.com/PPBDS/ims.tutorials>

- Report bugs at <https://github.com/PPBDS/ims.tutorials/issues>

## Author

**Maintainer**: David Kane <dave.kane@gmail.com>
([ORCID](https://orcid.org/0000-0002-6660-3934)) \[copyright holder\]
