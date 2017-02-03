a=60
b=100
initialSize=100
scores = sample(a:b, initialSize, replace = TRUE)
mean(scores)
sd(scores)
hist(scores, probability = TRUE, col= "orange")


meanSampleSize = 5

mean.sample=numeric(meanSampleSize) #create a vector to store the sample mean of the experiment, you can change the number 25 to 250, 2500 and so on

for(i in 1:1000) #to repeat the experiment 1000 times.
{
x_bar.sample=sample(scores,meanSampleSize) #creating a random sample of size 25 from the scores
mean.sample[i]=mean(x_bar.sample) # we store the mean of this sample inmean.sample and we do this 1000 times
}
hist(mean.sample, probability = TRUE, col = "blue", main = meanSampleSize) #creatinga histogram for the x_bar samples
mean_xbar = mean(mean.sample)
sd_xbar=sd(mean.sample)
print(c(mean_xbar, sd_xbar))
