
##############
# 2025 Resit #
# Block 2    #
##############

# Q5
df <- read.csv("sales-data-dec-2025.csv")
mean(df$sales)

# Q6
df$revenue <- df$price * df$sales
sum(df$revenue[df$product == "Chair"])

# Q7
aggregate(sales ~ product, data = df, FUN = sum)

# Q8
library(reshape2)
dcast(df, city ~ product, value.var = "sales")
