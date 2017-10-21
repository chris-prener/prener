#' Saving Plots at Prespecified Size and Resolution
#'
#' This function is a wrapper around \code{ggsave()} that uses pre-specified values which
#' correspond to the possible graphics sizes in my lecture and presentation slides.
#'
#' @usage cp_plotSave(filename, plot, preset = c("sm", "med", "lg"))
#'
#' @param filename File name to create on disk; must be quoted
#' @param plot Plot to save, defaults to last plot displayed if no plot included
#' @param preset Preset size ("sm", "med", "lg")
#'
#' @return Saves a file to the disk in the pre-determined size. \code{preset = "sm"}
#'
#' @examples
#' \dontrun{
#' p <- ggplot(mpg, aes(hwy)) + geom_histogram()
#'
#' cp_plotSave("hwy.png", preset = "sm")
#' cp_plotSave("hwy.png", p, preset = "med")
#' cp_plotSave("hwy.png", p, preset = "lg")
#' }
#'
#' @importFrom ggplot2 last_plot
#' @importFrom ggplot2 ggsave
#'
#' @export
cp_plotSave <- function(filename, plot, preset = c("sm", "med", "lg")){
  if (missing(plot)) {
    plotDef <- last_plot()
  } else {
    plotDef <- plot
  }

  if (missing(preset)){
    preset <- "sm"
  }

  if (preset == "sm"){
    ggsave(filename, plotDef,
           width = cp_points(960, units = "mm"),
           height = cp_points(540, units = "mm"),
           units = "mm", dpi = 300)
  } else if (preset == "med"){
    ggsave(filename, plotDef,
           width = cp_points(960, units = "mm"),
           height = cp_points(630, units = "mm"),
           units = "mm", dpi = 300)
  } else if (preset == "lg"){
    ggsave(filename, plotDef,
           width = cp_points(1024, units = "mm"),
           height = cp_points(768, units = "mm"),
           units = "mm", dpi = 300)
  }
}
