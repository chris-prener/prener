#' @export
breaks <- function(.data, variable, classes, style){

breaks <- classInt::classIntervals(.data[[variable]], n = classes, style = style)
classes <- cut(.data[[variable]], breaks = c(breaks$brks), include.lowest = TRUE)

}
