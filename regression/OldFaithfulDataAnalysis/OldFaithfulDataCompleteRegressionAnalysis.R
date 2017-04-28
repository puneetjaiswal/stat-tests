install.packages("lawstat") # levene test
install.packages("lmtest") # Breusch Pagan test


install.packages("ggplot2")
library(ggplot2)



setwd("/opt/Code/My/R-Tests/regression/OldFaithfulDataAnalysis/")

oldfaithful= read.table("oldfaithful.txt")

colnames(oldfaithful) <- c("srno","eruptions","waiting")

oldfaithful_lm = lm(oldfaithful$waiting~oldfaithful$eruptions)

summary(oldfaithful_lm)

confint(oldfaithful_lm,level=0.95)

# Analysis of variance table
anova(oldfaithful_lm)


# Predictor analysis
ggplot(data=oldfaithful,aes(y=eruptions, x =""))+ geom_boxplot(color = "blue") +
  scale_x_discrete(name = "Predictor") +   
  scale_y_continuous(name = "Eruption time in minutes")+
  geom_jitter(width = 0.2, color= "red")

boxplot(oldfaithful$eruptions)
dotchart(oldfaithful$eruptions)

 # Response Analysis : fitted vs residual
ggplot(oldfaithful_lm, aes(x=.fitted, y = .resid))+
  geom_point(size =1, shape =2, color="orange")+
  geom_hline(yintercept=0, col="red", linetype="dashed") +
  xlab("Fitted values")+ylab("Residuals") +
  ggtitle("Residual vs Fitted Plot") 

#----------
par(mfrow=c(1,2))
oldfaithful.res = resid(oldfaithful_lm)
oldfaithful.fit=fitted(oldfaithful_lm)

#  residuals  vs eruption time 
plot(oldfaithful$eruptions, oldfaithful.res, xlab="Eruption Time", ylab = "Residuals", main="Old faithful eruptions")
abline(0,0)

# residuals vs fitted value
plot(oldfaithful.fit, oldfaithful.res, xlab="Fitted Values", ylab = "Residuals", main="Old faithful eruptions")
abline(0,0)

# Formal test for constancy of error variance
# Brown Forsyth Test - when variance of the error terms either increases or decreases with X
# its a t-test for testing whether the mean of 2 normally distributed populations are same, where the populations are the absolute deviations between the prediction and the observed output space in two non-overlapping partitions of the input space.
# Divide X into X1 (low) and X2 (high values of X)
oldfaithful_lm$groups <- ifelse(oldfaithful$eruptions < 3, c("1"), c("2"))
oldfaithful_lm$groups

levene.test(oldfaithful_lm$residuals, oldfaithful_lm$groups)
bptest(regmodel)


# modified robust Brown-Forsythe Levene Type test based on the absolute derivations from the median
install.packages("car")
library(car)
ncvTest(oldfaithful_lm)


# Normality of residuals
oldfaithful_stdres = rstandard(oldfaithful_lm)
qqnorm(oldfaithful_stdres, ylab="Standardized Residuals", xlab="Normal Scores", main="Old Faithful eruptions")
qqline(oldfaithful_stdres)

# Lack of Fit test
Reduced = lm(oldfaithful$waiting~oldfaithful$eruptions) # Fit reduced model
Full = lm(oldfaithful$waiting~0+as.factor(oldfaithful$eruptions)) # Fit full model
anova (Reduced, Full) # Get Lack-of-Fit test

# Box Cox 
# Transforming either or both of Y,X to make fit into the model
# install.packages("MASS")
# boxcox(Y~X, data = data_name, lambda = seq(startvalue, endvalue, length = 10))


