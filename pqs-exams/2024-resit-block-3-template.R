
snr <- 1234567  # replace with your own student number

# Read in the dataset:
df <- read.csv("global.csv")

#################
# Data cleaning #
#################
# ADD THE CORRECT DATA CLEANING COMMANDS UNDER EACH COMMENT BELOW

# Format the Date variable:


# Replace "missing" with NA in the variable Per.Capita:


# Convert the variable Per.Capita to numeric:


# Rename Per.Capita to carbon_per_capita:


# Convert all remaining variable names to lower case:


# Perform the checks:
nrow(df)
mean(df$carbon)
summary(df$carbon_per_capita)
