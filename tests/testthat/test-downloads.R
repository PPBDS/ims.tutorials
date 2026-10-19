# Files students download from GitHub live in inst/extdata/, never under a
# tutorial directory, so renaming a tutorial cannot break the URL (see
# CLAUDE.md, "Renaming tutorials"). Each tutorial that uses one keeps an
# identical copy in its own data/ directory for its answer chunks to read.
# These tests cover every file in inst/extdata/ automatically: the URL a
# tutorial gives students serves the raw file, every tutorial copy matches the
# download, and every download is used by some tutorial.
#
# GitHub rate-limits anonymous requests from CI runners, so retry 429s and, if
# still throttled, skip: a rate limit is not evidence the URL is broken. A 404
# while the file exists locally means it has not been pushed to main yet, so
# skip rather than fail.

extdata_files <- function() {
  dir <- system.file("extdata", package = "ims.tutorials")
  if (!nzchar(dir)) return(character())
  list.files(dir, full.names = TRUE)
}

tutorial_copies <- function(file) {
  root <- system.file("tutorials", package = "ims.tutorials")
  copies <- file.path(list.dirs(root, recursive = FALSE), "data", basename(file))
  copies[file.exists(copies)]
}

check_url_is_plain_text <- function(url, local_path) {
  resp <- tryCatch(
    httr2::request(url) |>
      httr2::req_retry(max_tries = 3, max_seconds = 30) |>
      httr2::req_perform(),
    httr2_http_429 = function(cnd) {
      testthat::skip(paste("Rate limited (HTTP 429) fetching", url))
    },
    httr2_http_404 = function(cnd) {
      if (file.exists(local_path)) {
        testthat::skip(paste("404 but file exists locally, not yet pushed to main:", url))
      }
      stop(cnd)
    }
  )
  expect_equal(httr2::resp_status(resp), 200, label = basename(local_path))
  expect_match(httr2::resp_content_type(resp), "text/plain", label = basename(local_path))
}

test_that("every download in inst/extdata has an identical copy in a tutorial", {
  files <- extdata_files()
  skip_if(length(files) == 0, "No downloadable files")
  for (file in files) {
    copies <- tutorial_copies(file)
    expect_true(length(copies) > 0, label = paste(basename(file), "is used by a tutorial"))
    for (copy in copies) {
      expect_identical(unname(tools::md5sum(copy)), unname(tools::md5sum(file)),
                       label = copy)
    }
  }
})

test_that("every download in inst/extdata is reachable on GitHub", {
  testthat::skip_on_cran()
  testthat::skip_if_offline()
  testthat::skip_if_not_installed("httr2")
  files <- extdata_files()
  skip_if(length(files) == 0, "No downloadable files")
  for (file in files) {
    check_url_is_plain_text(
      paste0("https://raw.githubusercontent.com/PPBDS/ims.tutorials/main/inst/extdata/",
             basename(file)),
      local_path = file
    )
  }
})
