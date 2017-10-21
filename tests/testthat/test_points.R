context("test returned values from points conversion")

a <- 2.77778
b <- cp_points(200, units = "in")

test_that("compare expected value to reported converted value", {
  expect_equal(a, b)
})

c <- 17.6389
d <- cp_points(500, units = "cm")

test_that("compare expected value to reported converted value", {
  expect_equal(c, d)
})

e <- 352.778
f <- cp_points(1000, units = "mm")

test_that("compare expected value to reported converted value", {
  expect_equal(e, f)
})
