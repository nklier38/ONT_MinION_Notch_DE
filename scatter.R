
props = read.csv("/home/nikola/maindir/pipelines/histograms/proportions.csv", header=FALSE)
names(props) = c('Proportion of gene length', 'Gene Length')


smoothScatter(props$`Gene Length`,props$`Proportion of gene length`,cex=4, nr=0, ylim=c(0, 1.2), xlim = c(0, 12000), bandwidth = 0.001, xlab= "Length of Mapped Gene", ylab="Proportional Coverage of Gene", colramp = colorRampPalette(c("white", "blue")))

trendLine = lm(props$`Proportion of gene length` ~ props$`Gene Length`)

summary(trendLine)

abline(trendLine)

equation = expression(paste("y=(-6.901*10"^"-5", ")x + 0.7377"))
  
Rsq = expression(paste("R"^"2", "=0.04134"))

legend(10000, 1.1, legend = c("Trendline Statistics", equation, Rsq))#stats manually taken from summary object