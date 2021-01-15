# Running R code --------------------------------------------------------------------

# To move a line of code from a script to the console, you can put your cursor
# somewhere in the line of code and press this keyboard shortcut:
# - Windows: ctrl + enter
# - Mac: command + enter


# Try it here!
2 + 2

# RStudio will automatically move your cursor to the next line of code, so you
# can keep pressing ctrl/command + enter to step through your code. Try it:
1 + 2
3 - 6
6 / 2

# Lines that start with a # are commented out---they will not run as code and
# are good for leaving yourself notes about what's happening.


# Objects (aka variables) -------------------------------------------------

# Something that contains some sort of value
#
# We assign values to variables/objects with the assignment operator, or =
x = 4
y = 10

# What happens if you run this?
x + y

# What's the difference between this:
x + y

# and this:
z = x + y



# Packages ------------------------------------------------

# Collections of functions and data that other people have written and published 
# for you to use
library(dplyr)

# This loads a bunch of functions like tibble()
# What do you think this does?
my_tibble = tibble(height = c(52, 56, 71, 62, 63, 49),
                   weight = c(103, 159, 181, 163, 188, 223))
my_tibble

# It also loads some data
starwars


# Functions ---------------------------------------------------------------

# Take objects and do stuff to them
head(my_tibble, n = 2)
tail(starwars)
