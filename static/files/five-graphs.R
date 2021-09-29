# load libraries -------------------------------------------------------------------------
library(tidyverse)
library(gapminder) # install this if you don't have it!
library(ggbeeswarm) # install this if you don't have it!
library(palmerpenguins) # install this if you don't have it!


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


ggplot(gap_07, aes(x = gdpPercap, y = lifeExp, 
                   color = continent, size = pop, 
                   label = country)) + 
  geom_point() + 
  labs(x = "GDP per capita ($USD, inflation-adjusted)", 
       y = "Life expectancy (in years)", 
       title = "Wealth and Health Around the World", 
       subtitle = "Data from 2007. Source: gapminder package.") + 
  theme_bw() + geom_text()






# palmer penguins ---------------------------------------------------------


# look at the data
penguins


# MAKE THE PLOT HERE!!
ggplot(data = penguins, aes(x = flipper_length_mm, 
                            y = body_mass_g, 
                            color = species, 
                            shape = species)) + 
  geom_point()




#  different types of plots -----------------------------------------------



# the basic scatterplot
ggplot(gap_07, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + 
  theme_bw()



# the time series, using life_yr

## look at the data
life_yr

# make the plot
ggplot(life_yr, aes(x = year, y = avg_yrs)) + 
  geom_line() + 
  theme_bw()


# look at the data
life_region

# the bar plot
ggplot(life_region, aes(x = continent, y = avg_yrs)) + 
  geom_col()


# Histogram (distribution of income across all countries)
ggplot(gap_07, aes(x = lifeExp)) + 
  geom_histogram()


# Beeswarm
ggplot(gap_07, aes(x = continent, y = lifeExp)) + 
  geom_quasirandom()

