
# NRC sentiment analysis

install.packages(c('syuzhet', 'tm', 'stringr', 'wordcloud'))
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

library(tidyverse)

library(syuzhet)
library(tm)
library(stringr)
library(wordcloud)

tweets_text <- tweets$text

corpus <-  Corpus(VectorSource(tweets_text))

clean_corpus <- tm_map(corpus, content_transformer(removePunctuation))

clean_corpus <- tm_map(clean_corpus, content_transformer(tolower))

clean_corpus <- tm_map(clean_corpus, removeWords, stopwords('english'))

clean_corpus <-  tm_map(clean_corpus, stripWhitespace)

clean_corpus

set.seed(42)

wordcloud(words = clean_corpus, max.words = 150, 
          random.order = FALSE,
          colors = cbPalette)

tdm <- TermDocumentMatrix(clean_corpus)
tdm

inspect(tdm[10:20, 10:50])

sents <-  get_nrc_sentiment(tweets_text)
head(sents)

tweets_sentiments <- cbind(tweets, sents)
head(tweet_sentiments)

colnames(tweets_sentiments)

tweets_sentiments %>% 
  select(text, anger) %>% 
  top_n(5, anger)

tweets_sentiments %>% 
  select(text, joy) %>% 
  top_n(5, joy)


tweets_sentiments %>% 
  select(text, trust) %>% 
  top_n(5, trust)















