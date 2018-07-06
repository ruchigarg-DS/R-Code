library('tidyverse')
library('ggplot2')
library("dplyr")
library('lubridate')
library('scales')

"
Today we're spending some time using R in ways
it really shines compared to Python: date-time
handling and plotting. R tends to be really good
at doing things non-programmers need to do with
data. If a historian or literature researcher has
a use case, there's more likely to be an easy-to-
use R implementation than there is to be one in
Python. We've already seen ggplot2, but today we're
introducing lubridate.

The best beginner's resource for lubridate is the
chapter in 'R for Data Science' accessible here:
> http://r4ds.had.co.nz/dates-and-times.html

The lubridate cheatsheet is also excellent:
> https://www.rstudio.com/resources/cheatsheets/

Today we'll cover:
* now()
* today()
* wday(), month(), and year()
* conversion from strings
* time periods

Finally, we'll use lubridate and ggplot2 to investigate
for patterns in Donald Trump's collected tweets!
"

# Exploring lubridate:
# your code here!


# ?lubridate,to open docs

now()
today()

today() + days(10)
today()  + years(10)

# what day
wday(today())
wday(today() + days(7), label = TRUE)

month(today(), label=TRUE)
year(today())

ymd('2018/07/04')
dmy('04/07/18')


# Load in Trump tweets (2016 only)
df <- read.csv('trump_tweets.csv', stringsAsFactors = FALSE)
head(df)


# Filter and reformat
tweets = df %>% 
  filter(is_retweet == 'False') %>% 
  select(text, created_at)

# h/t http://willwest.nyc/using-twitters-timestamp-in-r.html
format.str <- "%a %b %d %H:%M:%S %z %Y"
tweets$timestamp <- as.POSIXct(strptime(tweets[,"created_at"], format.str, tz = "GMT"), tz = "GMT")

tweets$created_at = ymd_hms(tweets$timestamp) # $ stands for dataframe column
head(tweets)

# Plot tweets/day
ggplot(data = tweets, aes(x = created_at, fill = ..count..)) +
  geom_histogram()
  ggtitle('Count of tweets')


# Plot tweets/day of week

ggplot(data = tweets, aes(x = wday(created_at, label = TRUE))) +
  geom_bar(aes(fill = ..count..))


# Plot tweets/month

ggplot(data = tweets, aes(x = month(created_at, label = TRUE))) +
  geom_bar(aes(fill= ..count..))




