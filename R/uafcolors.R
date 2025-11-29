#' University of Alaska Fairbanks color palette
#'
#' Use official UAF colors in graphs.
#'
#' @param x color name. Defaults to "all". Options: "blue", "gold", "green",
#'   "orange", "cyan", "magenta", "dark blue", "brown", "dark grey", "custard",
#'   "light blue", "light grey", "white"
#' @return A character vector of hex color codes
#' @examples
#' barplot(1:5, col = uafcolors())
#' hist(iris$Petal.Width, col = uafcolors("blue"))
#' plot(iris$Petal.Length, iris$Petal.Width, col = uafcolors("gold"), pch = 19)
#' @export
uafcolors <- function(x = "all") {
  switch(x,
         "all" = c("#236192", "#FFCD00", "#71984A", "#DF6A2E", "#87D1E6",
                   "#F45197", "#111C4E", "#774D28", "#66665D", "#F6DFA4",
                   "#C4CFDA", "#C8C8C8"),
         "blue" = "#236192",
         "gold" = "#FFCD00",
         "green" = "#71984A",
         "orange" = "#DF6A2E",
         "cyan" = "#87D1E6",
         "magenta" = "#F45197",
         "dark blue" = "#111C4E",
         "brown" = "#774D28",
         "dark grey" = "#66665D",
         "custard" = "#F6DFA4",
         "light blue" = "#C4CFDA",
         "light grey" = "#C8C8C8",
         "white" = "#FFFFFF")
}

#' UAF color scale for ggplot2
#'
#' @param ... Additional arguments passed to discrete_scale
#' @return A ggplot2 scale
#' @examples
#' library(ggplot2)
#' ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
#'   geom_point() + scale_color_uaf()
#' @export
scale_color_uaf <- function(...) {
  ggplot2::discrete_scale("colour", "uaf",
                          function(n) uafcolors()[1:n], ...)
}

#' UAF fill scale for ggplot2
#'
#' @param ... Additional arguments passed to discrete_scale
#' @return A ggplot2 scale
#' @examples
#' library(ggplot2)
#' ggplot(mpg, aes(class, fill = class)) +
#'   geom_bar() + scale_fill_uaf()
#' @export
scale_fill_uaf <- function(...) {
  ggplot2::discrete_scale("fill", "uaf",
                          function(n) uafcolors()[1:n], ...)
}

#' UAF theme for ggplot2
#'
#' @param base_size Base font size
#' @param base_family Base font family
#' @return A ggplot2 theme
#' @examples
#' library(ggplot2)
#' ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
#'   geom_point(color = uafcolors("blue")) + theme_uaf()
#' @export
theme_uaf <- function(base_size = 11, base_family = "") {
  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(color = "#236192", face = "bold"),
      axis.title = ggplot2::element_text(color = "#236192"),
      axis.text = ggplot2::element_text(color = "#66665D"),
      panel.grid.major = ggplot2::element_line(color = "#C8C8C8", linewidth = 0.3),
      panel.grid.minor = ggplot2::element_blank()
    )
}
