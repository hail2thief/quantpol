# libraries
library(tidyverse)
library(WDI)


# get world bank data
dat = WDI(indicator=c(gni_cap = 'NY.GNP.PCAP.CD'), 
          start = 2021, end = 2021, extra = TRUE)


# clean up
gni_2021 = dat %>% 
  filter(region != "Aggregates") %>% 
  select(country, gni_cap, region) %>% 
  as_tibble()


# write out
write_rds(gni_2021, file = "/Users/juan/Dropbox/websites/quantpol/static/files/gni-2021.rds")
