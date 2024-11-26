
snr <- 1234567  # replace with your own student number

# Read in the dataset:
df <- read.csv("euro-dollar-2022.csv")

#################
# Data cleaning #
#################
# ADD THE CORRECT DATA CLEANING COMMANDS UNDER EACH COMMENT BELOW

# Format the date:

# Format is MM/DD/YY (year without century):

# Order by date:

# Drop observations with missing data:

# Convert prices data to numeric:

# Convert volume to numeric:

# Convert Change numeric:

# Convert variable names to lower case:

# Check mean of high and vol:
mean(df$high)
mean(df$vol)

#############
# Questions #
#############
# REPLACE 0 AFTER EACH ANSWER WITH THE RIGHT COMMAND BELOW

# Q11: Create a variable called hml which is the high variable minus the low
# variable. What is the mean of this variable?
a11 <- 0

# Q12: What is the median of the vol variable?
a12 <- 0

# Q13: What was the largest negative daily price change in the data?
a13 <- 0

# Q14: On which date was the largest volume traded?
a14 <- 0