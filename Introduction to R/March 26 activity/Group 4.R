# R Activity March 26
# Group 4

# Guidelines reminder:
# Choose the right plot type for your data and question
# Axes should start at zero (for bar charts) or be clearly labeled if not
# Use color intentionally
# Don't truncate or cherry-pick data to change trends
# Clearly label everything (axes, units, legend, title)

# Research question: How does the daily temperature impact in-person class attendance percentage?

# clear workspace
rm(list = ls())

# import tidyverse to use ggplots functions
library(tidyverse)

# predefined data 
# (normally you would import you own csv here, but it's prepopulated for the purpose of the assignment)
data <- data.frame(
  temperature = c(28, 35, 42, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 38, 72),
  attendance_pct = c(45, 55, 65, 78, 82, 90, 95, 92, 88, 82, 75, 68, 60, 58, 90)
)

## Add edits below ##
# "Bad" ggplot:



# "Better ggplot:
