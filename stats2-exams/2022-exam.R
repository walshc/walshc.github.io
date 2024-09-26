
#############
# Stats 2   #
# 2022 Exam #
#############

df <- read.csv("petrol.csv")

# Q1: Obtain correlation:
cor(df$petrol, df$duty)

# Model 1:
m1 <- lm(petrol ~ duty, data = df)
summary(m1)

# Q3: Check range of duty for interpreting b_0:
summary(df$duty)

# Q5: Hypothesis test
b_1 <- coef(summary(m1))["duty", "Estimate"]
s_b_1 <- coef(summary(m1))["duty", "Std. Error"]
(t <- (b_1 - 0.5) / s_b_1)
qt(0.95, m1$df.residual)  # critical value

# Model 2:
m2 <- lm(petrol ~ oil, data = df)
summary(m2)

# Q7: Visually inspecting residuals:
library(ggplot2)
df$e <- m2$residuals
df$t <- 1:nrow(df)
ggplot(df, aes(t, e)) + geom_line()
ggplot(df, aes(oil, e)) + geom_point()
ggplot(df, aes(e)) + geom_histogram() +
  stat_function(fun = dnorm, args = list(mean = 0, sd = sd(df$e)))
# Note: Don't need to know how to do this histogram any more:

# Model 3:
m3 <- lm(petrol ~ duty + oil, data = df)
summary(m3)

# Q11: Confidence interval:
confint(m3, level = 0.95)

# Q14: F-test:
anova(lm(petrol ~ 1, data = df), m3)  # Get SSR
qf(0.95, 2, 119)  # Critical value

# Q15: Prediction interval:
df_p <- data.frame(oil = 106.09, duty = 0.359)
predict(m3, df_p, interval = "prediction", level = 0.95)

# Q16: Prediction:
df_p <- data.frame(oil = 122.20, duty = 0.6545)
predict(m3, df_p)

# Model 4:
df$t <- 1:nrow(df)
df$t_post <- ifelse(as.Date(df$date) > as.Date("2022-05-31"),
                    as.Date(df$date) - as.Date("2022-05-31"), 0)
m4 <- lm(petrol ~ duty + t + t_post, data = df)
summary(m4)

# Model 5:
m5 <- lm(petrol ~ duty + oil + t + t_post, data = df)
summary(m5)

# Q21: Partial F-test
anova(m3, m5)
qf(0.95, 2, 117)  # Critical value
