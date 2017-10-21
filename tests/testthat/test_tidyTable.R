context("test tidy table creation")

testData <- data.frame(
    id = c(1, 2, 3, 4, 5, 6),
    nhoodStr = c("Patch", "Bevo Mill", "Bevo Mill", "Lindenwood Park", "Carondelet" , "Shaw"),
    visit = c(TRUE, FALSE, FALSE, TRUE, TRUE, NA),
    type = as.factor(c("A", "B", "B", "A", "B", "B")),
    stringsAsFactors = FALSE
    )

compareData1 <- as_tibble(data.frame(
    data = c("Bevo Mill", "Carondelet", "Lindenwood Park", "Patch", "Shaw", "Total"),
    Count = c("2", "1", "1", "1", "1", "6"),
    Percentage = c("33.33", "16.67", "16.67", "16.67", "16.67", "100.00"),
    Cum. = c(),
    stringsAsFactors = FALSE
    ))
