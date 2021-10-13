# libraries
library(tidyverse)
library(vdemdata)

# find the variable you want
corrupt_key = find_var("gdp")


# get the variable
foo = vdem %>% 
  select(country_name, country_id, 
         year, e_ti_cpi, e_migdppc) %>% 
  # data is missing before 2012
  filter(year >= 2012)
