#' Multiple Choice Exam Key Creation
#'
#' @description \code{cp_examHelper} creates an answer key for multiple choice
#'     exams that offer four possible answers in the form of the letters
#'     a, b, c, and d.
#'
#' @param n number of questions in the exam
#'
#' @return A data frame containing the question numbers and correct answers
#'
#' @importFrom dplyr %>%
#' @importFrom dplyr case_when
#' @importFrom dplyr mutate
#'
#' @examples
#' key <- cp_examHelper(n = 40)
#' table(key$correct)
#'
#' @export
cp_examHelper <- function(n){

  correct = NULL

  key <- data.frame(
    question = c(1:n),
    correct = sample.int(4, n, replace = TRUE)
  )

  key %>%
    mutate(correct = as.character(correct)) %>%
    mutate(correct = case_when(
      correct == "1" ~ "a",
      correct == "2" ~ "b",
      correct == "3" ~ "c",
      correct == "4" ~ "d"
    )) -> key

  return(key)

}
