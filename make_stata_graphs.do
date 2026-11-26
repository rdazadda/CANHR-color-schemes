* Creates the example graphs shown in vignettes/stata.Rmd. Run it from the
* repository root so that Stata finds scheme-canhr.scheme:
*
*     do make_stata_graphs.do

version 15
set scheme canhr
capture mkdir "vignettes/figures"

* Scatter plot
sysuse auto, clear
twoway (scatter mpg weight if foreign == 0) ///
       (scatter mpg weight if foreign == 1), ///
    title("Mileage by weight") ///
    legend(order(1 "Domestic" 2 "Foreign"))
graph export "vignettes/figures/scatter.png", width(1200) replace

* Bar chart
sysuse citytemp, clear
graph bar (mean) tempjan tempjuly, over(region) ///
    title("Average temperature by region") ///
    ytitle("Degrees Fahrenheit") ///
    legend(order(1 "January" 2 "July"))
graph export "vignettes/figures/bar.png", width(1200) replace

* Box plot
sysuse auto, clear
graph box mpg, over(foreign) asyvars ///
    title("Mileage by origin")
graph export "vignettes/figures/boxplot.png", width(1200) replace

* Line graph
sysuse uslifeexp, clear
twoway line le_male le_female year, ///
    title("U.S. life expectancy") ///
    ytitle("Years") ///
    legend(order(1 "Men" 2 "Women"))
graph export "vignettes/figures/line.png", width(1200) replace
