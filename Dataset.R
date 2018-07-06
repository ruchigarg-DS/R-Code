# goals:
# - load a dataset
# - implement logistic regression
# - evaluate model accuracy
# - test normality of residuals

# import libraries
library(ggplot2)

head(cars)
df <- cars

# correlation between speed and dist:
cor(df$speed, df$dist)

# scatterplot aggplot2
ggplot(df, aes(speed, dist)) +
  geom_point() +
  geom_smooth(method = lm)
  ggtitle('speed vs. stopping distance')
  
# distance ~ speed 
# y = dist
# X = speed
  
  # Caroline used to translate ~ as 
  # "as explained by"
model <- lm(dist ~ speed, data = df)

# if we had mutiple variables, might
# look like
#lm(dist ~ speed + mpg, data= df)

summary(model)  
  
model$residuals
# gives item /std deviation
residuals.standardize <-  rstandard(model)
plot(residuals.standardize)  

# lots how close to our normal distribution 
#our standardized residuals are  

qqnorm(residuals.standardize)
qqline(residuals.standardize) 
 
 
# plot preds vs actual?
predict(linMod)

df$preds <- predict(linMod)

ggplot(df, aes(dist, preds)) + 
  geom_point() + 
  ggtitle('Actual vs. Predicted Stopping Distances')

# an excercise for you:

# ggplot2 has an inbuilt dataset called 'diamonds' of
# diamond features and prices.

# make a linear regression model predicting diamond
# prices based off of just one feature.

# BONUS: what metric might you check in choosing just
# one variable so as to maximize accuracy?

head(diamonds)

# BONUS: fit a regression model using x, y, and z

  
  
  
  