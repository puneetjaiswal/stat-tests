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

# Hypothesis Testing
t_actual = (sample_mean-30)/(sample_sd/sqrt(N))
sample_mean
t_actual
p_value1 = mean(bs_t < t_actual)
p_value1
# 21 % confidence is good enough

p_value2 = mean(bs_t > t_actual)
p_value2