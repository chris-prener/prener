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
#'
#' @export
cp_breaks <- function(.data, var, newvar, classes, style){

  breaks <- classInt::classIntervals(.data[[var]], n = classes, style = style)
  classes <- cut(.data[[var]], breaks = c(breaks$brks), include.lowest = TRUE)

  .data <- mutate(.data, newvar = classes)

  return(.data)

}
