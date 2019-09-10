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
flights %>% 
  filter(sched_dep_time >= 1300 & sched_dep_time <= 1330)


## Now let's look at flights going to ATL or SFO
flights %>% 
  filter(dest == "ATL" | dest == "SFO")



# How many flights arrived late on Christmas Day?
## What was the latest flight?
flights %>% 
  filter(month == 12) %>% 
  filter(day == 25) %>% 
  filter(arr_delay > 0) %>% 
  arrange(arr_delay)


## plot a histogram of late flights, faceted by carrier


# How many flights arrived early on Thanksgiving?
## How early was the earliest flight?
flights %>% 
  filter(month == 11) %>% 
  filter(day == 28) %>% 
  filter(arr_delay < 0) %>% 
  arrange(arr_delay)


# Exercise: student creatively describes flight, we try to find it, 




# mutate ------------------------------------------------------------------


## convert arr_delay to hours
flights %>% 
  mutate(arr_delay_hrs = arr_delay/60)

## convert distance between airports to thousands of miles


## case_when: create new variable, arrival_status that tells you
## if flight arrived early, on time, or late
new_flights = flights %>% 
  mutate(arrival_status = case_when(arr_delay == 0 ~ "on time",
                                    arr_delay < 0 ~ "early",
                                    arr_delay > 0 ~ "late"))



## case_when: create new variable, how_late that tells you
## if flight was not late, a bit late, somewhat late, super late
new_flights = flights %>% 
  mutate(how_late = 
      case_when(arr_delay <= 0 ~ "not late",
        arr_delay > 0 & arr_delay <= 10 ~"bit late", 
        arr_delay >= 11 & arr_delay <= 25 ~ "somewhat late", 
        arr_delay > 25 ~ "super late"))



# summary -----------------------------------------------------------------


## on average, how long are planes spending in the air?
flights %>% 
  group_by(month) %>% 
  summarise(avg_air_time = mean(air_time, na.rm = TRUE))

# on average, how long are planes traveling?


# look at the four numbers: min, max, mean, median for air_time


# group_by ----------------------------------------------------------------


#  calculate average departure delay by month
flights %>% 
  group_by(month) %>% 
  summarise(avg_delay_month = mean(dep_delay, na.rm = TRUE)) %>% 
  arrange(desc(avg_delay_month))



# calculate min/max/mean delay by day of the month


# which airlines has the worst (on avg) departure delays? Which as the best?


# how many flights from each origin?
flights %>% 
  group_by(origin) %>% 
  summarise(n_flights = n())



# group by more than one variable:
# how many flights from each origin in each month?



# note that grouping adds "metadata" to your table
flights %>% 
  group_by(origin)

# remove this with ungroup()
flights %>% 
  ungroup(origin)


# note that we can use group_by with mutate as well to add 
# group-level variables to datafram
new_flights = flights %>% 
  group_by(origin) %>% 
  mutate(n_flights = n())


## putting it all together: 
## look at flights from summer
## create new variable called `gain`, which equals
## the difference between how late/early a flight was in taking off
## and how early/late it was in arriving
## calculate average, min, max gain for each airline



# inner join --------------------------------------------------------------------


# join airlines, flights
View(airlines)
View(flights)

merged_flights = 
  inner_join(flights, airlines, by = "carrier")

# do the same for airports
flights_with_airport_names = 
  inner_join(flights, airports, by = c("dest" = "faa"))


# do the same for weather



# select and arrange ------------------------------------------------------



## sometimes tables are big and we don't want to look at every variable
## say i convert arr_delay to hours and want to check my work:
flights %>% 
  mutate(arr_delay_hrs = arr_delay/60) %>% 
  select(arr_delay, arr_delay_hrs)

## can also rearrange columns this way
flights %>% 
  mutate(arr_delay_hrs = arr_delay/60) %>% 
  select(arr_delay, arr_delay_hrs, everything())


## can also throw out vars i don't need
flights %>% 
  select(-air_time)


## let's sort data by arr_delay
## increasing order
flights %>% 
  arrange(dep_delay)

## decreasing order
flights %>% 
  arrange(desc(dep_delay))



## putting it all together
