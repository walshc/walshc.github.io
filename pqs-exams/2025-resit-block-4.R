
##############
# 2025 Resit #
# Block 4    #
##############

f <- function(x) {
  y <- -10 - 4*x + 2 * x^2
  return(y)
}

# Q12
library(ggplot2)
x <- seq(-3, 5, length.out = 2000)
y <- f(x)
df <- data.frame(x, y)
ggplot(df, aes(x, y)) + geom_line()

# Q13
optimize(f, c(-100, 100), maximum = FALSE)
