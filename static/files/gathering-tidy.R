library(tidyverse)
library(fivethirtyeight)
library(ggthemes)

# let's tidy drinks
drinks

# too many countries, let's look at a few
# %in% is a new logical operator: returns observations that match one of the strings
drinks_subset = 
  drinks %>% 
  filter(country %in% c("USA", "China", "Italy", "Saudi Arabia")) 


# let's gather the three alcohol variables into two: type and serving
tidy_drinks = drinks_subset %>% 
  gather(key = "type", value = "serving", c(beer_servings, spirit_servings, wine_servings))
tidy_drinks

# let's put position = dodge in geom_col, which will place bars side by side
ggplot(tidy_drinks, aes(x = country, y = serving, fill = type)) + 
  geom_col(position = "dodge")


# masculinity survey
masculinity_survey
?masculinity_survey

## let's look only at pressure to be manly
manly_pressure = 
  masculinity_survey %>% 
  filter(question == "Do you think that society puts pressure on men in a way that is unhealthy or bad for them?")
manly_pressure

## let's gather the age categories
manly_age = manly_pressure %>% 
  select(response, age_18_34, age_35_64, age_65_over) %>% 
  gather(key = "age_category", value = "proportion", 
         c(age_18_34, age_35_64, age_65_over))


ggplot(manly_age, aes(x = response, y = proportion, fill = age_category)) + 
  geom_col(position = "dodge") + age_category
  theme_minimal() +
  labs(title = "Do you think that society puts pressure on men in a way that is unhealthy or bad for them?")


## pick a new question, and make a bar plot comparing people with and without children
masculine_children = masculinity_survey %>% 
  filter(question == "How important is it to you that others see you as masculine?") %>% 
  select(response, children_yes, children_no)

masc_child_tidy = masculine_children %>% 
  gather(key = "has_children", value = "proportion", c(children_yes, children_no))


ggplot(masc_child_tidy, aes(x = response, y = proportion, fill = has_children)) + 
         geom_col(position = "dodge")



## we can also gather everything
manly_tidy_all = 
  manly_pressure %>% 
  # -c(question, response) = everything EXCEPT question and response
  gather(key = "subset", value = "proportion", -c(question, response))


ggplot(manly_tidy_all, aes(x = response, y = proportion, fill = subset)) + 
         geom_col(position = "dodge")



# # pokemon tidy
# type_power_long = 
#   type_power %>% 
#   gather(key = "stat", value = "average", 
#          c(attack, hp, defense, speed))
# 
# ggplot(type_power_tidy, aes(x = type1, y = average, fill = stat)) + 
#   geom_col(position = "dodge") + scale_fill_brewer(palette = "Set2")


# Factors -----------------------------------------------------------------


## say I have data on weather, like so
weather = tibble(temp = c(80, 23, 14, 25, 83), 
                 month = c("June", "September", "October", "February", "December"))
weather

ggplot(weather, aes(x = month, y = temp)) + geom_col()

## I want to display in month order; how?
## I can use factors
weather = weather %>% 
  mutate(month = factor(month, levels = c("February", 
                                          "June", 
                                          "September", 
                                          "October", 
                                          "December")))

ggplot(weather, aes(x = month, y = temp)) + geom_col()


## say I want to plot see how common different eye colors are and plot them by frequency
starwars

star_eyes = starwars %>% 
  group_by(eye_color) %>% 
  summarise(n = n())


## I want to plot by how common they are
ggplot(star_eyes, aes(x = eye_color, y = n)) + 
  geom_col() + 
  coord_flip()

star_eyes = star_eyes %>% 
  mutate(eye_color = fct_reorder(eye_color, n))


# plot in order
ggplot(star_eyes, aes(x = eye_color, y = n)) + 
  geom_col() + 
  coord_flip()


## use case_when to make a new variable clasifying height into short medium tall
## then turn into a factor that makes sense
## plot using geom_col
starwars_height = starwars %>% 
  mutate(star_heights = case_when(height < 100 ~ "short", 
                                  height >= 100 & height < 200 ~ "medium", 
                                  height >= 200 ~ "tall")) %>% 
  mutate(star_heights = factor(star_heights, levels = c("short", "medium", 
                                                        "tall")))
starwars_height$star_heights


## recreate Bechdel 538 infographic: 
## break up year into 4 year blocks
## count how many categories in clean-test, then calculate percent
## make a barplot with year block on x-axis, y = percent of movies
bechdel_percents = bechdel %>% 
  select(year, clean_test) %>% 
  mutate(year_cat = cut_width(year, width = 4)) %>% 
  group_by(year_cat) %>% 
  mutate(total = n()) %>% 
  group_by(year_cat, clean_test) %>% 
  mutate(count = n()) %>% 
  mutate(percent = count/total)

ggplot(bechdel_percents, aes(x = year_cat, y = percent, fill = clean_test)) + 
         geom_col() + 
  theme_fivethirtyeight()



# gss survey data
gss_cat


## what is average age, tv watched, and number of respondents in each religion
religion_tv = gss_cat %>% 
  group_by(relig) %>% 
  summarise(age = mean(age, na.rm = TRUE), 
            tvhours = mean(tvhours, na.rm = TRUE), 
            n = n())

religion_tv

ggplot(religion_tv, aes(x = tvhours, y = relig)) + geom_point()

## make religion a factor, ordered in terms of taverage tv
religion_tv = 
  religion_tv %>% 
  mutate(relig = fct_reorder(relig, tvhours))

ggplot(religion_tv, aes(x = tvhours, y = relig)) + geom_point()


## create a new variable that breaks up year into two-year intervals
## turn into a factor so it retains it's order
## calculate mean() and median() for each year category
## gather the stats and plot, filling by stat


