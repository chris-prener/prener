#' p-value for t-test
#'
#' This function returns the p-value for a t-test.
#'
#' @usage cp_probt(t, df)
#'
#' @param t t value calculated from the given test
#' @param df Degrees of freedom
#'
#' @examples
#' cp_probt(3.6308, df = 72)
#'
#' @export
cp_probt <- function(t, df) {
  2*stats::pt(-abs(t), df = df)
}
