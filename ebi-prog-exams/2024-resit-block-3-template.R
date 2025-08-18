
snr <- 1234567  # replace with your own student number

# Read in the dataset:
df <- read.csv("klm.csv")

#################
# Data cleaning #
#################
# ADD THE CORRECT DATA CLEANING COMMANDS UNDER EACH COMMENT BELOW

# Format the Date variable:

# Sort the data by Date ascending:

# Convert the variable Open to numeric:

# Drop any rows with missing data:

# Rename Close. to close:

# Rename Adj.Close.. to adj_close:

# Convert all remaining variable names to lower case:

# Perform the checks:
nrow(df)
mean(df$open)
mean(df$volume)

