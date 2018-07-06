library(tidyverse)
library(ggplot2)
library(lubridate)
library(ggmap)


install.packages('ggmap')

map <- get_map('30308', zoom  = 10, source = 'stamen',
               maptype = 'toner')

gd <- geocode('Ponce City Market, Atlanta, GA')
gd
gd$lat
gd$lon
ggmap(map) + 
  geom_point(aes(x = gd$lon, y = gd$lat),
             size =5,
             shape = 4)

# UFO sightings in USA 2014 onwards

df <- read.csv('ufo_us.csv', header= TRUE)
head(df)
View(df)

df$datetime_formatted <- mdy_hm(df$datetime)

ufo_2014 <- df %>% 
  select(datetime_formatted, latitude, longitude) %>% 
  filter(year(datetime_formatted) >= 2014)
map <- get_map('United States', zoom = 4,
               source = 'stamen',
               maptype = 'watercolor')
ggmap(map) + geom_jitter(
                  aes(x = longitude, y = latitude),
                  data = ufo_2014,
                  alpha = 0.1,
                  na.rm = T) # remove null columns

# Map the Centennial Olympic Park
map <- get_map('30339', zoom =10,
               source = 'stamen', maptype = 'toner-lite')
gd_OlympicPark <- geocode('Centennial Olympic Park, Atlanta, GA')
gd_OlympicPark
ggmap(map) +
  geom_point(aes(x = gd_OlympicPark$lon, y = gd_OlympicPark$lat),
                 size = 5,
                 shape = 4)













































