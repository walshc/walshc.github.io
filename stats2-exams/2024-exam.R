
#############
#  Stats 2  #
# 2024 Exam #
#############

# Read in data:
df <- read.csv("rates.csv")

# Q1
cor(df$rate, df$ecb)

# Model 1
m1 <- lm(rate ~ ecb, data = df)
summary(m1)

# Q5
2 * coef(m1)[2]

# Q6
df$e <- m1$residuals
df$lag_e <- c(NA, df$e[1:(nrow(df)-1)])
aux <- lm(e ~ lag_e, data = df)
summary(aux)
qt(0.975, aux$df.residual)

# Model 2
m2 <- lm(rate_chg ~ ecb_chg_lag, data = df)
summary(m2)

# Q7
b_1 <- coef(summary(m2))["ecb_chg_lag", "Estimate"]
s_b_1 <- coef(summary(m2))["ecb_chg_lag", "Std. Error"]
(t <- (b_1 - 0.2) / s_b_1)
1 - pt(t, m2$df.residual)

# Q9
coef(m2)[2] * 0.75

# Q10
confint(m2, parm = "ecb_chg_lag", level = 0.99)

# Q12
1 - summary(m2)$r.squared

# Q13
df_p <- data.frame(ecb_chg_lag = -0.25)
predict(m2, df_p, interval = "prediction", level = 0.95) + 5.33

# Model 3
df$positive_chg <- df$ecb_chg_lag > 0
df$negative_chg <- df$ecb_chg_lag < 0
m3 <- lm(rate_chg ~ positive_chg + negative_chg, data = df)
summary(m3)

# Q14
m3r <- lm(rate_chg ~ 1, data = df)
anova(m3r, m3)
qf(0.95, 2, 111)

# Model 4
m4 <- lm(rate_chg ~ year + positive_chg + negative_chg, data = df)
summary(m4)

# Q18
m4r <- lm(rate_chg ~ year, data = df)
anova(m4r, m4)
