library(gapminder) # load gapminder dataset, install if not yet installed
library(tidyverse) # load the tidyverse, lets us use ggplot plus other functions
library(ggthemes) # loads custom themes, need to install first
library(hrbrthemes)

# look at data
gapminder


# look at distribution of life expectancy, coloring continents
ggplot(gapminder, aes(x = lifeExp, fill = continent)) + 
  geom_histogram()

# try facet: notice we wrap `continent` in vars()
ggplot(gapminder, aes(x = lifeExp, fill = continent)) + 
  geom_histogram() + 
  facet_wrap(vars(continent)) #notice continent is wrapped in

# let's add labels to make this more legible
ggplot(gapminder, aes(x = lifeExp, fill = continent)) + 
  geom_histogram() + 
  facet_wrap(vars(continent)) + 
  labs(x = "Life expectancy, in years", 
       y = "", 
       title = "Life Expectancy Around the World", 
       subtitle = "Data from Gapminder", 
       fill = "Continent")


# let's look at different themes to make the graphs prettier
## TRY: start typing theme_ and try the different autocomplete options
ggplot(gapminder, aes(x = lifeExp, fill = continent)) + 
  geom_histogram() + 
  facet_wrap(vars(continent)) + 
  labs(x = "Life expectancy, in years", 
       y = "", 
       title = "Life Expectancy Around the World", 
       subtitle = "Data from Gapminder", 
       fill = "Continent") + 
  theme_bw()

ggplot(gapminder, aes(x = lifeExp, fill = continent)) + 
  geom_histogram() + 
  facet_wrap(vars(continent)) + 
  labs(x = "Life expectancy, in years", 
       y = "", 
       title = "Life Expectancy Around the World", 
       subtitle = "Data from Gapminder", 
       fill = "Continent") + 
  theme_ft_rc()

ggplot(gapminder, aes(x = lifeExp, fill = continent)) + 
  geom_histogram() + 
  facet_wrap(vars(continent)) + 
  labs(x = "Life expectancy, in years", 
       y = "", 
       title = "Life Expectancy Around the World", 
       subtitle = "Data from Gapminder", 
       fill = "Continent") + 
  theme_ipsum()

ggplot(gapminder, aes(x = lifeExp, fill = continent)) + 
  geom_histogram() + 
  facet_wrap(vars(continent)) + 
  labs(x = "Life expectancy, in years", 
       y = "", 
       title = "Life Expectancy Around the World", 
       subtitle = "Data from Gapminder", 
       fill = "Continent") + 
  theme_clean()


# let's try changing the color of our data
## GO on http://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3 
## to find a nice palette
ggplot(gapminder, aes(x = lifeExp, fill = continent)) + 
  geom_histogram() + 
  facet_wrap(vars(continent)) + 
  labs(x = "Life expectancy, in years", 
       y = "", 
       title = "Life Expectancy Around the World", 
       subtitle = "Data from Gapminder", 
       fill = "Continent") + 
  theme_bw() + 
  scale_fill_brewer(palette = "Set2") 


# change just one fill color
ggplot(gapminder, aes(x = lifeExp)) + 
  geom_histogram(fill = "darkblue") + 
  facet_wrap(vars(continent)) + 
  labs(x = "Life expectancy, in years", 
       y = "", 
       title = "Life Expectancy Around the World", 
       subtitle = "Data from Gapminder", 
       fill = "Continent") + 
  theme_bw()



## make the best, most beautiful graph you can
## that shows us the relationship between wealth (gdpCap) and health (lifeExp)
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) + 
  geom_point(alpha = .4) + 
  facet_wrap(vars(continent), scales = 'free') + 
  theme_light() + 
  scale_color_brewer(palette = "Dark2") + 
  labs(x = "Wealth (GDP per capita)", 
       y = "Health (average life expectancy, in years)", 
       title = "Wealth and Health Around the World", 
       subtitle = "Data from Gapminder") + 
  theme(legend.position = "none")



ggplot(gapminder, aes(x = year, y = pop, color = country)) + 
  geom_line(size = 1) + 
  facet_wrap(vars(continent), scales = "free") + 
  theme_light() + 
  theme(legend.position = "none") + 
  labs(x = "Year", y = "Population",
       title = "Population Growth Around the World", 
       subtitle = "Data from Gapminder")

