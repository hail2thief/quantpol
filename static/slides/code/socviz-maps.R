library(tidyverse)
library(socviz)

# data
county_full = left_join(county_map, county_data, by = "id")


ggplot(county_full, aes(x = long, y = lat, group = group)) +
  geom_polygon(color = "gray90", size = 0.05) + coord_equal()
