

df <- read.csv("amsterdam-house-prices.csv")

# Q1
cor(df$area, df$price)

# Model 1:
m1 <- lm(price ~ area, data = df)
summary(m1)

# Q4
df$e <- m1$residuals
library(ggplot2)
ggplot(df, aes(area, e)) + geom_point()

# Model 2:
m2 <- lm(price ~ bedrooms, data = df)
summary(m2)

# Q6
df$e_squared <- m2$residuals^2
aux <- lm(e_squared ~ bedrooms, data = df)
summary(aux)

# Model 3
m3 <- lm(price ~ area + bedrooms, data = df)
summary(m3)

# Q7
1 - summary(m3)$r.squared

# Q8
b2 <- coef(summary(m3))[3, 1]
sb2 <- coef(summary(m3))[3, 2]
t <- (b2 + 40) / sb2
pval <- pt(t, 858)

# Q9
df_p <- data.frame(area = 80, bedrooms = 3)
predict(m3, df_p, interval = "confidence", level = 0.95)

# Model 4
m4 <- lm(price ~ neighborhood, data = df)
summary(m4)

# E[Y|E,N,S,W]=beta0 + beta1*E + beta2*N + beta3*S + beta4*W
# E[Y|E=0,N=0,S=0,W=0]=beta0
# E[Y|E=1,N=0,S=0,W=0]=beta0 + beta1
# beta1 = E[Y|E=1,N=0,S=0,W=0] - E[Y|E=0,N=0,S=0,W=0]
# beta1 = p^East - p^Central

m0 <- lm(price ~ 1, data = df)
anova(m0, m4)

qf(0.95, 4, 856)

# Model 5
m5 <- lm(price ~ area * bedrooms, data = df)
summary(m5)

# Q14
confint(m5, level = 0.95)

# Q15
# E[Y|area,bedrooms] = beta0 + beta1*area + beta2*bedrooms + beta3*area*bedrooms
# E[Y|area,bedrooms=1] = beta0 + beta1*area + beta2 + beta3*area
#                      = (beta0 + beta2) + (beta1 + beta3)*area
# E[Y|area+1,bedrooms=1] = (beta0 + beta2) + (beta1 + beta3)*(area + 1)

# E[Y|area+1,bedrooms=1] - E[Y|area,bedrooms=1] = (beta1 + beta3)
1000*(coef(m5)[2] + coef(m5)[4])

# Q16
# E[Y|area=100,bedrooms] = beta0 + beta1*100 + beta2*bedrooms + beta3*100*bedrooms
#                        = (beta0 + beta1*100) + (beta2 + 100*beta3)*bedrooms

# E[Y|area=100,bedrooms+1] = (beta0 + beta1*100) + (beta2 + 100*beta3)*(bedrooms+1)

# Differences: (beta2 + 100*beta3)

1000*(coef(m5)[3] + 100 * coef(m5)[4])


