# R Activity Example
# Justin Laiti (March 25)

# Research question: Does weather impact step count? 
# (comparing step count to sunny/rainy days)

# clear workspace
rm(list = ls())

# load packages
library(tidyverse)

# predefined data, usually you would load your own spreadsheet of data here
data <- data.frame(
  steps = c(8200, 12400, 5100, 9800, 11000, 3200, 7600, 14500, 6300, 10200, 4500, 8900, 13100, 7200, 9500),
  weather = c("Sunny", "Rainy", "Cloudy", "Sunny", "Sunny", "Rainy", "Cloudy", "Sunny", "Rainy", "Cloudy", "Rainy", "Sunny", "Sunny", "Cloudy", "Rainy")
)

# scatter plot ("bad" example)
ggplot(data, aes(x = steps, y = weather, color = "red")) +
  geom_point() +
  scale_x_continuous(limits = c(2000,20000)) +
  labs(x = "", y = "")

# calculate summary metrics
data %<>% group_by(weather) # group data in order to use the summarize operation next
summary_data <- data %>% summarize(count = n(), mean = mean(steps), sd = sd(steps))
tibble(summary_data) # inspect it to make sure it's what you want!

# use summary metrics to create a bar chart with error bars ("better" example)
ggplot(summary_data, aes(x = weather, y = mean, fill = weather)) +
  geom_col() +
  geom_errorbar(width = 0.3, aes(ymin = mean - sd, ymax = mean + sd)) +
  ggtitle("Impact of Weather on Steps") +
  scale_x_discrete(name = "Weather") +
  scale_y_continuous(name = "Steps")

