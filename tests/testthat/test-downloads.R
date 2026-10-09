# Files students download from GitHub live in inst/extdata/, never under a
# numbered tutorial directory, so renumbering a tutorial cannot break the URL
# (see CLAUDE.md, "Renumbering tutorials"). Each such file has two tests: the
# URL a tutorial gives students is reachable and serves the raw file, and the
# copy a tutorial's answer chunks read (in that tutorial's data/ directory) is
# identical to the downloadable one.
#
# GitHub rate-limits anonymous requests from CI runners, so retry 429s and, if
# still throttled, skip: a rate limit is not evidence the URL is broken. A 404
# while the file exists locally means it has not been pushed to main yet, so
# skip rather than fail; a URL with no local counterpart (a typo) still fails.
check_url_is_plain_text <- function(url, local_path = NULL) {
  resp <- tryCatch(
    httr2::request(url) |>
      httr2::req_retry(max_tries = 3, max_seconds = 30) |>
      httr2::req_perform(),
    httr2_http_429 = function(cnd) {
      testthat::skip(paste("Rate limited (HTTP 429) fetching", url))
    },
    httr2_http_404 = function(cnd) {
      if (!is.null(local_path) && nzchar(local_path) && file.exists(local_path)) {
        testthat::skip(paste("404 but file exists locally, not yet pushed to main:", url))
      }
      stop(cnd)
    }
  )
  expect_equal(httr2::resp_status(resp), 200)
  expect_match(httr2::resp_content_type(resp), "text/plain")
}

test_that("applications-explore: brexit.csv is downloadable", {
  testthat::skip_on_cran()
  testthat::skip_if_offline()
  testthat::skip_if_not_installed("httr2")
  check_url_is_plain_text(
    "https://raw.githubusercontent.com/PPBDS/ims.tutorials/main/inst/extdata/brexit.csv",
    local_path = system.file("extdata", "brexit.csv", package = "ims.tutorials")
  )
})

test_that("applications-explore: the tutorial's brexit.csv matches the download", {
  download <- system.file("extdata", "brexit.csv", package = "ims.tutorials")
  tutorial <- system.file("tutorials", "applications-explore", "data", "brexit.csv",
                          package = "ims.tutorials")
  expect_true(nzchar(download))
  expect_true(nzchar(tutorial))
  expect_identical(
    unname(tools::md5sum(download)),
    unname(tools::md5sum(tutorial))
  )
})
