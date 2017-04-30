a=60
b=100
sampleSize=100
scores = sample(a:b, sampleSize, replace = TRUE)
mean(scores)
sd(scores)
hist(scores, probability = TRUE, col= "orange")
