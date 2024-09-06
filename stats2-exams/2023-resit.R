
##############
# Stats 2    #
# 2023 Resit #
##############

df <- read.csv("housing.csv")

# Q1: Obtain correlation:
cor(df$pop_growth, df$house_price)

# Estimate Model 1:
m1 <- lm(house_price ~ pop_growth, data = df)
summary(m1)

# Q5: Check range of population growth data for interpreting b_0:
summary(df$pop_growth)

# Q7: Get proportion of y-data left unexplained by the model:
1 - summary(m1)$r.squared

# Q8:
confint(m1, level = 0.95)

# Q9: Hypothesis test:
b_1 <- summary(m1)$coefficients["pop_growth", "Estimate"]
s_b_1 <- summary(m1)$coefficients["pop_growth", "Std. Error"]
(t <- (b_1 - 15) / s_b_1)
pt(t, m1$df.residual)

# Q10: Formal test for heteroskedasticity:
df$e2 <- m1$residuals^2
summary(lm(e2 ~ pop_growth, data = df))

# Estimate Model 2:
m2 <- lm(house_price ~ pop_growth + I(pop_growth^2), data = df)
summary(m2)

# Q12: Value of SSE:
m0 <- lm(house_price ~ 1, data = df)
anova(m0, m2)

# Q12: Critical value:
qf(0.95, 2, 247)

# Model 3:
randstad_provs <- c("Noord-Holland", "Zuid-Holland", "Utrecht")
df$randstad <- df$province %in% randstad_provs
# Check mean:
mean(df$randstad)

# Q14:
m3 <- lm(house_price ~ randstad, data = df)
summary(m3)

# Model 4:
m4 <- lm(house_price ~ pop_growth * randstad, data = df)
summary(m4)

# Q15: Interpreting model with interaction terms
coef(m4)[3] * 1000

# Q16: Interpreting model with interaction terms
(coef(m4)[2] + coef(m4)[4]) * 1000

# Q17: Prediction interval:
df_p <- data.frame(pop_growth = 4, randstad = TRUE)
predict(m4, df_p, interval = "predict", level = 0.90)

# Model 5:
df$gelderland <- df$province == "Gelderland"
df$limburg <- df$province == "Limburg"
m5 <- lm(house_price ~ pop_growth + randstad + gelderland + limburg, data = df)
summary(m5)

# Question 19: Partial F test:
m5r <- lm(house_price ~ pop_growth + randstad, data = df)  # reduced model
anova(m5r, m5)
qf(0.95, 2, 245)  # critical value
