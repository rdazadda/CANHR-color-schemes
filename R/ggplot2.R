#' CANHR color scales for ggplot2
#'
#' Discrete color and fill scales that use the CANHR palette, in the order
#' given by [canhrcolors()].
#'
#' If a plot needs more colors than the palette has, a warning is given and
#' the extra levels are drawn in `na.value`.
#'
#' @param name The legend title. By default it is taken from the mapped
#'   variable; use `NULL` to remove it.
#' @param ... Other arguments passed on to [ggplot2::discrete_scale()], such
#'   as `labels`, `limits` or `guide`.
#' @param aesthetics The aesthetics this scale applies to.
#' @param na.value The color used for missing values and for any levels beyond
#'   the end of the palette.
#'
#' @return A ggplot2 scale.
#' @seealso [canhrcolors()], [theme_canhr()]
#' @export
#' @examples
#' library(ggplot2)
#'
#' ggplot(mpg, aes(displ, hwy, color = drv)) +
#'   geom_point(size = 2) +
#'   scale_color_canhr()
#'
#' ggplot(mpg, aes(class, fill = class)) +
#'   geom_bar(show.legend = FALSE) +
#'   scale_fill_canhr()
scale_color_canhr <- function(name = ggplot2::waiver(), ...,
                              aesthetics = "colour", na.value = "grey50") {
  ggplot2::discrete_scale(
    aesthetics,
    name = name,
    palette = canhr_pal,
    na.value = na.value,
    ...
  )
}

#' @rdname scale_color_canhr
#' @export
scale_colour_canhr <- scale_color_canhr

#' @rdname scale_color_canhr
#' @export
scale_fill_canhr <- function(name = ggplot2::waiver(), ...,
                             aesthetics = "fill", na.value = "grey50") {
  ggplot2::discrete_scale(
    aesthetics,
    name = name,
    palette = canhr_pal,
    na.value = na.value,
    ...
  )
}

canhr_pal <- function(n) {
  if (n > length(canhr_palette)) {
    warning(
      "The CANHR palette has ", length(canhr_palette), " colors but ", n,
      " are needed; the extra levels use `na.value`.",
      call. = FALSE
    )
  }
  unname(canhr_palette)[seq_len(min(n, length(canhr_palette)))]
}

#' CANHR theme for ggplot2
#'
#' A minimal theme with bold CANHR blue titles, dark grey text and light grey
#' grid lines. Use it with [scale_color_canhr()] or [scale_fill_canhr()].
#'
#' @param base_size Base font size, in points.
#' @param base_family Base font family.
#'
#' @return A ggplot2 theme.
#' @seealso [scale_color_canhr()], [canhrcolors()]
#' @export
#' @examples
#' library(ggplot2)
#'
#' ggplot(mpg, aes(displ, hwy)) +
#'   geom_point(color = canhrcolors("blue")) +
#'   labs(
#'     title = "Fuel economy",
#'     subtitle = "Highway miles per gallon by engine size"
#'   ) +
#'   theme_canhr()
theme_canhr <- function(base_size = 11, base_family = "") {
  blue <- canhr_palette[["blue"]]
  grey <- canhr_palette[["dark grey"]]

  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(color = blue, face = "bold"),
      plot.subtitle = ggplot2::element_text(color = grey),
      plot.caption = ggplot2::element_text(color = grey),
      axis.title = ggplot2::element_text(color = blue),
      axis.text = ggplot2::element_text(color = grey),
      panel.grid.major = ggplot2::element_line(
        color = canhr_palette[["light grey"]],
        linewidth = 0.3
      ),
      panel.grid.minor = ggplot2::element_blank()
    )
}
