#' Calculate Map Breaks
#'
#' This function wraps the process I have been using to construction data classes for
#' choropleth maps using \code{ggplot2}.
#'
#' @param .data A tbl or sf object
#' @param var The existing variable to create classes of
#' @param newvar The new variable for storing the factor data
#' @param classes The number of breaks or classes to create
#' @param style The method for calculating classes, see classInt::classIntervals
#'
#' @importFrom classInt classIntervals
#' @importFrom dplyr mutate
#' @importFrom rlang :=
#' @importFrom rlang enquo
#' @importFrom rlang quo
#' @importFrom rlang quo_name
#' @importFrom rlang sym
#'
#' @export
cp_breaks <- function(.data, var, newvar, classes, style){

  # save parameters to list
  paramList <- as.list(match.call())

  # quote input variables
  if (!is.character(paramList$var)) {
    ref <- rlang::enquo(var)
  } else if (is.character(paramList$var)) {
    ref <- rlang::quo(!! rlang::sym(var))
  }

  refQ <- rlang::quo_name(rlang::enquo(ref))

  if (!is.character(paramList$newvar)) {
    new <- rlang::enquo(newvar)
  } else if (is.character(paramList$newvar)) {
    new <- rlang::quo(!! rlang::sym(newvar))
  }

  newQ <- rlang::quo_name(rlang::enquo(new))

  # calculate breaks and categories
  breaks <- classInt::classIntervals(.data[[refQ]], n = classes, style = style)
  categories <- cut(.data[[refQ]], breaks = c(breaks$brks), include.lowest = TRUE)

  # create new variable
  .data <- dplyr::mutate(.data, !!newQ := categories)

  # return result
  return(.data)

}
