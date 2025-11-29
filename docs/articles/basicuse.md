# Basic Use

## Installation

``` r
# install.packages("devtools")
devtools::install_github("canhr/uafcolors")
```

## Load Package

``` r
library(uafcolors)
```

## Get Colors

``` r
# All colors
uafcolors()
```

    ##  [1] "#236192" "#FFCD00" "#71984A" "#DF6A2E" "#87D1E6" "#F45197" "#111C4E"
    ##  [8] "#774D28" "#66665D" "#F6DFA4" "#C4CFDA" "#C8C8C8"

``` r
# Single color
uafcolors("blue")
```

    ## [1] "#236192"

``` r
uafcolors("gold")
```

    ## [1] "#FFCD00"

## Base R Graphics

``` r
barplot(1:12, col = uafcolors(), border = NA, main = "UAF Colors")
```

![](basicuse_files/figure-html/unnamed-chunk-4-1.png)

``` r
hist(iris$Sepal.Length, col = uafcolors("blue"), border = "white",
     main = "Histogram", xlab = "Sepal Length")
```

![](basicuse_files/figure-html/unnamed-chunk-5-1.png)

``` r
plot(iris$Sepal.Length, iris$Sepal.Width,
     col = uafcolors()[as.numeric(iris$Species)],
     pch = 19, main = "Scatter Plot",
     xlab = "Sepal Length", ylab = "Sepal Width")
```

![](basicuse_files/figure-html/unnamed-chunk-6-1.png)

## ggplot2

``` r
library(ggplot2)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  scale_color_uaf() +
  theme_uaf() +
  labs(title = "Iris Data")
```

![](basicuse_files/figure-html/unnamed-chunk-7-1.png)

``` r
ggplot(mpg, aes(class, fill = class)) +
  geom_bar() +
  scale_fill_uaf() +
  theme_uaf() +
  labs(title = "Vehicle Classes") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

![](basicuse_files/figure-html/unnamed-chunk-8-1.png)

## Color Reference

| Color      | Hex      | Code                      |
|------------|----------|---------------------------|
| Blue       | \#236192 | `uafcolors("blue")`       |
| Gold       | \#FFCD00 | `uafcolors("gold")`       |
| Green      | \#71984A | `uafcolors("green")`      |
| Orange     | \#DF6A2E | `uafcolors("orange")`     |
| Cyan       | \#87D1E6 | `uafcolors("cyan")`       |
| Magenta    | \#F45197 | `uafcolors("magenta")`    |
| Dark Blue  | \#111C4E | `uafcolors("dark blue")`  |
| Brown      | \#774D28 | `uafcolors("brown")`      |
| Dark Grey  | \#66665D | `uafcolors("dark grey")`  |
| Custard    | \#F6DFA4 | `uafcolors("custard")`    |
| Light Blue | \#C4CFDA | `uafcolors("light blue")` |
| Light Grey | \#C8C8C8 | `uafcolors("light grey")` |
