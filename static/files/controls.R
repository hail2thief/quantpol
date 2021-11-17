# libraries
library(tidyverse)
library(huxtable)



# fake fork template
fake_fork = tibble(south = sample(c(0, 1), size = 500, replace = TRUE), 
              waffle = rnorm(n = 500, mean = 20, sd = 4) + 10*south,
              divorce = rnorm(n = 500, mean = 20, sd = 2) + 8*south) 


# your work here


# fake pipe template
fake_pipe = tibble(x = rnorm(n = 200, mean = 10), 
                   z = rnorm(n = 200, mean = 10) + 8 * x, 
                   y = rnorm(n = 200, mean = 10) + 4 * z)


# fake collider template
fake_collider = tibble(x = rnorm(n = 100, mean = 10), 
                       y = rnorm(n = 100, mean = 10),
                       m = rnorm(n = 100, mean = 10) + 8 * x + 4 * y)