# Q1

setwd("/opt/Code/My/R-Tests/regression/midterm")
ubsdata = read.table("UBSprices.txt")
plot(ubsdata$rice2003,ubsdata$rice2009,  xlab = "Rice 2003", ylab="Rice 2009", main = "UBS Rice price change in 2009 with 2003")

ubs_rice_lm = lm(ubsdata$rice2009~ubsdata$rice2003)

abline(ubs_rice_lm)

ubsdata
summary(ubs_rice_lm)

ubsdata2 = read.table("UBSprices_modified.txt")
plot(ubsdata2$rice2003,ubsdata2$rice2009,  xlab = "Rice 2003", ylab="Rice 2009", main = "UBS without outliers ")
ubs_rice_lm2 = lm(ubsdata2$rice2009~ubsdata2$rice2003)
abline(ubs_rice_lm2)


summary(ubs_rice_lm2)

plot(fitted(ubs_rice_lm2), resid(ubs_rice_lm2), xlab="Fitted Values", ylab = "Residuals", main="UBS Rice price 03/09 : resid vs fit")
plot(ubsdata2$rice2003, resid(ubs_rice_lm2), xlab="Predictor", ylab = "Residuals", main="UBS Rice price 03/09 : resid vs predictor")
abline(0,0)

qqnorm(resid(ubs_rice_lm2))
hist(resid(ubs_rice_lm2))

# Box Cox Transformation
install.packages("MASS")
library(MASS)
bc <- boxcox(ubsdata2$rice2009~ubsdata2$rice2003)
trans <- bc$x[which.max(bc$y)]
trans

# re-run with transformation
model_new <- lm(ubsdata2$rice2009 ^ trans ~ ubsdata2$rice2003)
summary(model_new)


# QQ-plot
op <- par(pty = "s", mfrow = c(1, 2))

# Compare
qqnorm(ubs_rice_lm2$residuals); qqline(ubs_rice_lm2$residuals)

qqnorm(model_new$residuals); qqline(model_new$residuals)
par(op)
