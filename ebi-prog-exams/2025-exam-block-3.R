
#############
# 2025 Exam #
# Block 3   #
#############

df <- read.csv("sales-oct-2025.csv")

# Q10
df$date <- as.Date(df$date, format = "%m/%d/%y")

# Q11
df$sales[df$day_of_week %in% c("Sat", "Sun")] <- NA
df$sales <- as.numeric(df$sales)
df <- na.omit(df)
