# Correlation between distance and fair

airline_data = read.table("/opt/Code/My/R-Tests/regression/airlines_data/airlinesdata2004.txt")
colnames(airline_data)=c("City1", "City2", "Fare", "Distance", "Passengers",
                  "LeadAirline", "MarketShare", "AvgFare", "LowPr", "MarketShare2", "Price")

plot(airline_data$Distance, airline_data$Fare, xlab="Distance", ylab="Average Fare",
     main="Distance and Fare for Airlines Data", pch=2, col="blue")

cor.test(airline_data$Distance, airline_data$Fare)

# lm - linear model
airlines_lm=lm(Fare~Distance, airline_data)

abline(airlines_lm)

summary(airlines_lm)

# confidence interval
confint(airlines_lm)  

# predict for a given value of x, with a confidence interval
predict(airlines_lm, newdata=list(Distance=500), interval="confidence",level=.50)

# predict for multiple values, using data-frames
newx=data.frame(Distance=500)
predict(airlines_lm, newx, interval="confidence",level=0.9)
        
newx=data.frame(Distance=c(500, 1000))  
predict(airlines_lm, newx, interval="confidence",level=0.9)


