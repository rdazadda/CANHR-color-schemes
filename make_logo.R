# Recreates the logo, the favicons and the README color chart from the palette
# in R/canhrcolors.R, so they all follow when colors are added. Run it from the
# repository root:
#
#     Rscript make_logo.R
#
# It needs the rsvg and magick packages.

source("R/canhrcolors.R")

colors <- canhrcolors()
labels <- tools::toTitleCase(names(canhr_palette))
n <- length(colors)

# The strip: one vertical bar per color inside a rectangle with rounded
# corners. Each bar runs slightly under the next one so no seams show.
strip_svg <- function(colors, width, height, radius = 0, outline = FALSE) {
  w <- width / length(colors)
  bars <- sprintf(
    '<rect x="%.2f" y="0" width="%.2f" height="%d" fill="%s"/>',
    w * (seq_along(colors) - 1), w + 0.5, height, colors
  )
  edge <- if (outline) {
    sprintf(
      '<rect x="0.5" y="0.5" width="%d" height="%d" rx="%.1f" fill="none" stroke="#111111" stroke-opacity="0.08"/>',
      width - 1, height - 1, radius - 0.5
    )
  }
  c(
    sprintf(
      '<svg xmlns="http://www.w3.org/2000/svg" width="%d" height="%d" viewBox="0 0 %d %d">',
      width, height, width, height
    ),
    sprintf(
      '<clipPath id="corners"><rect width="%d" height="%d" rx="%d"/></clipPath>',
      width, height, radius
    ),
    '<g clip-path="url(#corners)">', bars, "</g>",
    edge,
    "</svg>"
  )
}

save_png <- function(svg, file, size) {
  rsvg::rsvg_png(charToRaw(paste(svg, collapse = "\n")), file,
                 width = size, height = size)
}

# Package logo, used by pkgdown, the README and the help pages
save_png(strip_svg(colors, 300, 300, radius = 66, outline = TRUE),
         "man/figures/logo.png", 480)

# Strip beside the package name in the site header
dir.create("pkgdown/assets", showWarnings = FALSE)
writeLines(strip_svg(colors, 360, 120, radius = 30), "pkgdown/assets/strip.svg")

# Favicons. A browser tab shows them at 16 to 32 pixels, too small for every
# color, so they use the first six.
tab_icon <- strip_svg(colors[1:6], 96, 96, radius = 21)
writeLines(tab_icon, "pkgdown/favicon/favicon.svg")
save_png(tab_icon, "pkgdown/favicon/favicon-96x96.png", 96)
ico <- vapply(c(16, 32, 48), function(size) {
  file <- file.path(tempdir(), sprintf("favicon-%d.png", size))
  save_png(tab_icon, file, size)
  file
}, character(1))
magick::image_write(magick::image_read(ico), "pkgdown/favicon/favicon.ico",
                    format = "ico")

# Home-screen icons. Phones round the corners themselves, so these fill the
# whole square.
home_icon <- strip_svg(colors, 180, 180)
save_png(home_icon, "pkgdown/favicon/apple-touch-icon.png", 180)
save_png(home_icon, "pkgdown/favicon/web-app-manifest-192x192.png", 192)
save_png(home_icon, "pkgdown/favicon/web-app-manifest-512x512.png", 512)

# Labeled swatches shown with the README color table, six to a row
rows <- ceiling(n / 6)
png("man/figures/palette.png", width = 1200, height = 220 * rows, res = 150,
    bg = "white")
par(mar = rep(0.2, 4))
plot.new()
plot.window(xlim = c(0, 6), ylim = c(0, rows))
x <- (seq_len(n) - 1) %% 6
y <- rows - 1 - (seq_len(n) - 1) %/% 6
rect(x + 0.06, y + 0.38, x + 0.94, y + 0.96, col = colors, border = "grey80")
text(x + 0.5, y + 0.25, labels, font = 2, cex = 0.8, col = "#333333")
text(x + 0.5, y + 0.1, colors, cex = 0.75, col = canhr_palette[["dark grey"]])
invisible(dev.off())
