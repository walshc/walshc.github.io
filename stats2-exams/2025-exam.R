
#############
#  Stats 2  #
# 2025 Exam #
#############

# Read in data:
df <- read.csv("delhi_mumbai_flights.csv")

# Q1
cor(df$days_left, df$price)

# Model 1
m1 <- lm(price ~ days_left, data = df)
summary(m1)

# Q2
coef(m1)[2]

# Q3
df_p <- data.frame(days_left = 50)
predict(m1, df_p, interval = "confidence", level = 0.95)

# Q4
df$e <- m1$residuals
library(ggplot2)
ggplot(df, aes(days_left, e)) + geom_point()


# Q5
df$e2 <- m1$residuals^2
m_aux <- lm(e2 ~ days_left, data = df)
coef(summary(m_aux))["days_left", "Pr(>|t|)"]

# Model 2
df$within14 <- df$days_left <= 14
m2 <- lm(price ~ within14, data = df)
summary(m2)

# Q6
m0 <- lm(price ~ 1, data = df)
anova(m0, m1)
anova(m0, m2)

# Q7
confint(m2, level = 0.95)

# Model 3 and Q8
m3 <- lm(price ~ airline, data = df)
summary(m3)

# Q9
coef(m3)[1] + coef(m3)[5]

# Q10
b_2 <- coef(summary(m3))["airlineGO_FIRST", "Estimate"]
s_b_2 <- coef(summary(m3))["airlineGO_FIRST", "Std. Error"]
t <- (b_2 + 2) / s_b_2
pt(t, m3$df.residual)

# Model 4
m4 <- lm(price ~ within14 + airline, data = df)
summary(m4)

# Q11
anova(m2, m4)
qf(0.95, 5, 5163)

# Model 5 and Q12
m5 <- lm(price ~ within14 * source_city, data = df)
summary(m5)

# Q13
coef(m5)[2]

# Q14
coef(m5)[2] + coef(m5)[4]
