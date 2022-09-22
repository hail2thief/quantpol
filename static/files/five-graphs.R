# load libraries -------------------------------------------------------------------------
library(tidyverse)
library(gapminder) # install this if you don't have it!
library(socviz) # install this if you don't have it!
library(ggrepel) # install this if you don't have it!


# clean data ------------------------------------------------------------------------

# look at data
gapminder


# subset data to focus on 2007
gap_07 = 
  gapminder %>% 
  filter(year == 2007)


# calculate average life span by year
life_yr = 
  gapminder %>% 
  select(year, lifeExp) %>% 
  group_by(year) %>% 
  summarise(avg_yrs = mean(lifeExp))

# calculate average life expectancy by continent
life_region = 
  gap_07 %>% 
  group_by(continent) %>% 
  summarise(avg_yrs = mean(lifeExp))

# calculate average life expectancy by continent-year
life_region_yr = 
  gapminder %>% 
  group_by(continent, year) %>% 
  summarise(avg_yrs = mean(lifeExp))




# the big plot -------------------------------------------------------------------



# the fancy, final product
ggplot(gap_07, aes(x = gdpPercap, y = lifeExp, 
                   color = continent, size = pop)) + 
  geom_point() + 
  labs(x = "GDP per capita ($USD, inflation-adjusted)", 
       y = "Life expectancy (in years)", 
       title = "Wealth and Health Around the World", 
       subtitle = "Data from 2007. Source: gapminder package.") + 
  theme_bw()


# MAKE YOUR PLOT HERE (add labels)






# presidential elections ---------------------------------------------------------


# look at the data
elections_historic
?elections_historic


# MAKE THE PLOT HERE!!






# Day 2 -------------------------------------------------------------------


# look at econ data
economics
?economics # look at variable names


# MAKE PLOT HERE




# penguins data: grouped histogram, MAKE PLOT HERE