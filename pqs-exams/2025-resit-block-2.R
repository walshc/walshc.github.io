
##############
# 2025 Resit #
# Block 2    #
##############

df <- read.csv("sales-data-jan-2026.csv")

# Q5
median(df$sales)

# Q6(a)
df$revenue <- df$price * df$sales

# Q6(b)
sum(df$revenue[df$product == "Tape"])

# Q7
aggregate(sales ~ city, data = df, FUN = sum)

# Q8
library(reshape2)
dcast(df, city ~ product, value.var = "sales")
