# today: basic dataframe operations
# tomorrow: random forest model
# friday: logistic regressions/glms

install.packages(c('titanic', 'ggplot2'))

# analogous to import
library(titanic)
library(ggplot2)

# initiating the train and test variables
train <- titanic_train
test <- titanic_test

# take a look at our data
# df.head()
head(train)
summary(train)

# select a column by name using dataframe$ColumnName
train$Pclass

# summary functions work on columns too
mean(train$Age)
mean(train$Pclass)

# why does mean(train$Age) return NA?
#summary will give us count of NA's
summary(train$Age)

df <- na.omit(train)

mean(df$Age)
print('Mean survival rate: '); print(mean(df$Survived))

#plt.plot(), plt.title()
# plot the Age against Fare

# we add components to ggplot
ggplot(data = df, aes(x=Age, y=Fare, color=Sex)) +
  geom_point() +
ggtitle('Titanic Age vs. Fare', subtitle='Thrilling.')

# elementary feature engineering
df$Child <- 0
df$Child[df$Age < 18] <-  1 # assign value 1 where age > 18
df$Child





















