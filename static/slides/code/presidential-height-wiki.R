library(tidyverse)
library(rvest)


# get table
pres_heights = read_html("https://en.wikipedia.org/wiki/Heights_of_presidents_and_presidential_candidates_of_the_United_States#U.S._presidents_by_height_order")

pres_heights


pres_table = pres_heights %>% 
  html_table() %>% 
  pluck(5) %>% 
  janitor::clean_names()


write_csv(pres_table, file = "../files/presidential-heights.csv")
