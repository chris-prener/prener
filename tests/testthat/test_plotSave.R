context("plot save output")

library(ggplot2)

test_that("plotSave creates file", {
  path <- tempfile()
  on.exit(unlink(path))

  p <- ggplot(mpg, aes(hwy)) + geom_histogram()

  expect_false(file.exists(path))
  cp_plotSave(path, p, device = "png", preset = "sm")
  expect_true(file.exists(path))
})

test_that("plotSave creates file", {
  path <- tempfile()
  on.exit(unlink(path))

  p <- ggplot(mpg, aes(hwy)) + geom_histogram()

  expect_false(file.exists(path))
  cp_plotSave(path, p, device = "png", preset = "med", dpi = 100)
  expect_true(file.exists(path))
})

test_that("plotSave creates file", {
  path <- tempfile()
  on.exit(unlink(path))

  p <- ggplot(mpg, aes(hwy)) + geom_histogram()

  expect_false(file.exists(path))
  cp_plotSave(path, p, device = "png", preset = "lg", dpi = 500)
  expect_true(file.exists(path))
})
