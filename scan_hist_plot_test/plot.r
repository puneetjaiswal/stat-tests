fluo.conc = scan("/opt/Code/My/R-Tests/scan_hist_plot_test/Fluoride.txt")

# mean
mean(fluo.conc)

# st. deviation
sd(fluo.conc)

# 5 - number summary
summary(fluo.conc)

# histogram with multiple options
hist(fluo.conc)
hist(fluo.conc, main = "Histogram for Fluoride Concentrations", xlab = "concentration mg/g", ylab = "Freq", border = "red", col = "blue“, breaks = 10)

# making stem
stem(fluo.conc)

# boxplot
boxplot(fluo.conc, main ="Box Plot for Fluoride Concentrations", ylab="Concentration mg/g")


