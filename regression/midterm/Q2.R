
setwd("/opt/Code/My/R-Tests/regression/midterm")
backpacks <- read.table("Backpacks.txt", header = TRUE)
bplm = lm(backpacks$price~backpacks$volume)
summary(bplm)

plot(backpacks$volume, backpacks$price)
abline(bplm)

# predict for a given value of x, with a confidence interval
newx<-list(volume=2000)
bplm1 = lm(price~volume,backpacks)

predict(bplm1, newdata=newx, interval="confidence",level=.95)

#predict interval
predict(bplm1, newdata=newx, interval="predict",level=.95)

