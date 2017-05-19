# Mid Term 2
install.packages("readxl")
setwd("/opt/Code/My/R-Tests/regression/mt2")
demoData <- readxl::read_xlsx("MOAData.xlsx")
colnames(demoData) <- c("race","year", "area", "hdIndex", "lifeExpAtBirth","gradDeg","schEnroll","medianEarn","healthIndex","eduIndex","incomeIndex")
par(mfrow=c(1,1))

# a
boxplot(demoData$hdIndex~demoData$race)

par(mfrow=c(2,2))


#b
options(scipen = 99, digits = 3)

demoHdLm1<-lm(hdIndex~factor(race)+medianEarn,demoData)
summary(demoHdLm1)

plot(demoHdLm1)

#c
demoHdLm2<-lm(hdIndex~factor(race)+medianEarn + factor(race)*medianEarn,demoData)
summary(demoHdLm2)
plot(demoHdLm2)

anova(demoHdLm1, demoHdLm2)

install.packages("ggplot2")
library(ggplot2)

# Not sure how this works
install.packages("visreg")
library(visreg)
visreg(demoHdLm1, xvar = "X1", by = "X2", whitespace = 0.5, overlay = TRUE, band = FALSE, points.par = list(cex = 1.1))

# assessed_valuation.mod = cbind(Assessed_valuation, predict(assess_valuation.lm_ additive, 
#                                                           interval = "confidence", level = 0.95))
#assess_valuation_add.ggplot = ggplot(data=Assessed_ valuation.mod, aes(x=assessed_value, 
#                                                                       y=selling_price, 
#####                                                                     group = plot_location,                                                                       colour = factor(plot_location))) + 
#  geom_point() +
#  geom_line(aes(y=fit)) +
#  geom_ribbon(aes(ymin = lwr, ymax = upr), alpha = 0.4) +
#  ggtitle("Selling price vs. Assessed value by Location")
#plot(assess_valuation_add. ggplot)
####

ggplot(data=demoData, aes(x=incomeIndex, y=hdIndex, colour=factor(race))) + geom_point() + xlab("Median Income") + ylab("HD Index") + geom_line(aes(y=demoHdLm1$fitted.values)) + ggtitle(summary(demoHdLm1)$call)
ggplot(data=demoData, aes(x=incomeIndex, y=hdIndex, colour=factor(race))) + geom_point() + xlab("Median Income") + ylab("HD Index") + geom_line(aes(y=demoHdLm2$fitted.values)) + ggtitle(summary(demoHdLm2)$call)

demoHdLm3 <-lm(hdIndex~factor(race)+medianEarn+lifeExpAtBirth,demoData)
summary(demoHdLm3)


plot(demoHdLm3)
qqnorm(demoHdLm3$residuals)
qqline(demoHdLm3$residuals)
hist(demoHdLm3$residuals)
shapiro.test(demoHdLm3$residuals)

install.packages("car")
library(car)
scatterplotMatrix(~demoData$hdIndex+factor(demoData$race)+demoData$lifeExpAtBirth+demoData$medianEarn)
par(mfrow=c(1,1))
marginalModelPlots(demoHdLm3)

#Constancy of variance
ncvTest(demoHdLm3)

outlierTest(demoHdLm3)
influenceIndexPlot(demoHdLm3)

influenceIndexPlot(demoHdLm3, id.n=2)
qqPlot(demoHdLm3)
leveragePlots(demoHdLm3)
residualPlots(demoHdLm3)

# Cooks distance plot to find outliers
influencePlot(demoHdLm3,id.n=2)

# Step function 
nullModel <- lm(hdIndex~1,demoData)
summary(nullModel)

step(nullModel, scope=list(lower=nullModel, upper=demoHdLm3), direction="forward")
