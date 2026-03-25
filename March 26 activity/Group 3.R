# R Activity March 26
# Group 3

# Guidelines reminder:
# Choose the right plot type for your data and question
# Axes should start at zero (for bar charts) or be clearly labeled if not
# Use color intentionally
# Don't truncate or cherry-pick data to change trends
# Clearly label everything (axes, units, legend, title)

# Research question: How does the class attendance poll completion percentage relate to average sleep duration?

# clear workspace
rm(list = ls())

# import tidyverse to use ggplots functions
library(tidyverse)

# predefined data 
# (normally you would import you own csv here, but it's prepopulated for the purpose of the assignment)
data <- data.frame(
  poll_completion = c(95, 40, 85, 30, 70, 25, 90, 50, 35, 80, 20, 75, 45, 60, 55),
  avg_sleep_hours = c(5.2, 8.5, 5.8, 9.0, 6.5, 9.2, 5.5, 7.8, 8.8, 6.0, 9.5, 6.2, 7.5, 7.0, 7.2)
)

## Add edits below ##
# "Bad" ggplot:



# "Better ggplot:
