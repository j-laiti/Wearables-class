## Plotting examples (Intro to R)
## Justin Laiti

# install packages if you don't have them already:
# install.packages("tidyverse")

# clear workspace
rm(list = ls())

# load packages
library(tidyverse)
library(magrittr)
library(lubridate)

## Section 1: read data
data <- read.csv('self_tracking_data.csv') #if the data isn't in the same location as the R code, you will need to include the full file location
#data$steps[] 

# wrangling data ----

# select
data %<>% select(timestamp, steps, resting_heart_rate, sleep_hours, weather)
data <- data %>% select(timestamp, steps, resting_heart_rate, sleep_hours, weather)

# filter
data %<>% filter(resting_heart_rate > 60)

# mutate to add a day of the week variable
data %<>% mutate(time = as.POSIXct(timestamp, format = "%Y-%m-%dT%H:%M:%S", tz = "GMT")) %>%
  select(-timestamp) %>%
  mutate(dow = wday(time, label = TRUE))

# create groups based on day of the week (dow)
# then, summarize the mean and std of steps in each group
summary <- data %>% group_by(dow) %>% summarize(count = n(), mean_steps = mean(steps), sd_steps = sd(steps))
sum(summary$count)
 
# tibble
tibble(summary)
 
 
# plotting data ----
 
# line plot
ggplot(data, aes(x = time, y = steps, color = resting_heart_rate)) +
  geom_point() +
  geom_line() +
  ggtitle("Figure 1: Line Plot") +
  theme(legend.position = 'top') +
  scale_x_datetime(name = "Date") +
  scale_y_continuous(name = "Steps") +
  scale_color_continuous(name = "Resting Heart Rate (bpm)") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank())
 
# bar plot
summary <- data %>% group_by(dow) %>% summarize(mean = mean(steps), sd = sd(steps))
 
ggplot(summary, aes(x = dow, y = mean)) +
  geom_bar(stat = "identity") +
  geom_errorbar(width = 0.3, aes(ymin = mean - sd, ymax = mean + sd)) +
  ggtitle("Figure 2: Bar Plot") +
  scale_x_discrete(name = "Day of the Week") +
  scale_y_continuous(name = "Steps") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank())
 
# bar plot by weather
summary_weather <- data %>% group_by(weather) %>% summarize(mean = mean(steps), sd = sd(steps))
 
ggplot(summary_weather, aes(x = weather, y = mean, fill = weather)) +
  geom_bar(stat = "identity") +
  geom_errorbar(width = 0.3, aes(ymin = mean - sd, ymax = mean + sd)) +
  ggtitle("Figure 3: Bar Plot by Weather") +
  scale_x_discrete(name = "Weather") +
  scale_y_continuous(name = "Steps") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank())
 
# scatter plot
ggplot(data, aes(x = sleep_hours, y = steps, color = weather)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = TRUE, color = "black", linetype = "dashed") +
  ggtitle("Figure 5: Scatter Plot") +
  scale_x_continuous(name = "Sleep (hours)") +
  scale_y_continuous(name = "Steps") +
  theme(legend.position = 'top') +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank())
 
# box plot
ggplot(data, aes(x = weather, y = steps, fill = weather)) +
  geom_boxplot() +
  ggtitle("Figure 6: Box Plot") +
  scale_x_discrete(name = "Weather") +
  scale_y_continuous(name = "Steps") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank())
 
# histogram
ggplot(data, aes(x = steps)) +
  geom_histogram(bins = 10, fill = "steelblue", color = "white") +
  ggtitle("Figure 7: Histogram") +
  scale_x_continuous(name = "Steps") +
  scale_y_continuous(name = "Count") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank())


# Other data wrangling
# gather, group, and summarize
data_long <- data %>% gather(feature, value, -c(time, dow, weather))
summary <- data_long %>% group_by(feature) %>% summarize(avg_value = mean(value), sd_value = sd(value))

# spread
data_wide <- data_long %>% spread(feature, value)
