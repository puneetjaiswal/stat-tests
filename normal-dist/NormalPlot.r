mu = 50
sigma = 6

plot (x, dnorm ( x, mu, sigma), type="l", lty="dotted", col="red", ylim= c(0,0.5))


sigma1=2
x1= seq(50-3*sigma1, 50+3*sigma1, by = 0.1)
lines(x1, dnorm(x1, mu, sigma1), type = "l", lty = "dashed", col = "blue")


sigma2=1
x2= seq(50-3*sigma2, 50+3*sigma2, by = 0.1)
lines(x2, dnorm(x2, mu, sigma2), type = "l", lty = "dashed", col = "black")

