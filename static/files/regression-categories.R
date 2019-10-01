library(tidyverse)
library(moderndive)
library(gapminder)



## getting fitted/residuals
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point() +
  theme_minimal()

model_cars = lm(mpg ~ wt, data = mtcars)


## using moderndive
fitted = get_regression_points(model_cars)


# by hand
mtcars = 
  mtcars %>% 
  # the predict function gets us mpg_hat
  mutate(mpg_hat = predict(model_cars)) %>% 
  mutate(residual = mpg - mpg_hat) %>% 
  arrange(residual)

mtcars


## practice: evals from moderndive, 
## pick one numeric variable to explain beauty score





## Categorical variables
ggplot(evals, aes(x = bty_avg, y = score, color = rank, group = FALSE)) + 
  geom_jitter() + geom_smooth(method = "lm", se = FALSE, color = "orange") + 
  theme_minimal(base_size = 16) +
  labs(title = "Relationship between professor beauty and student evaluations")


## get correlation
evals %>% 
  summarise(cor = cor(bty_avg, score, use = "complete.obs"))

## regerssion table
beauty_model = lm(score ~ bty_avg, data = evals)
get_regression_table(beauty_model)

## average by tenure
evals %>% 
  group_by(rank) %>% 
  summarise(avg = mean(score))
  

# estimate model
model_rank = lm(score ~ rank, data = evals)

# get model output
get_regression_table(model_rank)

## or you can also use summary()
summary(model_rank)


## your turn: regress score against some categorical variable
## interpret output




## Explaining data
### compare strong correlation

### made up fake data
set.seed(1990)
strong_cor = tibble(bored = rnorm(100), 
                    tvhours = 8 + 3*bored + rnorm(100))

ggplot(strong_cor, aes(x = bored, y = tvhours)) + 
  geom_point() + 
  theme_minimal(base_size = 16) + 
  geom_smooth(method = "lm", se = FALSE)


# get model and output
bored_tv = lm(tvhours ~ bored, data = strong_cor)
get_regression_table(bored_tv)

bored_tv_results = get_regression_points(bored_tv)


## variation in TV-hours
ggplot(data = strong_cor, aes(x = tvhours)) + 
  geom_histogram() + 
  theme_minimal()


## variation explained / total variation = unexplained "left over"
var(bored_tv_results$residual)/var(bored_tv_results$tvhours)

### weak correlation
weak_cor = tibble(hunger = rnorm(100), 
                    tv_hours = 8 + rnorm(100))

ggplot(weak_cor, aes(x = hunger, y = tv_hours)) + 
  geom_point() + 
  theme_minimal(base_size = 16) + 
  geom_smooth(method = "lm", se = FALSE)


# get model and output
hunger_tv = lm(tv_hours ~ hunger, data = weak_cor)
get_regression_table(hunger_tv)

hunger_tv_results = get_regression_points(hunger_tv)
hunger_tv_results

## variation left over
var(hunger_tv_results$residual)/var(hunger_tv_results$tv_hours)



## your turn: 
## regress percent below poverty against state
## interpret output
## calculate residuals
data(midwest)
midwest
