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
#'   \item \strong{Hello Data} (hello-data): Chapter 1 --- cases, variables, associations, and experiments versus observational studies
#'   \item \strong{Study Design} (study-design): Chapter 2 --- populations and samples, four sampling methods, randomized experiments versus observational studies
#'   \item \strong{Applications: Data} (applications-data): Chapter 3 --- getting to know a new dataset, and Simpson's paradox
#'   \item \strong{Exploring Categorical Data} (exploring-categorical-data): Chapter 4 --- contingency tables, bar plots, conditional proportions, and comparing numerical data across groups
#'   \item \strong{Exploring Numerical Data} (exploring-numerical-data): Chapter 5 --- histograms, shape, mean and standard deviation, box plots and robust statistics, transformations, and maps
#'   \item \strong{Applications: Explore} (applications-explore): Chapter 6 --- keeping plots simple, color, telling a story, order, labels, and purpose
#'   \item \strong{Linear Regression with a Single Predictor} (linear-regression-single): Chapter 7 --- fitting a line, residuals, correlation, least squares, R-squared, categorical predictors, and outliers
#'   \item \strong{Linear Regression with Multiple Predictors} (linear-regression-multiple): Chapter 8 --- indicator and categorical predictors, multiple regression, adjusted R-squared, and stepwise model selection
#'   \item \strong{Logistic Regression} (logistic-regression): Chapter 9 --- callback rates, the logit, logistic models with one and many predictors, predicted probabilities, and groups of different sizes
#'   \item \strong{Applications: Model} (applications-model): Chapter 10 --- correlation, simple and multiple regression of house prices, residual plots, and backward elimination
#'   \item \strong{Hypothesis Testing with Randomization} (hypothesis-testing-randomization): Chapter 11 --- hypotheses, randomization tests, null distributions, p-values, statistical discernibility
#'   \item \strong{Confidence Intervals with Bootstrapping} (confidence-intervals-bootstrap): Chapter 12 --- bootstrapping, bootstrap percentile confidence intervals, confidence level
#'   \item \strong{Inference with Mathematical Models} (inference-mathematical-models): Chapter 13 --- the Central Limit Theorem, the normal model, standard errors, normal-based tests and intervals
#'   \item \strong{Decision Errors} (decision-errors): Chapter 14 --- two-sided tests, Type 1 and Type 2 errors, the discernibility level, power
#'   \item \strong{Applications: Foundations} (applications-foundations): Chapter 15 --- the malaria vaccine case study, a randomization test, and three kinds of distribution
#'   \item \strong{Inference for a Single Proportion} (inference-for-a-single-proportion): Chapter 16 --- the bootstrap test for a proportion, the success-failure condition, normal intervals and tests
#'   \item \strong{Inference for Comparing Two Proportions} (comparing-two-proportions): Chapter 17 --- randomization test, bootstrap interval, and the normal model for a difference in proportions
#'   \item \strong{Inference for Two-Way Tables} (inference-two-way-tables): Chapter 18 --- expected counts, the chi-squared statistic, randomization test of independence, the chi-squared distribution
#'   \item \strong{Inference for a Single Mean} (inference-single-mean): Chapter 19 --- bootstrap interval for a mean, the t-distribution, t-intervals and t-tests
#'   \item \strong{Inference for Comparing Two Independent Means} (comparing-independent-means): Chapter 20 --- randomization tests, bootstrap intervals, and the t-distribution for a difference in means
#'   \item \strong{Inference for Comparing Paired Means} (comparing-paired-means): Chapter 21 --- paired data, randomization within pairs, bootstrap intervals, the paired t-test
#'   \item \strong{Inference for Comparing Many Means} (comparing-many-means): Chapter 22 --- randomization test with the F statistic, ANOVA, the F distribution
#'   \item \strong{Applications: Infer} (applications-infer): Chapter 23 --- the redundant adjectives case study: intervals and tests for one, paired, and independent means
#'   \item \strong{Inference for Linear Regression with a Single Predictor} (regression-single-inference): Chapter 24 --- randomization test and bootstrap interval for a slope, the t-test and interval, model conditions
#'   \item \strong{Inference for Linear Regression with Multiple Predictors} (regression-multiple-inference): Chapter 25 --- regression output with many predictors, multicollinearity, cross-validation
#'   \item \strong{Inference for Logistic Regression} (logistic-regression-inference): Chapter 26 --- inference for logistic coefficients, model diagnostics, cross-validation
#'   \item \strong{Applications: Model and Infer} (applications-model-infer): Chapter 27 --- the Mario Kart case study: regression output, permutation test and bootstrap for a slope, cross-validation
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
