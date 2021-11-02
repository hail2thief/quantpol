# libraries
library(tidyverse)



# make fake data
fake = tibble(x = rnorm(n = 100, mean = 10, sd = 2), 
              y = 2 * x)

