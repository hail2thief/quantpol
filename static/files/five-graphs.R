# load libraries -------------------------------------------------------------------------
library(tidyverse)
library(gapminder) # install this if you don't have it!
library(socviz) # install this if you don't have it!
library(ggrepel) # install this if you don't have it!
library(ggridges)
library(ggbeeswarm)
library(ggthemes)


# clean data ------------------------------------------------------------------------

# look at data
gapminder
?gapminder # look at codebook

# subset data to focus on 2007
gap_07 = 
  gapminder %>% 
  filter(year == 2007)


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




# organ data: grouped histogram, MAKE PLOT HERE
organdata
?organdata



# datasets you can use
starwars
gapminder
elections_historic
organdata
storms
