## Plotting examples (Intro to R - March 26)
## Justin Laiti

# install packages if you don't have them already:
# install.packages("tidyverse")

# clear workspace
rm(list = ls())

# load packages
library(tidyverse)
library(magrittr)
library(lubridate)

## Step 1: Read data
data <- read.csv('data/self_tracking_data.csv') #if the data isn't in the same location as the R code, you will need to include the full file location

## Step 2: Inspect/explore the data
tibble(data) 
data$steps 
summary(data)

## Step 3 wrangling data

# select specific columns
data %>% select(timestamp, steps, weather)
steps_and_weather_data <- data %>% select(timestamp, steps, weather) # <- and = both assign a new value

# overwrite the data with %<>% 
data %<>% select(timestamp, steps, resting_heart_rate, sleep_hours, weather)
# data <- data %>% select(timestamp, steps, resting_heart_rate, sleep_hours, weather) #this does the same thing

# filter
data %<>% filter(resting_heart_rate > 60)

# mutate to add a day of the week variable
data %<>% mutate(time = as.POSIXct(timestamp, format = "%Y-%m-%dT%H:%M:%S", tz = "GMT")) %>%
  select(-timestamp) %>%
  mutate(dow = wday(time, label = TRUE))

# create groups based on day of the week (dow)
# then, summarize the mean and std of steps in each group
grouped_data <- data %>% group_by(dow) 
daily_step_summary_data <- grouped_data %>% summarize(count = n(), mean_steps = mean(steps), sd_steps = sd(steps))
 
# inspect data again
tibble(daily_step_summary_data)
 
 
# Step 4: plotting data

# general ggplot formula:
# ggplot(YOUR_DATA, aes(x = X_VARIABLE, y = Y_VARIABLE, other asethetic options))  # data & aesthetics
#   geom_point() / geom_line() / geom_bar() / geom_boxplot() +     # plot type
#   ggtitle("Title") +                                             # labels
#   scale_x_continuous(name = "X Label") +                         # axis formatting
#   theme(...)                                                     # styling
 
# line plot
ggplot(data, aes(x = time, y = steps, color = resting_heart_rate)) +
  geom_point() +
  geom_line() +
  ggtitle("Line Plot") +
  theme(legend.position = 'top') +
  scale_x_datetime(name = "Date") +
  scale_y_continuous(name = "Steps") +
  scale_color_continuous(name = "Resting Heart Rate (bpm)") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank())
 
# bar plot
ggplot(daily_step_summary_data, aes(x = dow, y = mean_steps)) +
  geom_bar(stat = "identity") +
  geom_errorbar(width = 0.3, aes(ymin = mean_steps - sd_steps, ymax = mean_steps + sd_steps)) +
  ggtitle("Bar Plot") +
  scale_x_discrete(name = "Day of the Week") +
  scale_y_continuous(name = "Steps") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank())
 
# scatter plot
ggplot(data, aes(x = sleep_hours, y = steps, color = weather)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = TRUE, color = "black", linetype = "dashed") +
  ggtitle("Scatter Plot") +
  scale_x_continuous(name = "Sleep (hours)") +
  scale_y_continuous(name = "Steps") +
  theme(legend.position = 'top') +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank())
 
# box plot
ggplot(data, aes(x = weather, y = steps, fill = weather)) +
  geom_boxplot() +
  ggtitle("Box Plot") +
  scale_x_discrete(name = "Weather") +
  scale_y_continuous(name = "Steps") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank())
 
# histogram
ggplot(data, aes(x = steps)) +
  geom_histogram(bins = 10, fill = "steelblue", color = "white") +
  ggtitle("Histogram") +
  scale_x_continuous(name = "Steps") +
  scale_y_continuous(name = "Count") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank())
