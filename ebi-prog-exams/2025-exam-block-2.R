
#############
# 2025 Exam #
# Block 2   #
#############

df <- read.csv("ranking-clicks.csv")

# Q5
median(df$price)

# Q6
sum(df$clicks[df$product_id == 1])

# Q7
library(ggplot2)
ggplot(df, aes(ranking, clicks, color = price)) + geom_point()

# Q8
aggregate(clicks ~ product_id, data = df, FUN = sum)

# Q9
library(reshape2)
dcast(df, product_id ~ week, value.var = "clicks")
