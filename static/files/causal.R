# libraries
library(tidyverse)



# make fake data
fake = tibble(x = rnorm(n = 100, mean = 10, sd = 2), 
              y = 2 * x)



# make a confounded relationship
tibble(south = sample(c(0, 1), size = 50, replace = TRUE), 
       waffle = rnorm(n = 50, mean = 20, sd = 4) + 10*south,
       divorce = rnorm(n = 50, mean = 20, sd = 2) + 8*south)