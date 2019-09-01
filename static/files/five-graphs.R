library(gapminder) # load gapminder dataset, install if not yet installed
library(tidyverse) # load the tidyverse, lets us use ggplot plus other functions



# Linegraphs (average life expectancy by year)
lifeExp_year = 
  gapminder %>% 
  select(year, lifeExp) %>% 
  group_by(year) %>% 
  summarise(avg_expectancy = mean(lifeExp))

lifeExp_year

ggplot(lifeExp_year, aes(x = year, y = avg_expectancy)) + 
  geom_line() + 
  geom_point()


# Linegraphs ((average life expectancy by year and continent)
lifeExp_year_continent = 
  gapminder %>% 
  select(year, continent, lifeExp) %>% 
  group_by(year, continent) %>% 
  summarise(avg_expectancy = mean(lifeExp))

lifeExp_year_continent

ggplot(lifeExp_year_continent, aes(x = year, y = avg_expectancy, 
                                           color = continent)) + 
  geom_line() + 
  geom_point()


# Scatterplot
# subset data to 2002
gapminder_2002 = 
  gapminder %>% 
  filter(year == 2002)


# Scatterplot
ggplot(gapminder_2002, aes(x = gdpPercap, y = lifeExp, 
                           size = pop, color = continent)) + 
  geom_point()


# Boxplot
ggplot(gapminder_2002, aes(x = continent, y = gdpPercap)) + 
  geom_boxplot()


# Histogram
ggplot(gapminder_2002, aes(x =gdpPercap)) + 
  geom_histogram()


# Barplots
continent_avg_lifeExp = 
  gapminder_2002 %>% 
  group_by(continent) %>% 
  summarise(avg_lifeExp = mean(lifeExp))

ggplot(continent_avg_lifeExp, aes(x = continent, y = avg_lifeExp)) + 
  geom_col()


