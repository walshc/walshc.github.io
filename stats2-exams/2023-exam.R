
#############
#  Stats 2  #
# 2023 Exam #
#############

# Read in data:
df <- read.csv("ceosal.csv")

# Q1: Obtain correlation :
cor(df$salary, df$sales)

# Q3: Obtain covariance:
cov(df$salary, df$ceoten)

# Estimate model for Block 2:
m1 <- lm(salary ~ sales, data = df)
summary(m1)

# Q7: Check if there are any values of sales at or near zero:
summary(df$sales)

# Q8: Plot histogram of residuals (note: not required to do any more):
df$residuals <- m1$residuals
library(ggplot2)
ggplot(df, aes(residuals)) + geom_histogram()

# Q9: Run formal test for heteroskedasticity:
df$e2 <- m1$residuals^2
summary(lm(e2 ~ sales, data = df))

# Estimate model for Block 3:
m2 <- lm(salary ~ profits, data = df)
summary(m2)

# Q10: Do hypothesis test:
b_1 <- coef(summary(m2))["profits", "Estimate"]
s_b_1 <- coef(summary(m2))["profits", "Std. Error"]
(t <- (b_1 - 1) / s_b_1)
1 - pt(t, m2$df.residual)

# Q11: Obtain confidence intervals:
confint(m2, level = 0.95)

# Estimate model for Block 4:
m3 <- lm(salary ~ grad * sales, data = df)
summary(m3)

# Estimate model for Block 5:
m4 <- lm(salary ~ sales + mktval + comten + ceoten, data = df)
summary(m4)

# Q18: Estimate reduced model and perform partial F-test:
m4r <- lm(salary ~ sales + mktval, data = df)
anova(m4r, m4)

# Q19: Obtain confidence interval for particular values:
df_p <- data.frame(sales = 1000, mktval = 1500, comten = 20, ceoten = 8)
predict(m4, df_p, interval = "confidence", level = 0.95)
