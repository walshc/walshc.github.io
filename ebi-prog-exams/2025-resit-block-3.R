
##############
# 2025 Resit #
# Block 3    #
##############

# Q9a
df1 <- read.csv("ice-cream-sales-2025.csv")
df1$date <- as.Date(df1$date, format = "%d/%m/%y")

# Q9b
df1 <- df1[df1$day_of_week != "Mon", ]

# Q9c
df1$sales <- as.numeric(df1$sales)

# Q9d
df1$weekend <- df1$day_of_week %in% c("Sat", "Sun")

# Q9e
df2 <- read.csv("temperature-2025.csv")
df2$date <- as.Date(df2$date, format = "%Y-%m-%d")

# Q9f
df <- merge(df1, df2, by = "date")

# Q10
mean(df$sales[df$weekend & df$temp >= 30])

# Q11
library(ggplot2)
ggplot(df, aes(temp, sales, color = weekend)) + geom_point()
