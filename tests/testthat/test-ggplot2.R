layer_colors <- function(n, scale) {
  df <- data.frame(x = seq_len(n), y = seq_len(n), g = factor(seq_len(n)))
  p <- ggplot2::ggplot(df, ggplot2::aes(x, y, colour = g, fill = g)) +
    ggplot2::geom_point(shape = 21) +
    scale
  ggplot2::layer_data(p)
}

test_that("scales use the palette in order", {
  expect_equal(layer_colors(3, scale_color_canhr())$colour, canhrcolors()[1:3])
  expect_equal(layer_colors(3, scale_fill_canhr())$fill, canhrcolors()[1:3])
  expect_identical(scale_colour_canhr, scale_color_canhr)
})

test_that("the first argument is the legend title", {
  expect_equal(scale_color_canhr("Group")$name, "Group")
  expect_equal(scale_fill_canhr("Group")$name, "Group")
})

test_that("scales warn when the palette runs out", {
  n <- length(canhrcolors())
  expect_warning(
    ld <- layer_colors(n + 1, scale_color_canhr()),
    paste(n, "colors")
  )
  expect_equal(ld$colour[n], canhrcolors()[n])
  expect_equal(ld$colour[n + 1], "grey50")
})

test_that("theme_canhr() uses CANHR text colors", {
  theme <- theme_canhr()

  expect_s3_class(theme, "theme")
  expect_equal(ggplot2::calc_element("plot.title", theme)$colour, "#236192")
  expect_equal(ggplot2::calc_element("axis.text.x", theme)$colour, "#66665D")
})
