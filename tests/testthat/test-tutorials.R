# Each test skips rather than fails if, for some reason, no tutorials are
# installed (for example, an incomplete build).

# Discover tutorials from the path the test context sees. Under
# pkgload::load_all() (devtools::test()), learnr2's own system.file() calls
# resolve the package to its source root and miss the inst/ prefix, so
# learnr2::available_tutorials() reports nothing even though the tutorials are
# right there. R CMD check runs against the installed package, where both
# views agree.
tutorial_root <- function() {
  root <- system.file("tutorials", package = "ims.tutorials")
  if (nzchar(root) && dir.exists(root)) root else ""
}

tutorial_names <- function() {
  root <- tutorial_root()
  if (!nzchar(root)) return(character())
  basename(list.dirs(root, recursive = FALSE, full.names = TRUE))
}

tutorial_qmd <- function(name) {
  file.path(tutorial_root(), name, paste0(name, ".qmd"))
}

test_that("every tutorial directory holds its own .qmd", {
  skip_if(length(tutorial_names()) == 0, "No tutorials yet")

  for (name in tutorial_names()) {
    expect_true(file.exists(tutorial_qmd(name)), label = name)
    contents <- paste(readLines(tutorial_qmd(name), warn = FALSE), collapse = "\n")
    expect_match(contents, "format: live-html", fixed = TRUE, label = name)
    expect_match(
      contents,
      paste0('filename_prefix = "', name, '"'),
      fixed = TRUE,
      label = name
    )
  }
})

test_that("learnr2 lists every tutorial as quarto", {
  tutorials <- learnr2::available_tutorials(package = "ims.tutorials")
  skip_if(nrow(tutorials) == 0, "No tutorials yet")
  expect_true(all(tutorials$format == "quarto"))
})

test_that("tutorials can be rendered", {
  testthat::skip_on_cran() # Rendering needs the Quarto CLI.
  skip_if(length(tutorial_names()) == 0, "No tutorials yet")
  skip_if(
    nrow(learnr2::available_tutorials(package = "ims.tutorials")) == 0,
    "learnr2 cannot resolve tutorial paths under load_all(); R CMD check covers this"
  )

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
    contents <- paste(readLines(tutorial_qmd(name), warn = FALSE), collapse = "\n")
    expect_match(contents, "learnr2::student_info()", fixed = TRUE, label = name)
    expect_match(contents, "learnr2::download_answers_button(", fixed = TRUE, label = name)
  }
})
