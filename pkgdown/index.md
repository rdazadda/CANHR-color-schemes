<div class="home-hero">
<h1 class="home-title">CANHR<br>colors</h1>
<div class="home-intro">
<p>Brand colors for R and Stata graphs.</p>
<p class="home-meta">Center for Alaska Native Health Research · canhrcolors 1.1.0</p>
</div>
</div>

<ol class="home-palette" aria-label="The CANHR colors">
<li style="background: #236192" title="Blue #236192"><span class="visually-hidden">Blue #236192</span></li>
<li style="background: #FFCD00" title="Gold #FFCD00"><span class="visually-hidden">Gold #FFCD00</span></li>
<li style="background: #71984A" title="Green #71984A"><span class="visually-hidden">Green #71984A</span></li>
<li style="background: #DF6A2E" title="Orange #DF6A2E"><span class="visually-hidden">Orange #DF6A2E</span></li>
<li style="background: #87D1E6" title="Cyan #87D1E6"><span class="visually-hidden">Cyan #87D1E6</span></li>
<li style="background: #F45197" title="Magenta #F45197"><span class="visually-hidden">Magenta #F45197</span></li>
<li style="background: #111C4E" title="Dark Blue #111C4E"><span class="visually-hidden">Dark Blue #111C4E</span></li>
<li style="background: #774D28" title="Brown #774D28"><span class="visually-hidden">Brown #774D28</span></li>
<li style="background: #66665D" title="Dark Grey #66665D"><span class="visually-hidden">Dark Grey #66665D</span></li>
<li style="background: #F6DFA4" title="Custard #F6DFA4"><span class="visually-hidden">Custard #F6DFA4</span></li>
<li style="background: #C4CFDA" title="Light Blue #C4CFDA"><span class="visually-hidden">Light Blue #C4CFDA</span></li>
<li style="background: #C8C8C8" title="Light Grey #C8C8C8"><span class="visually-hidden">Light Grey #C8C8C8</span></li>
<li style="background: #165B63" title="Deep Teal #165B63"><span class="visually-hidden">Deep Teal #165B63</span></li>
<li style="background: #526B46" title="Tundra Green #526B46"><span class="visually-hidden">Tundra Green #526B46</span></li>
<li style="background: #A43D52" title="Warm Berry #A43D52"><span class="visually-hidden">Warm Berry #A43D52</span></li>
<li style="background: #F7F4EC" title="Warm Ivory #F7F4EC"><span class="visually-hidden">Warm Ivory #F7F4EC</span></li>
<li style="background: #263238" title="Charcoal #263238"><span class="visually-hidden">Charcoal #263238</span></li>
<li style="background: #D6AA51" title="Muted Gold #D6AA51"><span class="visually-hidden">Muted Gold #D6AA51</span></li>
</ol>

<section class="home-row">
<h2>Install</h2>
<div class="home-body home-cols">
<div>
<p class="label">R</p>
<pre><code># install.packages("devtools")
devtools::install_github("rdazadda/CANHR-color-schemes")</code></pre>
</div>
<div>
<p class="label">Stata</p>
<pre class="wrap"><code>net install canhr, from("https://raw.githubusercontent.com/rdazadda/CANHR-color-schemes/main/") replace</code></pre>
</div>
</div>
</section>

<section class="home-row">
<h2>Use</h2>
<div class="home-body">
<div class="home-cols">
<div>
<p class="label">R</p>
<pre><code>library(canhrcolors)
library(ggplot2)

ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point(size = 2.5) +
  scale_color_canhr(labels = c("4WD", "Front", "Rear")) +
  theme_canhr() +
  labs(
    title = "Fuel economy by engine size",
    x = "Engine displacement (litres)",
    y = "Highway miles per gallon",
    color = "Drive"
  )</code></pre>
</div>
<div>
<img src="articles/basicuse_files/figure-html/scatter-1.png" alt="Scatter plot of highway mileage against engine size, colored by drive type with scale_color_canhr() and styled with theme_canhr()">
</div>
</div>
<div class="home-cols">
<div>
<p class="label">Stata</p>
<pre><code>set scheme canhr

sysuse citytemp, clear
graph bar (mean) tempjan tempjuly, over(region) ///
    title("Average temperature by region") ///
    ytitle("Degrees Fahrenheit") ///
    legend(order(1 "January" 2 "July"))</code></pre>
<p class="label">Add <code>, permanently</code> to <code>set scheme</code> to make it your default.</p>
</div>
<div>
<img src="articles/figures/bar.png" alt="Stata bar chart of average January and July temperatures by region, drawn with the canhr scheme">
</div>
</div>
</div>
</section>

<section class="home-row">
<h2>Read</h2>
<div class="home-body home-cols">
<div>
<a class="home-link" href="articles/basicuse.html">Basic Use →</a>
<p class="label">Get colors by name and use them in ggplot2 and base R graphics.</p>
</div>
<div>
<a class="home-link" href="articles/stata.html">Stata Usage →</a>
<p class="label">Set the canhr scheme and use the colors in Stata graphs.</p>
</div>
</div>
</section>
