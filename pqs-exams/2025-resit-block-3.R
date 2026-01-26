
##############
# 2025 Resit #
# Block 3    #
##############

# Q9a
df <- read.csv("AHOLD DEL_historical_price.csv", skip = 3)

# Q9b
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# Q9c
df <- df[order(df$Date), ]

# Q9d
df$spread <- df$High - df$Low

# Q9e
names(df) <- tolower(names(df))

# Q10
library(ggplot2)
ggplot(df, aes(number.of.trades, spread)) + geom_point()

# Q11
ggplot(df, aes(date, close)) + geom_line()
