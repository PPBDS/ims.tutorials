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

# CLAUDE.md requires each tutorial's .qmd file name and its download-answers
# filename_prefix to equal the directory name.
test_that("each tutorial's file name and download prefix match its directory", {
  tutorials <- learnr2::available_tutorials(package = "ims.tutorials")
  skip_if(nrow(tutorials) == 0, "No tutorials yet")

  for (i in seq_len(nrow(tutorials))) {
    name <- tutorials$name[i]
    expect_equal(basename(tutorials$path[i]), paste0(name, ".qmd"), label = name)
    contents <- paste(readLines(tutorials$path[i], warn = FALSE), collapse = "\n")
    expect_match(contents, paste0('filename_prefix = "', name, '"'),
                 fixed = TRUE, label = name)
  }
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

# R CMD check gives a NOTE for any package path over 100 bytes, the limit for
# portable tarballs. Long tutorial slugs plus long figure names reach it easily
# (see CLAUDE.md, "One tutorial per chapter" and "Use the book's figures").
test_that("every tutorial file has a portable path", {
  root <- system.file("tutorials", package = "ims.tutorials")
  skip_if(!nzchar(root), "No tutorials installed")
  files <- list.files(root, recursive = TRUE)
  paths <- file.path("ims.tutorials", "inst", "tutorials", files)
  long <- paths[nchar(paths, type = "bytes") > 100]
  expect_equal(long, character(0))
})

tutorial_lines <- function(name) {
  dir <- system.file("tutorials", name, package = "ims.tutorials")
  qmd <- list.files(dir, pattern = "\\.qmd$", full.names = TRUE)[1]
  readLines(qmd, warn = FALSE)
}

# Quarto renders a missing image as a broken link without failing, so check
# here that every image a tutorial references exists and that every file in
# its images/ directory is used.
test_that("tutorial images exist and are used", {
  skip_if(length(tutorial_names()) == 0, "No tutorials yet")

  for (name in tutorial_names()) {
    dir <- system.file("tutorials", name, package = "ims.tutorials")
    lines <- tutorial_lines(name)
    refs <- unlist(regmatches(lines, gregexpr("images/[^)\"' ]+", lines)))
    files <- list.files(file.path(dir, "images"))

    for (ref in refs) {
      expect_true(file.exists(file.path(dir, ref)), label = paste(name, ref))
    }
    for (file in files) {
      expect_true(paste0("images/", file) %in% refs,
                  label = paste(name, file, "is used"))
    }
  }
})

# Rules from CLAUDE.md that a tutorial could quietly drift away from: every
# tutorial credits the book's license for the sentences and figures it copies
# ("Use the book's own words"), shows the chapter's summary as plain prose
# rather than a block quote, never caches ("Override: no caching"), and has
# exactly one help-page exercise in Chapters 1 to 3 and none after
# ("Override: help-page exercises are rare").
test_that("tutorials follow the book-text, caching, and help-page rules", {
  skip_if(length(tutorial_names()) == 0, "No tutorials yet")

  for (name in tutorial_names()) {
    lines <- tutorial_lines(name)
    chapter <- as.integer(sub(".*ordering:\\s*", "",
                              grep("^\\s+ordering:", lines, value = TRUE)[1]))

    expect_true(any(grepl("CC BY-SA 3.0 license", lines, fixed = TRUE)),
                label = paste(name, "acknowledges the book's license"))
    expect_false(any(grepl("in the authors' words", lines, fixed = TRUE)),
                 label = paste(name, "has no block-quoted chapter summary"))
    expect_false(any(grepl("cache: true|analysis_cache", lines)),
                 label = paste(name, "does no caching"))
    expect_equal(sum(grepl("run \\?[A-Za-z]", lines)),
                 if (chapter <= 3) 1 else 0,
                 label = paste(name, "help-page exercises"))
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
