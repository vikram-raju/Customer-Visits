library(testthat)

classification.error <- function(conf.mat) {
  conf.mat <- as.matrix(conf.mat)
  error <- 1 - sum(diag(conf.mat)) / sum(conf.mat)
  return(error)
}

# identity confusion matrix should have 0 error

test_that("identity confusion matrix returns 0 error", {
  cm <- diag(3)
  expect_equal(classification.error(cm), 0)
})

# simple off-diagonal matrix error

test_that("off-diagonal matrix returns expected error", {
  cm <- matrix(c(0,1,1,0), nrow = 2, byrow = TRUE)
  expected_error <- 1 - sum(diag(cm)) / sum(cm)
  expect_equal(classification.error(cm), expected_error)
})
