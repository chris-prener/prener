context("test p-values from t")

a <- 0.000525499202424463060512
b <- cp_probt(3.6308, df = 72)

test_that("compare expected value to reported p-value", {
  expect_equal(a, b)
})

c <- 0.0004792400683522154069757
d <- cp_probt(3.6308, df = 86)

test_that("compare expected value to reported p-value", {
  expect_equal(c, d)
})

e <- 0.05949969240733903041995
f <- cp_probt(-1.895, df = 205)

test_that("compare expected value to reported p-value", {
  expect_equal(e, f)
})

g <- 0.0485415514003531139986
h <- cp_probt(-1.98, df = 327)

test_that("compare expected value to reported p-value", {
  expect_equal(g, h)
})

i <- 3.939575949866906867564e-12
j <- cp_probt(7.24, df = 294)

test_that("compare expected value to reported p-value", {
  expect_equal(i, j)
})

k <- 0.810612762825153487789
l <- cp_probt(0.24, df = 174)

test_that("compare expected value to reported p-value", {
  expect_equal(k, l)
})
