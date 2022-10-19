# libraries
library(tidyverse)
library(fivethirtyeight)
library(gapminder)
library(ggcorrplot)
library(palmerpenguins)
library(juanr)
library(socviz)

# other data
penguins
movies
trade
elections
bonica
gapminder


# Correlations ------------------------------------------------------------



# switch out gapminder with a dataset you want below
penguins %>% 
  # correlation only works with numeric columns; keep only those
  select(where(is.numeric)) %>% 
  # the cor() function doesn't take NA; drop them all
  drop_na() %>% 
  # get the correlation
  cor() %>% 
  # plot the correlation
  ggcorrplot(lab = TRUE)



# Models ------------------------------------------------------------------


# data
organdata
?organdata


# plot


# run this code below to create function to calculate sum of squared residuals
line_of_best_fit = function(intercept, slope)
{
  sum_ssr = organdata %>% 
    select(donors, roads) %>% 
    drop_na() %>% 
    mutate(fit = intercept + slope*roads) %>% 
    mutate(residual = donors - fit) %>%
    mutate(squared_resid = residual^2) %>% 
    summarise(`Sum of squared residuals` = sum(squared_resid, na.rm = TRUE))
  
  return(sum_ssr)
}


## HERE: using the line_of_best_fit function, try out different intercepts and slopes
line_of_best_fit(intercept = 80, slope = -10)

