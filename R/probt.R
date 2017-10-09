#' p-value for t-test
#'
#' This function returns the p-value for a t-test.
#'
#' @useage probt(t, df)
#'
#' @param t t value calculated from the given test
#' @param df Degrees of freedom
#'
#' @example
#' probt(3.6308, dof = 72)
#'
#' @export
probt <- function(t, df) {
  2*stats::pt(-abs(t), df = df)
}
