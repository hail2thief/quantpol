group_means = mariel %>% 
  mutate(lwage = exp(lwage)) %>% 
  group_by(miami, after) %>% 
  summarise(mean = mean(lwage, na.rm = TRUE)) %>% 
  mutate(after = ifelse(after == TRUE, 
                        "After Mariel", "Before Mariel")) %>% 
  mutate(after = fct_rev(after))


ggplot(data = filter(group_means, miami == TRUE), 
       aes(x = after, y = mean, group = miami)) + 
  geom_point(size = 4, color = red) + 
  geom_line(size = 2, color = red) + 
  coord_cartesian(ylim = c(6.1, 7.7)) + 
  geom_point(data = filter(group_means, miami == FALSE), 
             aes(x = after, y = mean, group = miami), size = 4) + 
  geom_line(data = filter(group_means, miami == FALSE), 
             aes(x = after, y = mean, group = miami), size = 2) + 
  annotate(geom = "segment", x = "Before Mariel", 
           xend = "After Mariel", y = group_means$mean[group_means$miami == TRUE & group_means$after == "Before Mariel"], yend = 6.18, size = 2, lty = 2) + 
  geom_point(data = tibble(x = "After Mariel", 
                           y = 6.18), aes(x = x, y =y), 
             inherit.aes = FALSE, size = 4)
