# The package ships with no tutorials until the first one is written, so each
# test skips rather than fails when there is nothing to check.

test_that("tutorial paths can be found", {
  tutorial_paths <- tutorial.helpers::return_tutorial_paths(package = "stat101.tutorials")
  skip_if(length(tutorial_paths) == 0, "No tutorials yet")
  expect_true(length(tutorial_paths) > 0)
})

test_that("tutorials can be knitted", {
  testthat::skip_on_cran() # Needed because the data directories are not on CRAN.

  tutorial_paths <- tutorial.helpers::return_tutorial_paths(package = "stat101.tutorials")
  skip_if(length(tutorial_paths) == 0, "No tutorials yet")
  tutorial.helpers::knit_tutorials(tutorial_paths)
})

test_that("tutorials have default components", {
  tutorial_paths <- tutorial.helpers::return_tutorial_paths(package = "stat101.tutorials")
  skip_if(length(tutorial_paths) == 0, "No tutorials yet")
  tutorial.helpers::check_tutorial_defaults(tutorial_paths)
})
