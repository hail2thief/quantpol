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
age_prof = lm(score ~ age, data = evals)
get_regression_table(age_prof)

age_fit = get_regression_points(age_prof)



ggplot(evals, aes(x = age, y = score)) + geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# class size
size_prof = lm(score ~ cls_students, data = evals)
get_regression_table(size_prof)
size_fit = get_regression_points(age_prof)


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
data("evals")
evals
?evals
evals$gender
View(evals)

# gender
prof_gender = lm(score ~ gender, data = evals)

get_regression_table(prof_gender)

gender_fit = get_regression_points(prof_gender)



evals %>% 
  group_by(gender) %>% 
  summarise(avg = mean(score))


prof_pic = lm(score ~ pic_outfit, data = evals)
get_regression_table(prof_pic)
evals$pic_outfit

prof_lang = lm(score ~ language, data = evals)
get_regression_table(prof_lang)
evals$language


prof_race = lm(score ~ ethnicity, data = evals)
get_regression_table(prof_race)
evals$ethnicity

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
bored_tv_results %>% 
  select(tvhours, tvhours_hat, residual) %>% 
  summarise(total_variation = sum((tvhours - mean(tvhours))^2), 
            explained_line = sum(residual^2), 
            unexplained_variation = explained_line/total_variation, 
            explained_variation = 1 - unexplained_variation)

summary(bored_tv)

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
hunger_tv_results %>% 
  select(tv_hours, tv_hours_hat, residual) %>% 
  summarise(total_variation = sum((tv_hours - mean(tv_hours))^2), 
            explained_line = sum(residual^2), 
            unexplained_variation = explained_line/total_variation, 
            explained_variation = 1 - unexplained_variation)


## your turn: 
## regress percent below poverty against state
## interpret output
## calculate residuals
data(midwest)
midwest
