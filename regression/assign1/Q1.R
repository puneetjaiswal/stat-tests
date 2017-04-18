# Ques5
install.packages("alr4")
library("alr4")
data("UN11")
names(UN11)
install.packages("ggplot2")
library(ggplot2)

#Predictor (X) : ppgdp
#Response (Y) : fertility
plot(UN11$fertility~UN11$ppgdp, xlab = "Gross National product per person (USD)",ylab = "Birth rate per 1000 females", main = "UN 2011 Data" )

plot(log(UN11$fertility)~log(UN11$ppgdp), 
     xlab = "Log - Gross National product per person (USD)",
     ylab = "Log - Birth rate per 1000 females",
     main = "UN 2011 Data" )

un11_log_lm=lm(log(fertility)~log(ppgdp), UN11)
abline(un11_log_lm)

summary(un11_log_lm)
