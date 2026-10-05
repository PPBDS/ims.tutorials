# Each test skips rather than fails if, for some reason, no tutorials are
# installed (for example, an incomplete build).

tutorial_names <- function() {
  learnr2::available_tutorials(package = "ims.tutorials")$name
}

test_that("every tutorial directory holds a .qmd", {
  tutorials <- learnr2::available_tutorials(package = "ims.tutorials")
  skip_if(nrow(tutorials) == 0, "No tutorials yet")
  expect_true(all(tutorials$format == "quarto"))
})

test_that("tutorials can be rendered", {
  testthat::skip_on_cran() # Rendering needs the Quarto CLI.
  skip_if(length(tutorial_names()) == 0, "No tutorials yet")

  for (name in tutorial_names()) {
    html <- learnr2::run_tutorial(name, package = "ims.tutorials",
                                  output_dir = withr::local_tempdir(),
                                  open = FALSE)
    expect_true(file.exists(html), label = name)
  }
})

# The learnr2 equivalent of tutorial.helpers::check_tutorial_defaults(): the
# student-information chunk at the top and the download button at the bottom.
test_that("tutorials have default components", {
  skip_if(length(tutorial_names()) == 0, "No tutorials yet")

  for (name in tutorial_names()) {
    dir <- system.file("tutorials", name, package = "ims.tutorials")
    qmd <- list.files(dir, pattern = "\\.qmd$", full.names = TRUE)[1]
    contents <- paste(readLines(qmd), collapse = "\n")
    expect_match(contents, "learnr2::student_info()", fixed = TRUE, label = name)
    expect_match(contents, "learnr2::download_answers_button(", fixed = TRUE, label = name)
  }
})
