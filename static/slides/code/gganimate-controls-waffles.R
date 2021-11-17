library(tidyverse)
library(gganimate)


fake = tibble(south = sample(c(0, 1), size = 50, replace = TRUE), 
              waffle = rnorm(n = 50, mean = 20, sd = 4) + 10*south,
              divorce = rnorm(n = 50, mean = 20, sd = 2) + 8*south) 

df <- data.frame(south = sample(c(0, 1), size = 300, replace = TRUE)) %>%
  mutate(waffle = rnorm(n = 300, mean = 20, sd = 4) + 10*south) %>%
  mutate(divorce = rnorm(n = 300, mean = 20, sd = 2) + 8*south, time="1") %>%
  group_by(south) %>%
  mutate(mean_waffle=mean(waffle),mean_divorce=mean(divorce)) %>%
  ungroup()



#Calculate correlations
before_cor <- paste("1. Start with raw data. Correlation between waffle and divorce: ",round(cor(df$waffle,df$divorce),3),sep='')
after_cor <- paste("6. Correlation between waffle and divorce controlling for south: ",round(cor(df$waffle-df$mean_waffle,df$divorce-df$mean_divorce),3),sep='')
#Add step 2 in which waffle is demeaned, and 3 in which both waffle and divorce are, and 4 which just changes label
dffull <- rbind(
  #Step 1: Raw data only
  df %>% mutate(mean_waffle=NA,mean_divorce=NA,time=before_cor),
  #Step 2: Add x-lines
  df %>% mutate(mean_divorce=NA,time='2. Figure out what differences in waffle are explained by south'),
  #Step 3: waffle de-meaned 
  df %>% mutate(waffle = waffle - mean_waffle,mean_waffle=0,mean_divorce=NA,time="3. Remove differences in waffle explained by south"),
  #Step 4: Remove waffle lines, add divorce
  df %>% mutate(waffle = waffle - mean_waffle,mean_waffle=NA,time="4. Figure out what differences in divorce are explained by south"),
  #Step 5: divorce de-meaned
  df %>% mutate(waffle = waffle - mean_waffle,divorce = divorce - mean_divorce,mean_waffle=NA,mean_divorce=0,time="5. Remove differences in divorce explained by south"),
  #Step 6: Raw demeaned data only
  df %>% mutate(waffle = waffle - mean_waffle,divorce = divorce - mean_divorce,mean_waffle=NA,mean_divorce=NA,time=after_cor))
p <- ggplot(dffull,aes(y=divorce,x=waffle,color=as.factor(south)))+geom_point()+
  geom_vline(aes(xintercept=mean_waffle,color=as.factor(south)))+
  geom_hline(aes(yintercept=mean_divorce,color=as.factor(south)))+
  guides(color=guide_legend(title="south"))+
  labs(title = 'The Relationship between divorce and waffle, Controlling for south \n{next_state}')+ 
  theme_bw(base_family = "Fira Sans", base_size = 14) +
  theme(legend.position = "top") + 
  transition_states(time,transition_length=c(12,32,12,32,12,12),state_length=c(160,100,75,100,75,160),wrap=FALSE)+
  ease_aes('sine-in-out')+
  exit_fade()+enter_fade()
animate(p,nframes=200)
