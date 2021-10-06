# load libraries
library(tidyverse)
library(nycflights13)


# make a smaller version of the flights dataset
flights_small = 
  flights %>% 
  select(month, day, dep_time, sched_dep_time, arr_time, sched_arr_time, 
         origin, dest, air_time, distance)



# do your work here!





# elections data
elections = read_rds(url("https://www.dropbox.com/s/2ne4v0yhfgnw1wd/elections.rds?dl=1"))



# do your work here!