test_that("the full palette is returned in order", {
  pal <- canhrcolors()

  expect_null(names(pal))
  expect_equal(pal[1:3], c("#236192", "#FFCD00", "#71984A"))
  expect_equal(pal[13:18], c("#165B63", "#526B46", "#A43D52",
                             "#F7F4EC", "#263238", "#D6AA51"))
  expect_match(pal, "^#[0-9A-F]{6}$")
})

test_that("colors can be selected by name", {
  expect_equal(canhrcolors("blue"), "#236192")
  expect_equal(canhrcolors(c("gold", "deep teal")), c("#FFCD00", "#165B63"))
})

test_that("names ignore case and accept gray for grey", {
  expect_equal(canhrcolors("Dark Gray"), canhrcolors("dark grey"))
  expect_equal(canhrcolors("ALL"), canhrcolors())
})

test_that("invalid input is an error", {
  expect_error(canhrcolors("purple"), "Unknown CANHR color")
  expect_error(canhrcolors(1), "character vector")
  expect_error(canhrcolors(NA_character_), "character vector")
})
