# make up aid and conflict data
set.seed(1990)
library(tidyverse)


low = tibble(aid = rnorm(200, mean = 10)*1e5, 
       conflict_deaths = rnorm(200, mean = 1000) + -.0005*aid, 
       corrupt = "Low corruption")


high = tibble(aid = rnorm(200, mean = 10)*1e5, 
             conflict_deaths = rnorm(200, mean = 1000) + .001*aid, 
             corrupt = "High corruption")

sim_aid_conf = bind_rows(low, high) %>% 
  mutate(across(c(aid, conflict_deaths), round, 0))

sim_aid_conf

lm(conflict_deaths ~ aid, data = sim_aid_conf)
lm(conflict_deaths ~ aid, data = filter(sim_aid_conf, corrupt == "Low corruption"))
lm(conflict_deaths ~ aid, data = filter(sim_aid_conf, corrupt == "High corruption"))


sim_aid_conf %>% 
  mutate(aid = aid/1e5) %>% 
  filter(corrupt == "Low corruption") %>% 
  lm(conflict_deaths ~ aid, data = .)


# save data
write_csv(sim_aid_conf, "/Users/juan/Dropbox/websites/poli-301/static/files/aid-conflict.csv")
