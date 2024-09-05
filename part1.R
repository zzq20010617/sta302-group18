# First part that make a simulation with replacement
# Apply packages
library(tidyverse)
library(janitor)

simulated_data <-
  tibble(
    # Use 1 through to 338 to represent each division
    "Division" = 1:338,
    # Randomly pick an option, with replacement, 338 times
    "Party" = sample(
      x = c('Liberal','Conservative','Bloc Québécois','New Democratic','Green'),
      size = 338,
      replace = TRUE
    )
  )

simulated_data
