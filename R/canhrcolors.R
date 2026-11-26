canhr_palette <- c(
  "blue"         = "#236192",
  "gold"         = "#FFCD00",
  "green"        = "#71984A",
  "orange"       = "#DF6A2E",
  "cyan"         = "#87D1E6",
  "magenta"      = "#F45197",
  "dark blue"    = "#111C4E",
  "brown"        = "#774D28",
  "dark grey"    = "#66665D",
  "custard"      = "#F6DFA4",
  "light blue"   = "#C4CFDA",
  "light grey"   = "#C8C8C8",
  "deep teal"    = "#165B63",
  "tundra green" = "#526B46",
  "warm berry"   = "#A43D52",
  "warm ivory"   = "#F7F4EC",
  "charcoal"     = "#263238",
  "muted gold"   = "#D6AA51"
)

#' CANHR colors
#'
#' Get hex codes for the brand colors of the Center for Alaska Native Health
#' Research (CANHR).
#'
#' The full palette is returned in the order used by [scale_color_canhr()]
#' and [scale_fill_canhr()].
#'
#' @param x A character vector of color names, or `"all"` (the default) for
#'   the full palette. The names are `"blue"`, `"gold"`, `"green"`,
#'   `"orange"`, `"cyan"`, `"magenta"`, `"dark blue"`, `"brown"`,
#'   `"dark grey"`, `"custard"`, `"light blue"`, `"light grey"`,
#'   `"deep teal"`, `"tundra green"`, `"warm berry"`, `"warm ivory"`,
#'   `"charcoal"` and `"muted gold"`. Case is ignored, and `"gray"` can be
#'   used for `"grey"`.
#'
#' @return An unnamed character vector of hex color codes.
#' @seealso [scale_color_canhr()], [theme_canhr()]
#' @export
#' @examples
#' canhrcolors()
#' canhrcolors("blue")
#' canhrcolors(c("deep teal", "warm berry"))
#'
#' barplot(1:6, col = canhrcolors()[1:6], border = NA)
#' hist(faithful$waiting, col = canhrcolors("blue"), border = "white")
canhrcolors <- function(x = "all") {
  if (!is.character(x) || anyNA(x)) {
    stop("`x` must be a character vector of color names.", call. = FALSE)
  }

  key <- gsub("gray", "grey", tolower(x), fixed = TRUE)
  if (identical(key, "all")) {
    return(unname(canhr_palette))
  }

  unknown <- x[!key %in% names(canhr_palette)]
  if (length(unknown) > 0) {
    stop(
      "Unknown CANHR color: ", quoted(unknown), ".\n",
      "Available colors: ", quoted(names(canhr_palette)), ".",
      call. = FALSE
    )
  }

  unname(canhr_palette[key])
}

quoted <- function(x) {
  paste(encodeString(x, quote = "\""), collapse = ", ")
}
