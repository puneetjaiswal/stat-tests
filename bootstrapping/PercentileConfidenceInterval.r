# finding lower limit and upper bound with confidence 95 %
# Bootstrapping on commute time sample 

atlanta_data_frame = read.table(file='/opt/Code/My/R-Tests/bootstrapping/CommuteAtlanta.txt', sep='\t', header = TRUE)
commute_time = as.numeric(atlanta_data_frame[,'Time'])
hist(commute_time)
sample_mean = mean(commute_time)
sample_mean


N=length(commute_time)
B=1000

bss = sample(commute_time, B * N, replace=T)
bss_matrix=matrix(bss,nrow=B)
bs_mean=rowMeans(bss_matrix) 


sample_sd = sd(commute_time)

bs_sd = apply(bss_matrix, 1, sd) 
bs_t = (bs_mean - sample_mean)/(bs_sd/sqrt(N)) 
bs_tpercentile = quantile(bs_t,c(0.025, 0.975))

lowerlimit = sample_mean + (bs_tpercentile[1]*sample_sd/sqrt(N))
upperlimit = sample_mean + (bs_tpercentile[2]*sample_sd/sqrt(N))

lowerlimit; upperlimit



