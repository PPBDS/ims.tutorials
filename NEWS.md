# ims.tutorials 0.0.0.9002

* Added five tutorials, the companions to Chapters 6 through 10 of *Introduction to
  Modern Statistics*: Applications: Explore (`06-applications-explore`), Linear
  Regression with a Single Predictor (`07-linear-regression-single`),
  Linear Regression with Multiple Predictors
  (`08-linear-regression-multiple`), Logistic Regression
  (`09-logistic-regression`), and Applications: Model (`10-applications-model`).

* Applications: Explore has students download the chapter's Brexit poll from
  `inst/extdata/brexit.csv`. A new test checks that the URL works and that the
  tutorial's own copy matches it.

* Added **broom** and **scales** to `Suggests`, used by the new tutorials' answer
  chunks, and **httr2**, used by the download test.

* Every question now locks once submitted (`type = "reflection"`), and its text
  carries the whole instruction, such as running `show_file("analysis.qmd")` and
  pasting the result. This follows learnr2's "submit once, then locked" rule.
  Students must also submit each question before the next Continue button works.
  Only the minutes question stays editable.

* Renamed the package from `stat101.tutorials` to `ims.tutorials`, matching the
  GitHub repository.

* Added four tutorials, the companions to Chapters 2 through 5 of *Introduction to
  Modern Statistics*: Study Design (`02-study-design`), Applications: Data
  (`03-applications-data`), Exploring Categorical Data
  (`04-exploring-categorical-data`), and Exploring Numerical Data
  (`05-exploring-numerical-data`).

* Added **ggridges** and **maps** to `Suggests`, for the ridge plot in Exploring
  Categorical Data and the county intensity map in Exploring Numerical Data. The
  student devcontainer image already carries both, via `misc.tutorials`.

# stat101.tutorials 0.0.0.9000

* Initial package infrastructure, modeled on `vscode.tutorials` and built on learnr2.

* Added the first tutorial, Hello Data (`01-hello-data`), the companion to Chapter 1 of
  *Introduction to Modern Statistics*. It replaces an earlier Sampling example.
