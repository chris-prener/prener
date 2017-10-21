#' LaTeX Formatted Frequency Tables
#'
#' \code{cp_texTable} returns a LaTeX formatted frequency table with counts and percentages of values
#'   from a character, integer, double, or logical atomic vector
#'
#' @usage cp_texTable(dataFrame, variable, title = "", type = c("doc", "table", "row"),
#'     sortByCount = FALSE, round = 2, missRow = TRUE, totalRow = TRUE)
#'
#' @param dataFrame Tibble or data frame object
#' @param variable Character, integer, double, or logical atomic vector
#' @param title Character string with the table's title
#' @param type Type of output - either full LaTex document ("doc"), table only ("table"), or rows only ("row")
#' @param sortByCount Logical scalar that determines if output will be sorted by count or name
#' @param round Number of decimal places displayed
#' @param missRow Logical scalar that determines if the NA row is displayed
#' @param totalRow Logical scalar that determines if the output will have a summary row appended
#'
#' @return a LaTeX formatted text block containing the counts and percentages of each value from the provided data
#'
#'
#' @export
cp_texTable <- function(dataFrame, variable, title = "", type = c("doc", "table", "row"), sortByCount = FALSE, round = 2, missRow = TRUE, totalRow = TRUE) {
  a <- tableFx(dataFrame = dataFrame, variable = variable, sortByCount = sortByCount, round = round, missRow = missRow, totalRow = totalRow)

  if (type == "doc") {
    docOut(a, title = title)
  } else if (type == "table") {
    tableOut(a, title = title)
  } else if (type == "row") {
    rowOut(a)
  }
}

# create tidy table and add latex commands
tableFx <- function(dataFrame = dataFrame, variable = variable, title = title, sortByCount = sortByCount, round = round, missRow = missRow, totalRow = totalRow){

  # To prevent NOTE from R CMD check 'no visible binding for global variable'
  var = data = Count = Percentage = Cum. = NULL

  table <- cp_tidyTable( dataFrame[[ variable ]] , sortByCount = sortByCount, round = round, missRow = missRow, totalRow = totalRow)
  table$var <- "\\hhline{~~~~~}"
  table$var[1] <- paste("\\multirow{", nrow(table), "}{foo}{", variable,"}")
  table$var[1] <- gsub("foo", "*", table$var[1])
  table$var <- gsub("\"", "", table$var)
  table <- dplyr::select(table, Variable = var, Values = data, Count, Percentage, Cum.)

}

# rows only output
rowOut <- function(object){
  x <- object
  y <- nrow(object)

  cat("\\hline \\\\[-1.8ex] ")
  cat("\n")
  for (row in 1:y) {
    cat(x$Variable[row], " & ", x$Values[row], " & ", x$Count[row], " & ", x$Percentage[row], " & ", x$Cum.[row], " \\\\")
    cat("\n")
  }
  cat("\\hline \\\\[-1.8ex] ")
  cat("\n")
}

# table only output
tableOut <- function(object, title = title){
  x <- object
  y <- nrow(object)
  z <- paste("\\caption{", title, "}")

  cat("\\begin{table}[!htbp] \\centering")
  cat("\n")
  cat(z)
  cat("\n")
  cat("\\label{}")
  cat("\n")
  cat("\\begin{tabular}{@{\\extracolsep{5pt}} llrrr} ")
  cat("\n")
  cat("\\\\[-1.8ex]\\hline ")
  cat("\n")
  cat("\\hline \\\\[-1.8ex] ")
  cat("\n")
  cat("\\multicolumn{1}{c}{Variable} & \\multicolumn{1}{c}{Values} & \\multicolumn{1}{c}{Count} & \\multicolumn{1}{c}{\\%} & \\multicolumn{1}{c}{Cum. \\%} \\\\")
  cat("\n")
  cat("\\hline \\\\[-1.8ex] ")
  cat("\n")
  for (row in 1:y) {
    cat(x$Variable[row], " & ", x$Values[row], " & ", x$Count[row], " & ", x$Percentage[row], " & ", x$Cum.[row], " \\\\")
    cat("\n")
  }
  cat("\\hline \\\\[-1.8ex] ")
  cat("\n")
  cat("\\end{tabular}")
  cat("\n")
  cat("\\end{table}")
  cat("\n")
}

# full document output
docOut <- function(object, title = title){
  x <- object
  y <- nrow(object)
  z <- paste("\\caption{", title, "}")

  cat("\\documentclass{article}")
  cat("\n")
  cat("\n")
  cat("\\usepackage{multirow}")
  cat("\n")
  cat("\\usepackage{hhline}")
  cat("\n")
  cat("\n")
  cat("\n")
  cat("\\begin{document}")
  cat("\n")
  cat("\n")
  cat("\\begin{table}[!htbp] \\centering")
  cat("\n")
  cat(z)
  cat("\n")
  cat("\\label{}")
  cat("\n")
  cat("\\begin{tabular}{@{\\extracolsep{5pt}} llrrr} ")
  cat("\n")
  cat("\\\\[-1.8ex]\\hline ")
  cat("\n")
  cat("\\hline \\\\[-1.8ex] ")
  cat("\n")
  cat("\\multicolumn{1}{c}{Variable} & \\multicolumn{1}{c}{Values} & \\multicolumn{1}{c}{Count} & \\multicolumn{1}{c}{\\%} & \\multicolumn{1}{c}{Cum. \\%} \\\\")
  cat("\n")
  cat("\\hline \\\\[-1.8ex] ")
  cat("\n")
  for (row in 1:y) {
    cat(x$Variable[row], " & ", x$Values[row], " & ", x$Count[row], " & ", x$Percentage[row], " & ", x$Cum.[row], " \\\\")
    cat("\n")
  }
  cat("\\hline \\\\[-1.8ex] ")
  cat("\n")
  cat("\\end{tabular}")
  cat("\n")
  cat("\\end{table}")
  cat("\n")
  cat("\n")
  cat("\n")
  cat("\\end{document}")
}
