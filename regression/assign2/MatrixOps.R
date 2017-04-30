######## Assignment 2 #######
# Using Matrix operations to find 
# regression coefficients.
############################

# Question 5.2
A = matrix(c(2,3,5,4,1,5,7,8), nrow=4, ncol=2)
B <- matrix(c(6,9,3,1), nrow=4, ncol=1)
C <- matrix(c(3,8,5,2,8,6,1,4), nrow=4, ncol = 2)

A+C
A-C

t(B) %*% A
A %*% t(C)
t(C) %*% A

# Question 5.5
X1col <- rep(1,6)
X2col <- matrix(c(4,1,2,3,3,4), nrow = 6, ncol=1)
X <- cbind(X1col, X2col)
Y <- matrix(c(16, 5, 10, 15, 13, 22), nrow=6, ncol=1)

t(Y) %*% Y

XiX = t(X) %*% X
XiY = t(X) %*% Y
bCoeffs = ginv ( XiX ) %*%  XiY

# Question 5.14
YCoeffs <- matrix(c(4,2,7,3), nrow=2, ncol=2)
RHS <- matrix(c(25,12), nrow=2)
Y <- ginv(YCoeffs) %*% RHS
