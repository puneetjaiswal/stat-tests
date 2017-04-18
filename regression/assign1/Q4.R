# Ques4
install.packages("HistData")
library(HistData)
install.packages("ggplot2")
library(ggplot2)
data("Galton")

View(Galton)

# parent = x, child = y
plot(Galton$child~Galton$parent, xlab = "Parent Height",ylab = "Child Height", main = "Galton Height Data" )

# Running linear model regression, always pass y~x
heights.lm = lm(child~parent, Galton)
abline(heights.lm)
summary(heights.lm)

confint(heights.lm, level=0.95)

newdata=list(parent=65)
predict(heights.lm, newdata, interval="confidence",level=.90)
predict(heights.lm, newdata, interval="predict",level=.90)


