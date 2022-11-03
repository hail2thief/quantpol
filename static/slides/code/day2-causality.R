library(tidyverse)


# alter the code below
fake_data = tibble(confound = sample(c(0, 1), size = 500, replace = TRUE), 
                   treatment = rnorm(n = 500, mean = 20, sd = 4) + 10 * confound,
                   outcome = rnorm(n = 500, mean = 20, sd = 2) + 8 * confound)
fake_data


# make the plot here