
# Statistics 2 Resit January 2026

df <- read.csv("employee-satisfaction.csv")

# Q1
cov(df$y, df$num_projects)

# Model 1
m1 <- lm(y ~ promotion, data = df)
summary(m1)

# Q2
coef(m1)[2]

# Q3
confint(m1, parm = "promotion", level = 0.99)

# Q4
sum(coef(m1)[1:2])

# Q5
b_1 <- coef(summary(m1))[2, 1]
s_b_1 <- coef(summary(m1))[2, 2]
(t <- (b_1 - 0.02) / s_b_1)
1 - pt(t, 14997)

# Model 2
m2 <- lm(y ~ num_projects + I(num_projects^2), data = df)
summary(m2)

# Q6
df_p <- data.frame(num_projects = 3)
predict(m2, df_p, interval = "confidence", level = 0.95)

# Q7
df_p <- data.frame(num_projects = 2:7)
df_p$y <- predict(m2, df_p)
df_p

# Q8
df$e2 <- m2$residuals^2
aux <- lm(e2 ~ num_projects + I(num_projects^2), data = df)
summary(aux)

# Model 3
m3 <- lm(y ~ salary, data = df)
summary(m3)

# Q9
coef(m3)[1]
coef(m3)[2]
coef(m3)[2] - coef(m3)[3]

# Q10
qf(0.95, 2, 14996)

# Model 4
m4 <- lm(y ~ promotion + salary, data = df)
summary(m4)

# Q13
qf(0.95, 2, 14995)
