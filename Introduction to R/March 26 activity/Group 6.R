# R Activity March 26
# Group 6

# Guidelines reminder:
# Choose the right plot type for your data and question
# Axes should start at zero (for bar charts) or be clearly labeled if not
# Use color intentionally
# Don't truncate or cherry-pick data to change trends
# Clearly label everything (axes, units, legend, title)

# Research question: How does daily homework time correspond to caffeine intake?

# clear workspace
rm(list = ls())

# import tidyverse to use ggplots functions
library(tidyverse)

# predefined data 
# (normally you would import you own csv here, but it's prepopulated for the purpose of the assignment)
data <- data.frame(
  homework_hrs = c(1, 4, 2, 6, 3, 5, 1.5, 7, 2.5, 4.5, 6.5, 3.5, 5.5, 2, 8),
  caffeine_mg = c(80, 250, 100, 320, 180, 280, 90, 400, 120, 240, 350, 200, 300, 95, 450)
)

## Add edits below ##
# "Bad" ggplot:



# "Better ggplot:
