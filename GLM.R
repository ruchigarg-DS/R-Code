library(titanic)
'
This lesson will introduce:
* Deleting variables from memory
* Attaching and detaching data
*Generalized linear models (logistic and Poisson)
'

# we can remove variables from memory

rm(list=ls())

# where am I?
getwd()

# %whos in python lists all stored variables
ls()

x = 'hello world'

rm(x)

df <- titanic_train

# Shift + CMD + C to comment
# attach(df) allows us to reference columns by name,
# without having to use df$col_name

attach(df)

Survived

SibSp

detach(df)
attach(df)

#  Side note -- we can view the table either by double-clicking
# it in the global environment , or by running:
View(df)

#  printing out Survived without df$:

Survived

# fit a logistic regression model

fit <- glm(Survived ~ Pclass + Fare + Parch + SibSp, family = binomial())
fit

summary(fit)
confint(fit)
coef(fit)
# fit$coefficients
exp(coef(fit))

# Poisson distribution

fit <- glm(SibSp ~ Pclass + Fare , family = poisson())
fit


























