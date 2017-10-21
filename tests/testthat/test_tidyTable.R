context("test tidy table creation")

library(tibble)

# test data -----------------------------------------------

testData <- data.frame(
    id = c(1, 2, 3, 4, 5, 6),
    nhoodStr = c("Patch", "Bevo Mill", "Bevo Mill", "Lindenwood Park", "Carondelet" , "Shaw"),
    visit = c(TRUE, FALSE, FALSE, TRUE, TRUE, NA),
    type = as.factor(c("A", "B", "B", "A", "B", "B")),
    stringsAsFactors = FALSE
    )

# baseline test with nhoodStr -----------------------------------------------

a <- cp_tidyTable(testData$nhoodStr, sortByCount = FALSE, round = 2, missRow = TRUE, totalRow = TRUE)

b <- as_tibble(data.frame(
    data = c("Bevo Mill", "Carondelet", "Lindenwood Park", "Patch", "Shaw", "Total"),
    Count = c("2", "1", "1", "1", "1", "6"),
    Percentage = c("33.33", "16.67", "16.67", "16.67", "16.67", "100.00"),
    Cum. = c("33.33", "50.00", "66.67", "83.34", "100.00", ""),
    stringsAsFactors = FALSE
    ))

test_that("compare expected tibble with returned tibble", {
  expect_equal(a, b)
})

# test with sorByCount = TRUE -----------------------------------------------

c <- cp_tidyTable(testData$nhoodStr, sortByCount = TRUE, round = 2, missRow = TRUE, totalRow = TRUE)

test_that("compare expected tibble with returned tibble", {
  expect_equal(c, b)
})

# test with round = 3 -----------------------------------------------

d <- cp_tidyTable(testData$nhoodStr, sortByCount = FALSE, round = 3, missRow = TRUE, totalRow = TRUE)

e <- as_tibble(data.frame(
    data = c("Bevo Mill", "Carondelet", "Lindenwood Park", "Patch", "Shaw", "Total"),
    Count = c("2", "1", "1", "1", "1", "6"),
    Percentage = c("33.333", "16.667", "16.667", "16.667", "16.667", "100.000"),
    Cum. = c("33.333", "50.000", "66.667", "83.334", "100.000", ""),
    stringsAsFactors = FALSE
    ))

test_that("compare expected tibble with returned tibble", {
  expect_equal(d, e)
})

# baseline test with visit -----------------------------------------------

f <- cp_tidyTable(testData$visit, sortByCount = FALSE, round = 2, missRow = TRUE, totalRow = TRUE)

g <- as_tibble(data.frame(
    data = c("FALSE", "TRUE", NA, "Total"),
    Count = c("2", "3", "1", "6"),
    Percentage = c("33.33", "50.00", "16.67","100.00"),
    Cum. = c("33.33", "83.33", "100.00", ""),
    stringsAsFactors = FALSE
    ))

test_that("compare expected tibble with returned tibble", {
  expect_equal(f, g)
})

# test with missRow = FALSE -----------------------------------------------

h <- cp_tidyTable(testData$visit, sortByCount = FALSE, round = 2, missRow = FALSE, totalRow = TRUE)

i <- as_tibble(data.frame(
    data = c("FALSE", "TRUE", "Total"),
    Count = c("2", "3", "5"),
    Percentage = c("40.00", "60.00", "100.00"),
    Cum. = c("40.00", "100.00", ""),
    stringsAsFactors = FALSE
    ))

test_that("compare expected tibble with returned tibble", {
  expect_equal(h, i)
})

# baseline test with type -----------------------------------------------

j <- cp_tidyTable(testData$type, sortByCount = FALSE, round = 2, missRow = TRUE, totalRow = TRUE)

k <- as_tibble(data.frame(
    data = c("A", "B", "Total"),
    Count = c("2", "4", "6"),
    Percentage = c("33.33", "66.67", "100.00"),
    Cum. = c("33.33", "100.00", ""),
    stringsAsFactors = FALSE
    ))

test_that("compare expected tibble with returned tibble", {
  expect_equal(j, k)
})

# test with totalRow = FALSE -----------------------------------------------

l <- cp_tidyTable(testData$type, sortByCount = FALSE, round = 2, missRow = TRUE, totalRow = FALSE)

m <- as_tibble(data.frame(
    data = c("A", "B"),
    Count = c("2", "4"),
    Percentage = c("33.33", "66.67"),
    Cum. = c("33.33", "100.00"),
    stringsAsFactors = FALSE
    ))

test_that("compare expected tibble with returned tibble", {
  expect_equal(l, m)
})


