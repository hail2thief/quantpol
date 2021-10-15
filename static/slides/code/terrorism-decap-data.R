library(tidyverse)
library(haven)


# terrorism data
df = haven::read_dta("data/MiltonPrice_II_Final.dta") 

df %>% 
  select(name, year, failure, allies, size, religious, ethnic, decap, 
         latamerica, ssafrica, meast, asia)
