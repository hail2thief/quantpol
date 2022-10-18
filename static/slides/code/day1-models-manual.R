library(tidyverse)
library(socviz)


# fit true model
mod_true = lm(donors ~ roads, data = organdata)

# calculate ssr
line_of_best_fit = function(intercept, slope)
{
  sum_ssr = organdata %>% 
    select(donors, roads) %>% 
    drop_na() %>% 
    mutate(fit = intercept + slope*roads) %>% 
    mutate(residual = donors - fit) %>%
    mutate(squared_resid = residual^2) %>% 
    summarise(ssr = sum(squared_resid, na.rm = TRUE))
  
  return(sum_ssr)
}


# slope constant, vary intercept
crossing(intercept = seq(0, 15, by = .1)) %>% 
  mutate(map_df(.x = intercept, 
                   .f = ~ line_of_best_fit(intercept = .x, 
                                           slope = mod_true$coefficients[2]))) %>% 
  ggplot(aes(x = intercept, y = ssr)) + 
  geom_point()


# slope varies, intercept constant
crossing(slope = seq(-1, 1, by = .02)) %>% 
  mutate(map_df(.x = slope, 
                .f = ~ line_of_best_fit(slope = .x, 
                                        intercept = mod_true$coefficients[1]))) %>% 
  ggplot(aes(x = slope, y = ssr)) + 
  geom_point()


# vary both!
grid_search = crossing(intercept = seq(0, 15, by = 1), 
         slope = seq(-1, 1, by = .2)) %>% 
  mutate(map2_df(.x = intercept, .y = slope,
                .f = ~ line_of_best_fit(intercept = .x, 
                                        slope = .y)))


ggplot(grid_search, aes(x = intercept, y = slope, fill = ssr)) + 
  geom_tile() + 
  scale_fill_viridis_c(option = "magma", trans = "log")
