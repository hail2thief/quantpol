library(tidyverse) # load the tidyverse
library(nycflights13) # load the nycflights data


# learn about data
?flights

# look at data
View(flights)


# look at flights from February
flights %>% 
  filter(month == 2)


# now let's look at flights on February 14th
## How would you do this with one call to filter?
flights %>% 
  filter(month == 2) %>% 
  filter(day == 14)



## Now let's look at flights scheduled to depart between 1pm and 130pm
## How would you do this with one call to filter?



## Now let's look at flights going to ATL or SFO
flights %>% 
  filter(dest == "ATL" | dest == "SFO")



# How many flights arrived late on Christmas Day?
## What was the latest flight?



## plot a histogram of late flights, faceted by carrier


# How many flights arrived early on Thanksgiving?
## How early was the earliest flight?



# Exercise: student creatively describes flight, we try to find it, 




# mutate ------------------------------------------------------------------


## convert arr_delay to hours


## convert distance between airports to thousands of miles


## case_when: create new variable, arrival_status that tells you
## if flight arrived early, on time, or late


## case_when: create new variable, how_late that tells you
## if flight was not late, a bit late, somewhat late, Spirit Airlines late




# summary -----------------------------------------------------------------


## on average, how long are planes spending in the air?


# on average, how long are planes traveling?


# look at the four numbers: min, max, mean, median for air_time
## convert these to hours so they are interpretaable
