
#####################
# 2026 Exam Block 4 #
#####################

# Q16
f <- function(x) {
  18 + 12 * x - 2*x^2
}
x <- seq(-2, 8, length.out = 200)
plot_df <- data.frame(x = x, y = f(x))
ggplot(plot_df, aes(x, y)) + geom_line()

# Q17
optimize(f, interval = c(-2, 8), maximum = TRUE)
