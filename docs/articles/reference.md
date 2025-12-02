# Color Reference Guide

## Complete UAF Color Palette

The official UAF color palette includes 12 colors organized into three
categories:

### Primary Colors

| Color | Name     | Hex      | RGB         |
|-------|----------|----------|-------------|
| Blue  | `"blue"` | \#236192 | 35, 97, 146 |
| Gold  | `"gold"` | \#FFCD00 | 255, 205, 0 |

### Secondary Colors

| Color   | Name        | Hex      | RGB           |
|---------|-------------|----------|---------------|
| Green   | `"green"`   | \#71984A | 113, 152, 74  |
| Orange  | `"orange"`  | \#DF6A2E | 223, 106, 46  |
| Cyan    | `"cyan"`    | \#87D1E6 | 135, 209, 230 |
| Magenta | `"magenta"` | \#F45197 | 244, 81, 151  |

### Accent Colors

| Color      | Name           | Hex      | RGB           |
|------------|----------------|----------|---------------|
| Dark Blue  | `"dark blue"`  | \#111C4E | 17, 28, 78    |
| Brown      | `"brown"`      | \#774D28 | 119, 77, 40   |
| Dark Grey  | `"dark grey"`  | \#66665D | 102, 102, 93  |
| Custard    | `"custard"`    | \#F6DFA4 | 246, 223, 164 |
| Light Blue | `"light blue"` | \#C4CFDA | 196, 207, 218 |
| Light Grey | `"light grey"` | \#C8C8C8 | 200, 200, 200 |

------------------------------------------------------------------------

## R Color Reference

### Getting Individual Colors

Use `uafcolors()` with a color name to get a single hex code:

``` r
uafcolors("blue")
```

    ## [1] "#236192"

``` r
uafcolors("gold")
```

    ## [1] "#FFCD00"

``` r
uafcolors("green")
```

    ## [1] "#71984A"

### Getting Multiple Colors

**All 12 colors:**

``` r
uafcolors()
```

    ##  [1] "#236192" "#FFCD00" "#71984A" "#DF6A2E" "#87D1E6" "#F45197" "#111C4E"
    ##  [8] "#774D28" "#66665D" "#F6DFA4" "#C4CFDA" "#C8C8C8"

**First n colors (subset):**

``` r
# First 4 colors
uafcolors()[1:4]
```

    ## [1] "#236192" "#FFCD00" "#71984A" "#DF6A2E"

``` r
# First 6 colors
uafcolors()[1:6]
```

    ## [1] "#236192" "#FFCD00" "#71984A" "#DF6A2E" "#87D1E6" "#F45197"

**Specific colors by combining:**

``` r
# Custom selection
c(uafcolors("blue"), uafcolors("gold"), uafcolors("orange"))
```

    ## [1] "#236192" "#FFCD00" "#DF6A2E"

### Base R Graphics

**Using a single color:**

``` r
hist(data, col = uafcolors("blue"))
plot(x, y, col = uafcolors("gold"), pch = 19)
barplot(values, col = uafcolors("green"))
```

**Using multiple colors:**

``` r
# Color by group (12 groups max)
barplot(1:12, col = uafcolors(), border = NA)

# First n colors for n categories
pie(rep(1, 4), col = uafcolors()[1:4])

# Custom color vector
boxplot(data ~ group, col = c(uafcolors("blue"), uafcolors("gold")))
```

**Direct hex codes in base R:**

``` r
plot(x, y, col = "#236192")  # UAF Blue
points(x2, y2, col = "#FFCD00")  # UAF Gold
```

### ggplot2 Functions

**`scale_color_uaf()`** - For point and line colors:

``` r
ggplot(data, aes(x, y, color = group)) +
  geom_point() +
  scale_color_uaf()
```

**`scale_fill_uaf()`** - For fill colors (bars, areas):

``` r
ggplot(data, aes(x, fill = category)) +
  geom_bar() +
  scale_fill_uaf()
```

**`theme_uaf()`** - UAF-styled theme:

``` r
ggplot(data, aes(x, y)) +
  geom_point(color = uafcolors("blue")) +
  theme_uaf()

# Adjust base font size
theme_uaf(base_size = 14)
```

**Manual color specification in ggplot2:**

``` r
# Single color
ggplot(data, aes(x, y)) +
  geom_point(color = uafcolors("blue"))

# Manual scale with specific colors
ggplot(data, aes(x, y, color = group)) +
  geom_point() +
  scale_color_manual(values = c(uafcolors("blue"), uafcolors("gold"), uafcolors("green")))

# Manual fill
ggplot(data, aes(x, fill = category)) +
  geom_bar() +
  scale_fill_manual(values = uafcolors()[1:3])
```

------------------------------------------------------------------------

## Stata Color Reference

### Using the UAF Scheme

**Install the scheme:**

``` stata
net install uaf, from("https://raw.githubusercontent.com/rdazadda/UAF-color-schemes/main/")
```

**Set scheme for current session:**

``` stata
set scheme uaf
```

**Set scheme permanently:**

``` stata
set scheme uaf, permanently
```

### Scheme Color Order

When using the UAF scheme, Stata automatically assigns colors in this
order:

| Position | Color      | RGB         |
|----------|------------|-------------|
| p1       | Blue       | 35 97 146   |
| p2       | Gold       | 255 205 0   |
| p3       | Green      | 113 152 74  |
| p4       | Orange     | 223 106 46  |
| p5       | Cyan       | 135 209 230 |
| p6       | Magenta    | 244 81 151  |
| p7       | Dark Blue  | 17 28 78    |
| p8       | Brown      | 119 77 40   |
| p9       | Dark Grey  | 102 102 93  |
| p10      | Custard    | 246 223 164 |
| p11      | Light Blue | 196 207 218 |
| p12      | Light Grey | 200 200 200 |

### Manual Color Specification in Stata

**Single color using RGB:**

``` stata
twoway scatter y x, mcolor("35 97 146")  // UAF Blue
twoway scatter y x, mcolor("255 205 0")  // UAF Gold
```

**Line colors:**

``` stata
twoway line y x, lcolor("35 97 146") lwidth(medium)
```

**Fill colors:**

``` stata
graph bar y, bar(1, color("35 97 146"))
```

**Multiple series with specific colors:**

``` stata
twoway (scatter y1 x, mcolor("35 97 146")) ///
       (scatter y2 x, mcolor("255 205 0")) ///
       (scatter y3 x, mcolor("113 152 74"))
```

### Common Graph Options with UAF Colors

**Scatter plot:**

``` stata
set scheme uaf
twoway scatter mpg weight, msize(large) ///
       title("My Title")
```

**Bar chart:**

``` stata
set scheme uaf
graph bar (mean) mpg, over(rep78) ///
       title("Average MPG") ///
       blabel(bar, format(%4.1f))
```

**Bar chart with different colors per bar:**

``` stata
set scheme uaf
graph bar (mean) mpg, over(rep78) asyvars ///
       title("Average MPG")
```

**Box plot:**

``` stata
set scheme uaf
graph box mpg, over(foreign) ///
       title("MPG Distribution")
```

**Line graph:**

``` stata
set scheme uaf
twoway (line y1 x) (line y2 x) (line y3 x), ///
       legend(order(1 "Series 1" 2 "Series 2" 3 "Series 3"))
```

------------------------------------------------------------------------

## Quick Reference Card

### R Functions

| Function            | Purpose                  |
|---------------------|--------------------------|
| `uafcolors()`       | Get all 12 colors        |
| `uafcolors("name")` | Get single color by name |
| `uafcolors()[1:n]`  | Get first n colors       |
| `scale_color_uaf()` | ggplot2 color scale      |
| `scale_fill_uaf()`  | ggplot2 fill scale       |
| `theme_uaf()`       | ggplot2 theme            |

### R Color Names

`"blue"`, `"gold"`, `"green"`, `"orange"`, `"cyan"`, `"magenta"`,
`"dark blue"`, `"brown"`, `"dark grey"`, `"custard"`, `"light blue"`,
`"light grey"`, `"white"`

### Stata Commands

| Command                       | Purpose        |
|-------------------------------|----------------|
| `set scheme uaf`              | Use UAF scheme |
| `set scheme uaf, permanently` | Set as default |
| `mcolor("R G B")`             | Marker color   |
| `lcolor("R G B")`             | Line color     |
| `fcolor("R G B")`             | Fill color     |
| `bar(n, color("R G B"))`      | Bar color      |

### Stata RGB Values

| Color      | RGB         |
|------------|-------------|
| Blue       | 35 97 146   |
| Gold       | 255 205 0   |
| Green      | 113 152 74  |
| Orange     | 223 106 46  |
| Cyan       | 135 209 230 |
| Magenta    | 244 81 151  |
| Dark Blue  | 17 28 78    |
| Brown      | 119 77 40   |
| Dark Grey  | 102 102 93  |
| Custard    | 246 223 164 |
| Light Blue | 196 207 218 |
| Light Grey | 200 200 200 |
