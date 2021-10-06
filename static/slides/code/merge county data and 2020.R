# load libraries
library(tidyverse)
library(socviz)


# 2020 data
df = read_csv("/Users/juan/Dropbox/github/US_County_Level_Election_Results_08-20/2020_US_County_Level_Presidential_Results.csv")


# pare down the datasets
county_small = county_data %>% 
  select(fips = id, name, state, census_region, pop, female, white, 
         black, travel_time, land_area, hh_income, 
         per_dem_2012, per_gop_2012, 
         per_dem_2016, per_gop_2016)

elec_2020 = df %>% 
  select(fips = county_fips, per_gop_2020 = per_gop, per_dem_2020 = per_dem)


# merge and drop unneeded ones
merged = left_join(elec_2020, county_small, by = "fips") %>% 
  relocate(c(per_gop_2020, per_dem_2020), .after = last_col()) 


write_csv(merged, "/Users/juan/Dropbox/websites/poli-301/static/files/elections.csv")

