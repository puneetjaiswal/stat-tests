# Assignment 3
setwd("/opt/Code/My/R-Tests/regression/assign3")
assessedValuations <- read.table("CH08PR24.txt")
par(mfrow=c(3,3))
colnames(assessedValuations) <- c("sellingPrice", "assessedValue", "lotLocation")

boxplot(sellingPrice~interaction(plotLocation), assessedValuations)

assessedValuations_lm <- lm(sellingPrice~assessedValue+factor(plotLocation), assessedValuations)
summary(assessedValuations_lm)

plot(predict(assessedValuations_lm), assessedValuations$sellingPrice, xlab="predicted selling price", ylab="actual selling price")
abline(a=0,b=1)                                    

par(mfrow=c(2,2))
plot(assessedValuations_lm)

# with interaction term
assessedValuations_lm1 <- lm(sellingPrice~assessedValue+factor(plotLocation) + assessedValue * factor(plotLocation), assessedValuations)
summary(assessedValuations_lm1)

plot(assessedValuations_lm1)

# predict
newdata=list(assessedValue=100, plotLocation=1) # Corner lot
predict(assessedValuations_lm, newdata, interval="confidence",level=.95)

newdata=list(assessedValue=100, plotLocation=0)

