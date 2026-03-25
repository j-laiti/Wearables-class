# R Activity March 26
# Group 1

# Guidelines reminder:
# Choose the right plot type for your data and question
# Axes should start at zero (for bar charts) or be clearly labeled if not
# Use color intentionally
# Don't truncate or cherry-pick data to change trends
# Clearly label everything (axes, units, legend, title)

# Research question: Do VT football wins increase students step counts?

# clear workspace
rm(list = ls())

# import tidyverse to use ggplots functions
library(tidyverse)

# predefined data 
# (normally you would import you own csv here, but it's preloaded for the purpose of the assignment)
data <- data.frame(
  game_outcome = c("Win", "Loss", "Win", "Win", "Loss", "Win", "Loss", "Loss", "Win", "Loss", "Win", "Win", "Loss", "Win", "Loss"),
  steps = c(14200, 8100, 12800, 15500, 7600, 13400, 9200, 6800, 14800, 8500, 11900, 16000, 7200, 13100, 8800)
)

## Add edits below ##
# "Bad" ggplot:



# "Better ggplot:

