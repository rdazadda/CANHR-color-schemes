* CANHR Scheme Example Graphs

set scheme canhr
capture mkdir "vignettes/stata_files"

* Scatter Plot
sysuse auto, clear
twoway (scatter mpg weight if foreign==0, msize(large)) ///
       (scatter mpg weight if foreign==1, msize(large)), ///
       title("Fuel Efficiency by Vehicle Weight") ///
       ytitle("Miles per Gallon") xtitle("Weight (lbs)") ///
       legend(order(1 "Domestic" 2 "Foreign") pos(11) ring(0) col(1))
graph export "vignettes/stata_files/scatter.png", replace width(800)

* Bar Chart
graph hbar (mean) mpg, over(rep78, relabel(1 "Poor" 2 "Fair" 3 "Average" 4 "Good" 5 "Excellent") sort(1) descending) ///
      asyvars ///
      title("Average Fuel Efficiency by Repair Record") ///
      ytitle("Miles per Gallon") ///
      blabel(bar, format(%4.1f) size(medium)) ///
      legend(off) ///
      bar(1, color("35 97 146")) ///
      bar(2, color("255 205 0")) ///
      bar(3, color("113 152 74")) ///
      bar(4, color("223 106 46")) ///
      bar(5, color("135 209 230"))
graph export "vignettes/stata_files/bar.png", replace width(800)

* Box Plot
graph box mpg, over(rep78, relabel(1 "Poor" 2 "Fair" 3 "Avg" 4 "Good" 5 "Exc")) ///
      asyvars ///
      title("Fuel Efficiency by Repair Record") ///
      ytitle("Miles per Gallon") ///
      legend(off)
graph export "vignettes/stata_files/boxplot.png", replace width(800)

* Line Graph
sysuse uslifeexp, clear
twoway (line le_wmale year, lwidth(thick)) ///
       (line le_wfemale year, lwidth(thick)) ///
       (line le_bmale year, lwidth(thick)) ///
       (line le_bfemale year, lwidth(thick)), ///
       title("U.S. Life Expectancy Trends") ///
       ytitle("Life Expectancy (years)") xtitle("Year") ///
       legend(order(1 "White Male" 2 "White Female" 3 "Black Male" 4 "Black Female") rows(1) pos(6))
graph export "vignettes/stata_files/line.png", replace width(800)

exit, clear
