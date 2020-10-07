# Hexagon sticker of Simpson's paradox


## clear space
rm(list=ls())

## load libraries
library(ggplot2)
library(hrbrthemes)
library(hexSticker)
library(viridis)
library(scales)
library(showtext)


## Loading Google fonts (http://www.google.com/fonts)
font_add_google("Fira Sans")
## Automatically use showtext to render text for future devices
showtext_auto()


# fake data from http://rpubs.com/lakenp/simpsonsparadox
set.seed(123)
n = 800

Education = rbinom(n, 2, 0.5)
Neuroticism = rnorm(n) + Education
Salary = Education * 2 + rnorm(n) - Neuroticism * 0.3

Salary = sample(10000:11000,1) + rescale(Salary, to = c(0, 100000))
# summary(Salary)
Neuroticism = rescale(Neuroticism, to = c(0, 7))
# summary(Neuroticism)
Education = factor(Education, labels = c("Low", "Medium", "High"))

data <- data.frame(
  Salary,
  Neuroticism,
  Education
)


# make visual
p <- data %>% ggplot(aes(Neuroticism, Salary)) 

## Settings:
col_border <- "#4B77BE"  ## Steel Blue
col_bg <- "#ABB7B7"      ## Edward
col_text <- "#FFFFFF"    ## white

p = 
  p + 
  geom_point(aes(col = Education), alpha = .1) + 
  geom_smooth(aes(col = Education, fill = Education), method = 'lm') +
  theme(legend.position = 'none', 
        axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y =element_blank(),
        axis.ticks.y=element_blank()) +
  #theme_minimal() + 
  theme_void() + 
  #theme_transparent(legend.position = 'none') + 
  scale_color_manual(values = c('#CC2E40', '#466A9F', '#1F414D'), guide = F) + 
  scale_fill_manual(values = c('#CC2E40', '#466A9F', '#1F414D'), guide = F)
p

sticker(p, package="POLI-301",h_fill = 'white',h_color = '#73000a',
        p_size=8, s_x=1, s_y=.75, s_width=1.3, s_height=1,
        p_family = "Fira Sans", p_color = '#73000a', 
        filename = 'assets/images/icon.png')


sticker(p, package="POLI-301",h_fill = 'white',h_color = '#73000a',
        p_size=8, s_x=1, s_y=.75, s_width=1.3, s_height=1,
        p_family = "Fira Sans", p_color = '#73000a', 
        filename = 'POLI301.png')


