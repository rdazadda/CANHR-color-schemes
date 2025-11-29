# Generate UAF color palette image

colors <- c("#236192", "#FFCD00", "#71984A", "#DF6A2E", "#87D1E6", "#F45197",
            "#111C4E", "#774D28", "#66665D", "#F6DFA4", "#C4CFDA", "#C8C8C8")

png("man/figures/uafcolors.png", width = 500, height = 200, bg = "white")
par(mar = c(0.5, 0.5, 0.5, 0.5))
plot(NULL, xlim = c(0, 12), ylim = c(0, 2), axes = FALSE, xlab = "", ylab = "")
for (i in 1:12) {
  rect(i - 1, 0.2, i - 0.1, 1.8, col = colors[i], border = NA)
}
dev.off()

png("man/figures/logo.png", width = 200, height = 230, bg = "white")
par(mar = c(0, 0, 0, 0))
plot(NULL, xlim = c(0, 4), ylim = c(0, 5), axes = FALSE, xlab = "", ylab = "")
for (i in 1:12) {
  row <- (i - 1) %/% 4
  col <- (i - 1) %% 4
  rect(col * 0.95 + 0.1, 4.5 - row * 1.1, col * 0.95 + 0.95, 5.5 - row * 1.1,
       col = colors[i], border = NA)
}
text(2, 0.6, "uafcolors", cex = 1.3, font = 2, col = "#236192")
dev.off()
