# libraries
library(tidyverse)
library(socviz)
library(fivethirtyeight)
library(gapminder)
library(ggcorrplot)
library(broom)
library(palmerpenguins)


# load data
therm = read_csv("https://www.dropbox.com/s/h1pwngoku0ttrgo/voter-files-therm.csv?dl=1")

issues = read_csv("https://www.dropbox.com/s/x5xncajqsz0q09l/voter-files-issues.csv?dl=1")

# Correlations ------------------------------------------------------------



# switch out gapminder with a dataset you want below
gapminder %>% 
  # correlation only works with numeric columns; keep only those
  select(where(is.numeric)) %>% 
  # the cor() function doesn't take NA; drop them all
  drop_na() %>% 
  # get the correlation
  cor() %>% 
  # plot the correlation
  ggcorrplot(lab = TRUE)




# Draw a line -------------------------------------------------------------

# draw a line: alter the intercept and slope in geom_abline()
# to draw the line
  ggplot() + geom_abline(intercept = 1, slope = 2, size = 1) + 
  # change the limits on the x and y-axis
  scale_x_continuous(limits = c(-10, 10)) + 
  scale_y_continuous(limits = c(-10, 10)) + 
  # add a vertical and horizontal line at 0
  geom_hline(yintercept = 0, lty = 2) + 
  geom_vline(xintercept = 0, lty = 2) + 
  theme_bw()




# Models ------------------------------------------------------------------


# convince yourself about the line of best fit: run this code below
# set the seed
set.seed(1990)

# make the fake data
df = tibble(x = rnorm(50, mean = 10), 
            y = 3 + 2*x + rnorm(50))

# line of best fit?
model = lm(y ~ x, df)
true = tibble(true_intercept = coef(model)[1], 
              true_slope = coef(model)[2])



# HERE: make a scatterplot of x and y in df with a line of best fit




# function to calculate sum of squared residuals
line_of_best_fit = function(intercept, slope)
{
  sum_ssr = df %>% 
    mutate(fit = intercept + slope*x) %>% 
    mutate(residual = y - fit) %>%
    mutate(squared_resid = residual^2) %>% 
    summarise(`Sum of squared residuals` = sum(squared_resid))
  
  return(sum_ssr)
}


## HERE: using the line_of_best_fit function, try out different intercepts and slopes
line_of_best_fit(intercept = 3, slope = 5)

# the best intercept and slope, according to the line of best fit
line_of_best_fit(intercept = true$true_intercept, slope = true$true_slope)




# Modeling continuous -----------------------------------------------------


# load the data
ir_econ = read_csv("https://www.dropbox.com/s/5emig5psz1cpnjf/ir_econ.csv?dl=1")





# Modeling categorical ----------------------------------------------------


# data
gss_sm

# WORK HERE

