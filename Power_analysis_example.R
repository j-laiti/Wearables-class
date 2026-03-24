# Example power analysis

# Install the pwr package the first time running this code (uncomment the line below)
install.packages("pwr")

# clear workspace
rm(list = ls())

# Load the library
library(pwr)

# Run the power analysis (specific function for t-test)
# Explore other pwr functions based on your study type
result <- pwr.t.test(
  d = 0.67,             # estimated effect size
  sig.level = 0.05,     # alpha
  power = 0.80,         # desired power/probability of detecting an effect
  type = "paired",      # paired t-test
  alternative = "two.sided"  # we're testing for any difference
)

# View the result
# In this example, n indicated the number of participants required
print(result)
