
#####################
# 2026 Exam Block 3 #
#####################

df <- read.csv("yield-curves.csv")

# Q7
df$date <- as.Date(df$date, format = "%m/%d/%y")

# Q8
df$maturity <- ifelse(df$duration == "year(s)", df$term * 12, df$term)

# Q9
df <- df[, c("date", "maturity", "yield")]

# Q10
mean(df$yield)

# Q11
max(df$yield[df$maturity == 12])

# Q12
aggregate(yield ~ date, FUN = mean, data = df)

# Q13
library(ggplot2)
ggplot(df, aes(maturity, yield, color = factor(date))) + geom_line()

# Q14
library(reshape2)
wide <- dcast(df, maturity ~ date, value.var = "yield")

# Q15
wide$change_2026 <- wide[, 4] - wide[, 3]
