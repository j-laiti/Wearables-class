# R Activity March 26
# Group 7

# Guidelines reminder:
# Choose the right plot type for your data and question
# Axes should start at zero (for bar charts) or be clearly labeled if not
# Use color intentionally
# Don't truncate or cherry-pick data to change trends
# Clearly label everything (axes, units, legend, title)

# Research question: How does GPA correspond to weekly exercise (hours)?

# clear workspace
rm(list = ls())

# import tidyverse to use ggplots functions
library(tidyverse)

# predefined data 
# (normally you would import you own csv here, but it's prepopulated for the purpose of the assignment)
data <- data.frame(
  gpa = c(3.8, 2.5, 3.2, 2.0, 3.5, 2.8, 3.9, 2.3, 3.0, 3.6, 2.1, 3.4, 2.7, 3.1, 2.9),
  exercise_hrs = c(6, 2, 5, 1.5, 5.5, 3, 7, 1, 4, 6.5, 1, 4.5, 3.5, 4, 3)
)
## Add edits below ##
# "Bad" ggplot:



# "Better ggplot:
