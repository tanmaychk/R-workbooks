# Load in the data

df = read.csv('insurance.csv', header =TRUE)

# find all the numeric columns
nums_cols <- unlist(lapply(df, is.numeric))
plot(df[,nums_cols])


# finding Co-relations
round(cor(df[,nums_cols]),2)

# charges by other attributes
smoker =  as.factor(df$smoker)
sex  =  as.factor(df$sex)
region =  as.factor(df$region)

boxplot(df$charges ~ smoker , main="Smoker")
boxplot(df$charges ~ sex , main="sex")
boxplot(df$charges ~ region , main="region")

# using linear regression to predict the charges and viewing summary of the model to find best 
# attributes

model1 =  lm(charges ~.,data=df)

summary(model1)

# r squared value in 0.75 i.e 75% of the variance of the charges can be explained by the model
# the variables that are important are 
# age, sex, bmi, number of children, smoker or not
