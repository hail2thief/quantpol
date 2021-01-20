# load libraries -------------------------------------------------------------------------
library(tidyverse)
library(gapminder) # install this if you don't have it!


# clean data ------------------------------------------------------------------------

# look at data
gapminder
?gapminder

# subset data to focus on 2007
gap_07 = 
  gapminder %>% 
  filter(year == 2007)


# make the final nice plot ---------------------------------------------------------------------



# final product
ggplot(gap_07, aes(x = gdpPercap, y = lifeExp, 
                   color = continent, size = pop)) + 
  geom_point() + 
  labs(x = "GDP per capita ($USD, inflation-adjusted)", 
       y = "Life expectancy (in years)", 
       title = "Wealth and Health Around the World", 
       subtitle = "Data from 2007. Source: gapminder package.") + 
  theme_bw()


# The four graphs -------------------------------------------------------------------


# Linegraphs (average life expectancy by year)
life_yr = 
  gapminder %>% 
  select(year, lifeExp) %>% 
  group_by(year) %>% 
  summarise(avg_yrs = mean(lifeExp))

# look at the data
life_yr

# make the plot


# Histograms (GDP per capita across the world)

# look at the data
gap_07


# Barplots
life_region = 
  gap_07 %>% 
  group_by(continent) %>% 
  summarise(avg_yrs = mean(lifeExp))

# look at the data
life_region


# make the plot
