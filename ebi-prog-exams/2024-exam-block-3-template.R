
snr <- 1234567  # replace with your own student number

# Read in the dataset:
df <- read.csv("rates.csv")

#################
# Data cleaning #
#################
# ADD THE CORRECT DATA CLEANING COMMANDS UNDER EACH COMMENT BELOW

# Convert all variable names to lower case.

# Format the date variable to a date.

# Drop all rows that contain any missing data.

# Convert rate to numeric.

# Convert ecb to numeric

# Check mean of rate and ecb:
mean(df$rate)
mean(df$ecb)

#############
# Questions #
#############
# REPLACE 0 AFTER EACH ANSWER WITH THE RIGHT COMMAND BELOW

# Q11: What is the median of the rate variable?
a11 <- 0

# Q12: Create a variable called spread which is the rate variable minus the ecb
# variable. What is the mean of this variable?
a12 <- 0

# Q13: What is the average of the rate variable when the ecb variable is
# negative?
a13 <- 0
