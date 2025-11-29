* Generate UAF scheme example graphs

set scheme uaf

* Create output folder
capture mkdir "vignettes/stata_files"

* Scatter plot
sysuse auto, clear
scatter mpg weight, title("Scatter Plot")
graph export "vignettes/stata_files/scatter.png", replace width(800)

* Bar chart
graph bar (mean) mpg, over(foreign) title("Bar Chart")
graph export "vignettes/stata_files/bar.png", replace width(800)

* Histogram
histogram mpg, title("Histogram")
graph export "vignettes/stata_files/histogram.png", replace width(800)

* Box plot
graph box mpg, over(rep78) title("Box Plot")
graph export "vignettes/stata_files/boxplot.png", replace width(800)

* Multiple series scatter
twoway (scatter mpg weight if foreign==0) ///
       (scatter mpg weight if foreign==1), ///
       legend(label(1 "Domestic") label(2 "Foreign")) ///
       title("Multiple Series")
graph export "vignettes/stata_files/multi.png", replace width(800)

* Line graph
sysuse sp500, clear
tsset date
tsline close, title("Line Graph")
graph export "vignettes/stata_files/line.png", replace width(800)

exit, clear
