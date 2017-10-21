#' Tidy Frequency Tables
#'
#' \code{cp_tidyTable} returns a frequency table with counts and percentages of values
#'   from a character, integer, double, or logical atomic vector
#'
#' @usage cp_tidyTable(dataVector, sortByCount = FALSE, round = 1, missRow = TRUE, totalRow = TRUE)
#'
#' @param dataVector Character, integer, double, or logical atomic vector
#' @param sortByCount Logical scalar that determines if output will be sorted by count or name
#' @param round Number of decimal places displayed
#' @param missRow Logical scalar that determines if the NA row is displayed
#' @param totalRow Logical scalar that determines if the output will have a summary row appended
#'
#' @return a tibble containing the counts and percentages of each value from the provided data
#'
#' @source \href{https://cran.r-project.org/web/packages/frequencies/index.html}{\code{frequencies} package} (\href{https://cran.r-project.org/web/licenses/GPL-3}{source code released under GPL-3 license})
#'
#' @importFrom dplyr "%>%"
#'
#' @examples
#' tableData <- data.frame(
#'    id = c(1, 2, 3, 4, 5, 6),
#'    nhoodStr = c("Patch", "Bevo Mill", "Bevo Mill", "Lindenwood Park", "Carondelet" , "Shaw"),
#'    visit = c(TRUE, FALSE, FALSE, TRUE, TRUE, NA),
#'    type = as.factor(c("A", "B", "B", "A", "B", "B")),
#'    stringsAsFactors = FALSE
#'    )
#'
#' cp_tidyTable(tableData$nhoodStr)
#' cp_tidyTable(tableData$nhoodStr, round = 2)
#' cp_tidyTable(tableData$visit, round = 2, missRow = TRUE)
#' cp_tidyTable(tableData$visit, round = 2, missRow = FALSE)
#' cp_tidyTable(tableData$type, round = 3, sortByCount = FALSE)
#' cp_tidyTable(tableData$type, round = 3, sortByCount = TRUE)
#'
#' @export

cp_tidyTable <- function(dataVector, sortByCount = FALSE, round = 1, missRow = TRUE, totalRow = TRUE) {

  # To prevent NOTE from R CMD check 'no visible binding for global variable'
  dataFrame = data = n = total = Percentage = Cum. = Count = NULL

  # Check validity of dataVector argument. The argument needs to be a string and the data frame needs to exist.
  if (!is.atomic(dataFrame)) return(stop('freq_vect requires an atomic vector.'))

  if (!(typeof(dataVector) %in% c('logical', 'integer', 'double','character'))) {
    return(stop('Vector not of acceptable data type. Needs to be of type logical, integer, double, or character.'))
  }

  if (length(dataVector) < 2) return(stop('Vector needs a length greater than 1.'))


  # Check if sortByCount is set
  if (!is.logical(sortByCount)) sortByCount <- TRUE
  sort_by <- ifelse(sortByCount, 'desc(n)', 'data')

  # Create data frame
  df <- data.frame(data = dataVector, stringsAsFactors = FALSE)
  result <- dplyr::count(df, data)

  # Check if missRow is set
  if (!is.logical(missRow)) missRow <- TRUE
  if (missRow == FALSE) {
    result <- dplyr::filter(result, data != "<NA>")
  }

  # Create table
  result <- result %>%
    dplyr::mutate(total = sum(n)) %>%
    dplyr::group_by(data) %>%
    dplyr::mutate(Percentage = formatC(n * 100 / total, digits = round, format = "f")) %>%
    dplyr::ungroup() %>%
    dplyr::arrange_(sort_by) %>%
    dplyr::mutate(Cum. = cumsum(Percentage)) %>%
    dplyr::mutate(Cum. = ifelse(Cum. > 100, round(Cum., 0), Cum.)) %>%
    dplyr::mutate(Cum. = formatC(Cum., digits = round, format = "f")) %>%
    dplyr::select(data,
                  Count = n,
                  Percentage,
                  Cum.)

  # Create total row
  if (!is.logical(totalRow)) totalRow <- TRUE
  if (totalRow) {
    x <- formatC(100, digits = round, format = "f")
    result[,1] <- lapply(result[,1], as.character)
    result <- rbind.data.frame(result,c('Total', sum(result$Count), x, ""))
  }

  result <- result %>%
    dplyr::mutate(data = as.character(data)) %>%
    dplyr::mutate(Count = as.character(Count))

  return(result)
}
