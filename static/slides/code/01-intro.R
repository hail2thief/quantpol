library(tidyverse)
library(pander)
library(ggridges)
library(hrbrthemes)

# fake data on democracies
set.seed(1990)
n = 200
fake = tibble(government = sample(x = c("Democracy", "Autocracy"), 
                           size = n, 
                           replace = TRUE)) %>% 
  mutate(conflicts = rpois(n = n, lambda = 2 + 
                             5*I(government == "Autocracy")))




# fake table
table = crossing(country = c("Iraq", "Denmark"), 
         year = c(1990:1992)) %>% 
  mutate(government = ifelse(country == "Iraq", 
                             "Autocracy", "Democracy")) %>% 
  mutate(conflicts = rpois(n = n(), lambda = 2 + 
                             5*I(government == "Autocracy")))


pandoc.table(table)


# plot
ggplot(fake, aes(y = government, x = conflicts, fill = government)) + 
  stat_density_ridges(quantile_lines = TRUE, quantiles = 2, 
                      scale = 3, color = "white", alpha = .9) + 
  theme_ipsum(base_family = "Fira Sans") + 
  scale_x_continuous(limits = c(-2, 20)) + 
  labs(y = NULL, x = "Number of conflicts", 
       title = "Militarized Conflicts and Regime Type") + 
  theme(legend.position = "none") + 
  scale_fill_viridis_d(option = "rocket", end = .8)
  
