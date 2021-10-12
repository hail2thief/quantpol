# libraries
library(tidyverse)



# elections data
elections = read_csv("https://www.dropbox.com/s/kysv19u2m91e6gr/elections.csv?dl=1")


# do your work here!


# load data
therm = 
  
  
  
# cool
therm_logn = therm_2017 %>% pivot_longer(cols = ft_black_2017:ft_rep_2017, names_to = "group", values_to = "thermometer", names_pattern = "ft_?(.*)_2017")


ggplot(filter(therm_logn, party_id %in% c("Democrat", "Republican")), 
              aes(y = group, x = thermometer, fill = party_id)) + 
  geom_density_ridges(rel_min_height = 0.005, alpha = .8) + 
  scale_fill_manual(values = c("blue", "red")) + 
  hrbrthemes::theme_ipsum() + 
  theme(legend.position = "bottom")
