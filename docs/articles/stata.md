# Stata Usage

## Installation

Install the CANHR graph scheme in Stata:

``` stata
net install canhr, from("https://raw.githubusercontent.com/rdazadda/CANHR-color-schemes/main/")
```

Or manually copy `scheme-canhr.scheme` to your Stata ado folder:

- Windows: `C:\ado\plus\s\`
- Mac: `~/Library/Application Support/Stata/ado/plus/s/`
- Linux: `~/ado/plus/s/`

## Basic Usage

Set the scheme for your session:

``` stata
set scheme canhr
```

Or set it permanently:

``` stata
set scheme canhr, permanently
```

## Examples

### Scatter Plot

``` stata
sysuse auto, clear
twoway (scatter mpg weight if foreign==0, msize(large)) ///
       (scatter mpg weight if foreign==1, msize(large)), ///
       title("Fuel Efficiency by Vehicle Weight") ///
       legend(order(1 "Domestic" 2 "Foreign"))
```

![Scatter Plot](stata_files/scatter.png)

Scatter Plot

### Bar Chart

``` stata
graph bar (mean) mpg, over(rep78) ///
      title("Average MPG by Repair Record") ///
      blabel(bar, format(%4.1f))
```

![Bar Chart](stata_files/bar.png)

Bar Chart

### Box Plot

``` stata
graph box mpg, over(foreign) ///
      title("Fuel Efficiency Comparison")
```

![Box Plot](stata_files/boxplot.png)

Box Plot

### Line Graph

``` stata
sysuse uslifeexp, clear
twoway (line le_wmale year) ///
       (line le_wfemale year) ///
       (line le_bmale year) ///
       (line le_bfemale year), ///
       title("U.S. Life Expectancy Trends") ///
       legend(order(1 "White Male" 2 "White Female" 3 "Black Male" 4 "Black Female"))
```

![Line Graph](stata_files/line.png)

Line Graph

## Scheme Colors

| Color      | RGB         | Hex      |
|------------|-------------|----------|
| Blue       | 35 97 146   | \#236192 |
| Gold       | 255 205 0   | \#FFCD00 |
| Green      | 113 152 74  | \#71984A |
| Orange     | 223 106 46  | \#DF6A2E |
| Cyan       | 135 209 230 | \#87D1E6 |
| Magenta    | 244 81 151  | \#F45197 |
| Dark Blue  | 17 28 78    | \#111C4E |
| Brown      | 119 77 40   | \#774D28 |
| Dark Grey  | 101 102 93  | \#66665D |
| Custard    | 246 223 164 | \#F6DFA4 |
| Light Blue | 196 207 218 | \#C4CFDA |
| Light Grey | 200 200 200 | \#C8C8C8 |
