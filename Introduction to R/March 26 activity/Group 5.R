# R Activity March 26
# Group 5

# Guidelines reminder:
# Choose the right plot type for your data and question
# Axes should start at zero (for bar charts) or be clearly labeled if not
# Use color intentionally
# Don't truncate or cherry-pick data to change trends
# Clearly label everything (axes, units, legend, title)

# Research question: How does average daily screen time correspond to daily step counts?

# clear workspace
rm(list = ls())

# import tidyverse to use ggplots functions
library(tidyverse)

# predefined data 
# (normally you would import you own csv here, but it's prepopulated for the purpose of the assignment)
data <- data.frame(
  screen_time_hrs = c(2, 8, 4, 10, 3, 7, 5, 9, 1, 6, 11, 4, 8, 3, 6),
  steps = c(13500, 4200, 10800, 3100, 12000, 5500, 8900, 3800, 14200, 7200, 2800, 11000, 4800, 12500, 6800)
)

## Add edits below ##
# "Bad" ggplot:



# "Better ggplot:
