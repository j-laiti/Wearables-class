# R Activity March 26
# Group 8

# Guidelines reminder:
# Choose the right plot type for your data and question
# Axes should start at zero (for bar charts) or be clearly labeled if not
# Use color intentionally
# Don't truncate or cherry-pick data to change trends
# Clearly label everything (axes, units, legend, title)

# Research question: How does mood impact EDA amplitude?

# clear workspace
rm(list = ls())

# import tidyverse to use ggplots functions
library(tidyverse)

# predefined data 
# (normally you would import you own csv here, but it's prepopulated for the purpose of the assignment)
data <- data.frame(
  mood = c("Happy", "Stressed", "Calm", "Stressed", "Happy", "Anxious", "Calm", "Anxious", "Happy", "Stressed", "Calm", "Anxious", "Happy", "Stressed", "Calm"),
  eda_amplitude = c(1.2, 4.8, 0.8, 5.2, 1.5, 3.9, 0.6, 4.1, 1.0, 4.5, 0.9, 3.7, 1.3, 5.0, 0.7)
)

## Add edits below ##
# "Bad" ggplot:



# "Better ggplot:
