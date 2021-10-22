?stevedata::pwt_sample

library(peacesciencer)


ir_econ = create_stateyears() %>% 
  filter(year >= 1945) %>% 
  add_cow_trade() %>% 
  add_sdp_gdp() %>% 
  add_contiguity() %>% 
  add_rugged_terrain() %>% 
  add_capital_distance() %>% 
  add_igos() %>% 
  select(country = statenme, year, imports, exports, 
         gdp = wbgdp2011est, 
         pop = wbpopest, 
         land_borders = land, mincapdist,
         percent_mountain = newlmtnest, 
         number_of_igos = sum_igo_full) %>% 
  mutate(across(c(gdp, pop, percent_mountain), exp))


write_csv(ir_econ, "/Users/juan/Dropbox/websites/poli-301/static/files/ir_econ.csv")
