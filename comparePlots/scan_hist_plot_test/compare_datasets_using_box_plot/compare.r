carrots1=scan("Babycarrots.txt")
carrots2 = scan("Regularcarrots.txt")
boxplot(carrots1, carrots2, names =c("Baby Carrots", "Regular Carrots"), col = c("red", "blue"), main = "Box Plot by Carrot Type")

