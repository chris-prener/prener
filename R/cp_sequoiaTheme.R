#' ggplot2 Theme for Sequoia Keynote Template
#'
#' @description The \code{cp_sequoiaTheme} is built on top of the \code{ggthemes}
#' package. It makes specific design changes to the \code{theme_fivethirtyeight} so
#' that the theme blends in seemlessly with the Alt slides in my Sequoia template
#' for Apple's Keynote. Among the changes completed are matching backgrounds, an
#' altered legend position and direction, a much larger default font size.
#'
#' @usage cp_sequoiaTheme(base_size = 28, base_family = "sans", map = FALSE)
#'
#' @param base_size Base font size
#' @param base_family Base font family
#' @param map A logical scalar. Is the plot a map?
#'
#' @source \href{https://cran.r-project.org/web/packages/ggthemes/index.html}{\code{ggthemes} package} (\href{https://cran.r-project.org/web/licenses/GPL-2}{source code released under GPL-2 license})
#'
#' @importFrom ggthemes theme_foundation
#'
#' @examples
#' library("ggplot2")
#' p1 <- ggplot(data = mpg) +
#'       geom_point(mapping = aes(x = hwy, y = displ, color = as.factor(cyl))) +
#'       cp_sequoiaTheme(map = FALSE)
#'
#' p2 <- ggplot(data = mpg) +
#'       geom_point(mapping = aes(x = hwy, y = displ, color = as.factor(cyl)),
#'       size = 4, position = "jitter") +
#'       scale_x_continuous(limits = c(10, 50)) +
#'       cp_sequoiaTheme(map = FALSE) +
#'       labs(color = "Cylinder", x = "Highway Fuel Efficency", y = "Engine Displacement")
#'
#' @export
cp_sequoiaTheme <-function(base_size = 28, base_family = "sans", map = FALSE) {

  # R CMD check error
  element_blank = element_line = element_rect = element_text = rel = theme = unit = NULL

  if (map == FALSE) {
    (ggthemes::theme_foundation(base_size = base_size, base_family = base_family)
     + theme(
       line = element_line(colour = "black"),
       rect = element_rect(fill = '#F0F0F0', linetype = 0, colour = NA),
       text = element_text(colour = '#3C3C3C'),
       axis.title = element_text(),
       axis.text = element_text(),
       axis.ticks = element_blank(),
       axis.line = element_blank(),
       legend.background = element_rect(fill = '#EBEBEB'),
       legend.key = element_rect(fill = '#EBEBEB'),
       legend.key.size = unit(1.5, units="cm"),
       legend.position = "right",
       legend.direction = "vertical",
       legend.box = "vertical",
       panel.grid = element_line(colour = NULL),
       panel.grid.major =
         element_line(colour = '#D2D2D2'),
       panel.grid.minor = element_blank(),
       panel.background = element_rect(fill = '#EBEBEB'),
       plot.background = element_rect(fill = '#EBEBEB'),
       plot.title = element_text(hjust = 0, size = rel(1.5), face = "bold"),
       plot.margin = unit(c(1, 1, 1, 1), "lines"),
       strip.background = element_rect()))
  }
  else if (map == TRUE){
    (ggthemes::theme_foundation(base_size = base_size, base_family = base_family)
     + theme(
       line = element_line(colour = "black"),
       rect = element_rect(fill = '#EBEBEB', linetype = 0, colour = NA),
       text = element_text(colour = '#3C3C3C'),
       axis.title = element_blank(),
       axis.text = element_blank(),
       axis.ticks = element_blank(),
       axis.line = element_blank(),
       legend.background = element_rect(fill = '#EBEBEB'),
       legend.key = element_rect(fill = '#EBEBEB'),
       legend.key.size = unit(1.55, units="cm"),
       legend.position = "right",
       legend.direction = "vertical",
       legend.box = "vertical",
       panel.grid = element_line(colour = NULL),
       panel.grid.major = element_line(color = '#EBEBEB'),
       panel.grid.minor = element_blank(),
       panel.background = element_rect(fill = '#EBEBEB'),
       plot.background = element_rect(fill = '#EBEBEB'),
       plot.title = element_text(hjust = 0, size = rel(1.5), face = "bold"),
       plot.margin = unit(c(1, 1, 1, 1), "lines"),
       strip.background = element_rect()))
  }
}
