#' Tutorials for Introduction to Modern Statistics
#'
#' A collection of interactive tutorials, one per chapter, accompanying
#' *Introduction to Modern Statistics* by Mine Çetinkaya-Rundel and Johanna
#' Hardin. Tutorials are built with the learnr2 package: Quarto documents
#' rendered to static web pages. Students do the work in their own
#' `analysis.qmd`, using AI, and submit evidence of each step.
#'
#' @description
#' The ims.tutorials package provides interactive tutorials covering the
#' concepts of an introductory statistics course, worked through in R.
#'
#' @section Tutorials:
#' \itemize{
#'   \item \strong{Hello Data} (01-hello-data): Chapter 1 --- cases, variables, associations, and experiments versus observational studies
#'   \item \strong{Study Design} (02-study-design): Chapter 2 --- populations and samples, sampling methods, and the principles of experiments
#'   \item \strong{Applications: Data} (03-applications-data): Chapter 3 --- getting to know a new dataset, and Simpson's paradox
#'   \item \strong{Exploring Categorical Data} (04-exploring-categorical-data): Chapter 4 --- contingency tables, bar plots, conditional proportions, and comparing numerical data across groups
#'   \item \strong{Exploring Numerical Data} (05-exploring-numerical-data): Chapter 5 --- histograms, shape, mean and standard deviation, box plots and robust statistics, transformations, and maps
#' }
#'
#' @section Running Tutorials:
#' To run a tutorial, use:
#' \code{learnr2::run_tutorial(name = "tutorial_name", package = "ims.tutorials")}
#'
#' @importFrom learnr2 question
#'
#' @keywords internal
"_PACKAGE"
