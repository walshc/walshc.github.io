snr <- 1234567  # replace with your own student number

# Read in the dataset:
df <- read.csv("admissions.csv")

#################
# Data cleaning #
#################
# ADD THE CORRECT DATA CLEANING COMMANDS UNDER EACH COMMENT BELOW

# Drop all rows containing NA values.
# You should be left with 127 observations.


# Drop all rows where Age is negative.
# You should be left with 122 observations.


# Drop all rows where Gender is equal to "".
# You should be left with 113 observations.


# Drop all rows where Admission.Test.Score is negative or larger than 100.
# You should be left with 111 observations.

 
# Drop all rows where the High.School.Percentage is negative or larger than 100.
# You should be left with 109 observations.


# Drop all rows where Admission.Status is equal to "".
# You should be left with 103 observations.


# Change the 5 variable names to: "age", "gender", "admission_test_score",
# "high_school", "admission_status".


# Check number of observations and mean of admission test score:
nrow(df)  # should equal 103
mean(df$admission_test_score)  # should equal 76.95146

#############
# Questions #
#############
# REPLACE 0 AFTER EACH ANSWER WITH THE RIGHT COMMAND BELOW

# Q11: In the cleaned dataset, what is the mean of the variable high_school?
a11 <- 0

# Q12: In the cleaned dataset, what is the acceptance rate of the university?
# That is, what proportion of observations have the admission status "Accepted"?
a12 <- 0

# Q13: In the cleaned dataset, what is the highest admission test score among
# applicants that are 17 years old?
a13 <- 0
