# testing linear regression model

install.packages("HistData")
library(HistData)
install.packages("ggplot2")
library(ggplot2)


data("Galton")

View(Galton)
#summary(Galton)

# parent = x, child = y
plot(Galton$parent, Galton$child)

# when used '~' its always y~x
plot(Galton$child~Galton$parent, xlab = "Parent Height",ylab = "Child Height", main = "Galton Height Data" )


# Running linear model regression, always pass y~x
heights.lm = lm(child~parent, Galton)
summary(heights.lm)

residuals.heights = resid(heights.lm)

sum(residuals.heights)

abline(lm(Galton$child~Galton$parent))

abline(lm(child~parent, Galton))


ggplot(Galton, aes(x=parent, y=child)) + geom_point(size=2, alpha=0.7) + xlab("Height of parent") + ylab("Height of son") + ggtitle("Galton Height Data")

# to add regression line
ggplot(Galton, aes(x=parent, y=child)) + geom_point(size=2, alpha=0.7) + xlab("Height of parent") + 
  ylab("Height of son") + ggtitle("Galton Height Data") + geom_smooth(methog='lm')
