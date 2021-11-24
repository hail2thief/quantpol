# load libraries
library(tidyverse)
library(stevedata)
library(moderndive)
library(socviz)

# load data
gss_abortion
?gss_abortion # the codebook



# Sample code

## how many kids on average among all americans?
gss_sm %>% 
  summarise(avg_kids = mean(childs, na.rm = TRUE))

## take REPS many samples of size SIZE
kids_10 = gss_sm %>% 
  rep_sample_n(size = 10, reps = 1000) %>% 
  summarise(avg_kids = mean(childs, na.rm = TRUE))

## plot it
ggplot(kids_10, aes(x = avg_kids)) + 
  geom_density(fill = "orange")
