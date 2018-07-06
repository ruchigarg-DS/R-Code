"
This R code serves as an introduction to the tidyverse,
especially chaining commands using pipes. Per tidyverse.org:

  * 'Use %>% when you find yourself composing three or more
  functions together into a nested call, or creating
  intermediate objects that you don’t care about. Put each
  verb on its own line.'

  * 'Reserve pipes for a sequence of steps applied to one
  primary object.'

(source: http://style.tidyverse.org/pipes.html#introduction)

The shortcut for %>% is CMD + SHIFT + M.

%>%: for when ya gotta do stuff ¯\_(ツ)_/¯
"

# install and import packages
install.packages(c('tidyverse', 'nycflights13'))
library(tidyverse)
library(nycflights13)

# take a look at that tibble:
flights

# the tidyverse "verbs" take a dataframe and then (sometimes
# many!) further arguments

# we'll look at filter, arrange, select, mutate, and transmute

# return only flights headed to Atlanta:
filter(flights, dest == 'ATL')
# return flights headed to Atlanta with a delay longer than 100
# minutes and a distance to travel longer than 750 miles:
filter(flights, dest == 'ATL', arr_delay > 100, distance > 750)

# in pandas this might look like:
# df[(df['dest'] == 'ATL') & (df['arr_delay'] > 100) & ...you get it]

# filtering based on multiple possibilities:
# return flights headed to Atlanta or Chicago
filter(flights, dest %in% c('ATL', 'CHI'))
# return flights from May or June
filter(flights, month %in% c(5, 6))

# arrange returns the dataframe sorted on the given column
# arrange can take multiple arguments
# here, sort based on year, then month, then day:
arrange(flights, year, month, day)

# sort based on day but in descending order:
arrange(flights, desc(day))

# select returns only the named columns from the dataframe:
select(flights, dest, year)

# sidenote: if we want to see a list of column names:
colnames(flights)

# mutate adds a new column as defined by us:
mutate(flights, speed = distance / air_time * 60)

# transmute returns only the new column(s):
transmute(flights, speed = distance / air_time * 60)

# here using %>% sends the dataframe as the first argument
# to mutate
flights %>% 
  mutate(speed = distance / air_time * 60) %>% # mutating flights
  filter(dest == 'ATL') %>% # filtering on the mutated flights
  arrange(desc(arr_delay)) # arranging the filtered mutated flights

# note there is a %>% at the END OF EVERY LINE that is followed
# by another function!

flights %>% 
  mutate(speed = distance / air_time * 60) %>% 
  filter(dest == 'ATL') %>% 
  arrange(desc(arr_delay)) %>% 
  select(month, day, speed, arr_delay, sched_arr_time)