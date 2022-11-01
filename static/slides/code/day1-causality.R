library(tidyverse)


# alter the code below
fake_data = tibble(treatment = rnorm(n = 500, mean = 50, sd = 5), 
                       outcome = rnorm(n = 500, mean = 20000, sd = 4000) + 2000*treatment)
fake_data


# make the plot here