# load libraries
library(tidyverse)
library(nycflights13)
library(socviz)


# make a smaller version of the flights dataset
flights_small = 
  flights %>% 
  select(month, day, dep_time, sched_dep_time, arr_time, sched_arr_time, 
         origin, dest, air_time, distance)



# do your work here!


# elections data
elections = read_csv("https://www.dropbox.com/s/kysv19u2m91e6gr/elections.csv?dl=1")



# do your work here!