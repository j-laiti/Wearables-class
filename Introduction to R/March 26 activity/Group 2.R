# R Activity March 26
# Group 2

# Guidelines reminder:
# Choose the right plot type for your data and question
# Axes should start at zero (for bar charts) or be clearly labeled if not
# Use color intentionally
# Don't truncate or cherry-pick data to change trends
# Clearly label everything (axes, units, legend, title)

# Research question: How does number of classes credits taken correlate to student stress?

# clear workspace
rm(list = ls())

# import tidyverse to use ggplots functions
library(tidyverse)

# predefined data
# (normally you would import you own csv here, but it's preloaded for the purpose of the assignment)
data <- data.frame(
  credits = c(12, 14, 16, 18, 15, 13, 17, 19, 12, 16, 18, 14, 15, 17, 13),
  stress = c("Low", "Low", "Medium", "High", "Medium", "Low", "High", "High", "Low", "Medium", "High", "Medium", "Low", "High", "Medium")
)

## Add edits below ##
# "Bad" ggplot:



# "Better ggplot:

