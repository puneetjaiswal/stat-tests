# Given Sample has Poisson, we dont know parameter lambda for sample
# Prior is Gamma with shape = 2, scale = 1, rate =1, i.e. mean = 2 var = 2
# Using Conjugate function for Baysian, Posterior is Gamma, by proof we can find parameter for posterior

particles_emitted = c(4, 1, 3, 1, 3, 3, 3, 1, 1, 1, 6, 4, 4, 2, 2, 1, 1, 4, 2, 5)

mean(particles_emitted)
N=length(particles_emitted)
B=5000
bss = sample(particles_emitted, B * N, replace=T)
bss_matrix=matrix(bss,nrow=B)
bss_mean=rowMeans(bss_matrix)
bci=quantile(bss_mean, c(0.025, 0.975))
bci
  

sum_xi = sum(particles_emitted)
sum_xi

prior_alpha=2
prior_beta=1

sample_size = 1000
posterior_alpha=sum_xi+prior_alpha
posterior_beta = N + prior_beta

posterior_data= rgamma(sample_size, shape=posterior_alpha, scale = posterior_beta)
plot(density(posterior_data))

posterior_alpha
posterior_beta
posterior_mean = posterior_alpha / posterior_beta
posterior_mean

prior_data = rgamma(sample_size, shape=prior_alpha, scale = prior_beta)
plot(density(prior_data))


