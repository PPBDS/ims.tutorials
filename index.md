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
learnr2::run_tutorial(name = "hello-data",
                     package = "ims.tutorials")
```

- *Hello Data* (“hello-data”). Chapter 1: the stent experiment, cases
  and variables in `loan50`, associations among US counties, and
  experiments versus observational studies.
- *Study Design* (“study-design”). Chapter 2: populations and samples,
  and simple random, stratified, and convenience sampling with `mlb`
  salaries; random assignment, blinding, and placebos with the stent
  experiment; confounding in `county`.
- *Applications: Data* (“applications-data”). Chapter 3: getting to know
  `paralympic_1500`, and Simpson’s paradox in 1500m gold medal times.
- *Exploring Categorical Data* (“exploring-categorical-data”). Chapter
  4: contingency tables, bar plots, and conditional proportions in
  `loans_full_schema`, and comparing county incomes across groups.
- *Exploring Numerical Data* (“exploring-numerical-data”). Chapter 5:
  histograms, shape, and summary statistics for `loan50`, and
  transformations and intensity maps of `county`.
- *Applications: Explore* (“applications-explore”). Chapter 6: keeping
  plots simple, using color to draw attention, and telling a story with
  the chapter’s company expenses and Duke hiring data, then order,
  labels, purpose, and color with its Brexit poll.
- *Linear Regression with a Single Predictor*
  (“linear-regression-single”). Chapter 7: fitting a least squares line,
  residuals, correlation, R-squared, a two-level categorical predictor,
  and outliers, with `possum`, `elmhurst`, and `mariokart`.
- *Linear Regression with Multiple Predictors*
  (“linear-regression-multiple”). Chapter 8: indicator and categorical
  predictors, many predictors, adjusted R-squared, and backward and
  forward selection, modeling interest rates in `loans_full_schema`.
- *Logistic Regression* (“logistic-regression”). Chapter 9: callback
  rates in the `resume` hiring experiment, the logit, logistic models
  with one and many predictors, predicted probabilities, and groups of
  different sizes.
- *Applications: Model* (“applications-model”). Chapter 10: a case study
  of house prices in `duke_forest`, from correlation and a one-predictor
  model to a multiple regression chosen by backward elimination.
- *Hypothesis Testing with Randomization*
  (“hypothesis-testing-randomization”). Chapter 11: hypotheses,
  randomization tests, null distributions, p-values, and statistical
  discernibility, with the `sex_discrimination` and `opportunity_cost`
  experiments.
- *Confidence Intervals with Bootstrapping*
  (“confidence-intervals-bootstrap”). Chapter 12: bootstrapping a
  proportion and bootstrap percentile confidence intervals, with the
  chapter’s medical consultant and tappers-and-listeners case studies,
  and a simulation of what 95% confidence means.
- *Inference with Mathematical Models*
  (“inference-mathematical-models”). Chapter 13: the Central Limit
  Theorem, the normal model, standard errors, and normal-based tests and
  intervals, checked against simulation, with `opportunity_cost` and
  `stent30`.
- *Decision Errors* (“decision-errors”). Chapter 14: two-sided tests,
  Type 1 and Type 2 errors, the discernibility level, and power,
  simulated on the `cpr` blood-thinner experiment.
- *Applications: Foundations* (“applications-foundations”). Chapter 15:
  a randomization test on the 20-volunteer malaria vaccine trial,
  `malaria`, comparing data, randomization, and bootstrap distributions.
- *Inference for a Single Proportion*
  (“inference-for-a-single-proportion”). Chapter 16: the bootstrap test
  for a proportion and the normal model (success-failure condition,
  confidence intervals, Z test), with the chapter’s medical consultant
  and payday loan polls.
- *Inference for Comparing Two Proportions*
  (“comparing-two-proportions”). Chapter 17: randomization tests,
  bootstrap intervals, and the normal model for a difference in
  proportions, with pooled and unpooled standard errors, using `cpr`,
  `fish_oil_18`, and `mammogram`.
- *Inference for Two-Way Tables* (“inference-two-way-tables”). Chapter
  18: expected counts, the chi-squared statistic, a randomization test
  of independence, and the chi-squared distribution, using `ask` and
  `diabetes2`.
- *Inference for a Single Mean* (“inference-single-mean”). Chapter 19:
  bootstrap and t-distribution intervals and a t-test for a mean, using
  the chapter’s sample of 100 runners from `run17`.
- *Inference for Comparing Two Independent Means*
  (“comparing-independent-means”). Chapter 20: randomization tests,
  bootstrap intervals, and the t-distribution for a difference in means,
  using `classdata`, `stem_cell`, and `births14`.
- *Inference for Comparing Paired Means* (“comparing-paired-means”).
  Chapter 21: paired data, randomization within pairs, bootstrap
  intervals, and the paired t-test, using UCLA Bookstore and Amazon
  textbook prices in `ucla_textbooks_f18`.
- *Inference for Comparing Many Means* (“comparing-many-means”). Chapter
  22: ANOVA by randomization test on the F statistic and by the F
  distribution, using `classdata` and on-base percentage by position in
  `mlb_players_18`.
- *Applications: Infer* (“applications-infer”). Chapter 23: the
  redundant-adjectives experiment, with a bootstrap interval for one
  mean, a paired randomization test, and tests for two independent
  means, each checked against the t-distribution.
- *Inference for Linear Regression with a Single Predictor*
  (“regression-single-inference”). Chapter 24: randomization tests and
  bootstrap intervals for a slope, then the t-test, t-interval, and
  model conditions, using `births14`, `midterms_house`, and `elmhurst`.
- *Inference for Linear Regression with Multiple Predictors*
  (“regression-multiple-inference”). Chapter 25: regression output with
  many predictors for `loans_full_schema`, multicollinearity, and
  cross-validation with `penguins`.
- *Inference for Logistic Regression* (“logistic-regression-inference”).
  Chapter 26: inference for logistic regression coefficients, model
  diagnostics, and cross-validation of spam models, using `email`.
- *Applications: Model and Infer* (“applications-model-infer”). Chapter
  27: a case study of Mario Kart auctions in `mariokart`, with
  regression output, a permutation test and bootstrap for a slope, and
  cross-validation.
