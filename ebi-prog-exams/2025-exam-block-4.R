
#############
# 2025 Exam #
# Block 4   #
#############

# Q12
f <- function(x) {
  y <- 10 + 4*x - 2 * x^2
  return(y)
}

library(ggplot2)
x <- seq(-3, 5, length.out = 2000)
y <- f(x)
df <- data.frame(x, y)
ggplot(df, aes(x, y)) + geom_line()

# Q13
f_max <- optimize(f, c(-100, 100), maximum = TRUE)
f_max$maximum

# Q14
f_max$objective

