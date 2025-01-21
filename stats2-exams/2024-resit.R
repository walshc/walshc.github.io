
#######################
# 30J211 Statistics 2 #
# 2024 Resit          #
#######################

df <- read.csv("toyota-corolla.csv")

# Q1
cor(df$odometer, df$price)

# Q2
cor(df$age, df$price)

###########
# Model 1 #
###########
m1 <- lm(price ~ odometer, data = df)
summary(m1)

# Q4
coef(m1)[["odometer"]]

# Q5
coef(m1)[["odometer"]] * (90000 - 100000)

# Q6
df$e2 <- m1$residuals^2
summary(lm(e2 ~ odometer, data = df))

###########
# Model 2 #
###########
m2 <- lm(price ~ odometer + age, data = df)
summary(m2)

# Q7
-coef(m2)["age"]

# Q8
confint(m2, parm = "odometer", level = 0.99)

# Q9
summary(m2)$fstatistic
qf(0.95, 2, 854)

# Q10
b_1 <- coef(summary(m2))["odometer", "Estimate"]
s_b_1 <- coef(summary(m2))["odometer", "Std. Error"]
(t <- (b_1 + 0.04) / s_b_1)
pt(t, m2$df.residual)

###########
# Model 3 #
###########
m3 <- lm(price ~ odometer * age, data = df)
summary(m3)

# Q11
coef(m3)[4]

# Q12
coef(m3)["odometer"]

# Q13
coef(m3)["odometer"] + coef(m3)["odometer:age"] * 10

###########
# Model 4 #
###########
m4 <- lm(price ~ odometer + age + state_fl + state_ny + state_tx, data = df)
summary(m4)

# Q15
coef(summary(m4))[2:5, 4] < 0.01

# Q16
coef(m4)["state_ny"] - coef(m4)["state_tx"]

# Q17
df_p <- data.frame(age = 10, odometer = 100000, state_fl = 0,
                   state_ny = 0, state_tx = 1)
predict(m4, df_p, interval = "prediction", level = 0.95)

# Q18
anova(m2, m4)
qf(0.95, 3, 851)
