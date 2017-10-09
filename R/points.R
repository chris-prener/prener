#' Points Conversion
#'
#' This function converts points to other units of measurement for use with \code{ggsave()}.
#'
#' @usage points(x, units = c("in", "cm", "mm"))
#'
#' @param x Value in points to be converted
#' @param units Size in units ("in", "cm", or "mm")
#'
#' @examples
#' points(940, units = "mm")
#'
#' @export
points <- function(x, units = c("in", "cm", "mm")) {
  if (units == "in"){
    x * 0.0138889
  } else if (units == "cm") {
    x * 0.0352778
  } else if (units == "mm") {
    x * 0.352778
  }
}


