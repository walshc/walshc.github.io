
##############
# Stats 2    #
# 2022 Resit #
##############

df <- read.csv("petrol2.csv")

# Q1
cor(df$pricechange, df$competition)

# Q3
cor(df$pricechange, df$population)
library(ggplot2)
ggplot(df, aes(population, pricechange)) + geom_point()

# Model 1
m1 <- lm(pricechange ~ population, data = df)
summary(m1)

# Q4
coef(m1)[2]

# Q5
- coef(m1)[1] * 100

# Q6
df$e <- m1$residuals
ggplot(df, aes(population, e)) + geom_point()

# Model 2
m2 <- lm(pricechange ~ competition + border + population + highway, data = df)
summary(m2)

# Q7
summary(m2)$r.squared

# Q8
1 - summary(m2)$r.squared

# Q9
summary(m2)$fstatistic
qf(0.95, 4, 995)

# Q10
confint(m2, parm = "highway", level = 0.9)

# Q11
(t <- coef(summary(m2))["highway", "t value"])  # test statistic
1 - pt(t, 995)  # p-value

# Q13
df_p <- data.frame(population = 0.01, highway = 0, competition = 0, border = 1)
predict(m2, df_p, interval = "prediction", level = 0.9) + 2

# Model 3
m3 <- lm(pricechange ~ competition + border + population * highway, data = df)
summary(m3)

# Q14
coef(m3)[6]

# Q15
coef(m3)[5]

# Q16
coef(m3)[5] + 0.5 * coef(m3)[6]

# Model 4
m4 <- lm(pricechange ~ competition + border + population + highway +
           aral + shell + esso + totalenergies, data = df)
summary(m4)

# Q18
m4r <- lm(pricechange ~ competition + border + population + highway, data = df)
anova(m4r, m4)
