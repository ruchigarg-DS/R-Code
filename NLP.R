# CMD + SHIFT + M for %>%  # called a pipeline, not the same as Python
# COMPARABLE to df[filter].groupby().mean().asfbdavdsvsv


install.packages(c('tidyverse', 'nycflights13'))
library(tidyverse)
library(nycflights13)



flights


# tidyverse "verb functions" # filter, arrange, select, mutate, transmutate
# take a dataframe and some other stuff
filter(flights, month == 1)

filter(flights, dest == 'ATL')

filter(flights, dest == 'ATL', arr_delay > 100, distance > 750)

# c tells R that it should expect a list 
#class(c('ATL', 'CHI')) # character vector; native to R

filter(flights, dest %in% c('ATL', 'CHI'))
filter(flights, dest %in% c('ATL', 'CHI'), month %in% c(5, 6))

arrange(flights, year, month, day, sched_dep_time, arr_delay)

# desceding order of days
arrange(flights, desc(day))

select(flights, dest, year)

colnames(flights)

# returns only the newly engineered column

transmute(flights, speed = distance/air_time * 60)

flights %>%
  mutate(speed = distance /air_time * 60) %>%
  filter(dest =='ATL') %>%
  arrange(desc(arr_delay)) %>% 
  select(month, day, speed, arr_delay, sched_arr_time)









