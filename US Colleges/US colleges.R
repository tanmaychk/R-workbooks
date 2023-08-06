#Questions to be explored
#Do colleges with larger full time enrollments have lower graduation rates?
#is this different for public and private institutions?
#if it is different for more selective schools?

?College
glimpse(College)

#Exploratory Graphics

ggplot(College,aes(x=Grad.Rate))+geom_histogram() #Note Outlier

#making new filtered data frame to see suspicious college Grad rates
suspicious <- filter(College,Grad.Rate>= 100)
View(suspicious)

#Fulltime UG by (base of 10 to show the scale of the uni) vs Grad Rate
ggplot(College,aes(x=log10(F.Undergrad),y=Grad.Rate))+geom_point()

#making a sub dataframe which uses the log10 of Fulltime UG
college_sm <- College %>%
  mutate(log_full=log10(F.Undergrad))%>%
  select(Grad.Rate,
         log_full,
         Private,
         Top25perc)

view(college_sm)

#LR Model on Full time UG vs Grad Rate
ggplot(College,aes(x=log10(F.Undergrad),y=Grad.Rate))+geom_point()+geom_smooth(method = "lm")

#Flat line, tells that maybe fulltime undergradutes dont have a accurate description of the graduation rates
model_undergrad <- lm(Grad.Rate ~ log_full,data=college_sm)
summary(model_undergrad)
# hence Do colleges with larger full time enrollments have lower graduation rates? there is no apparent relation between the two

#What about Private
ggplot(College,aes(x=log10(F.Undergrad),y=Grad.Rate,color=Private))+geom_point()+geom_smooth(method = "lm",se=FALSE)+scale_color_brewer(palette = 'Dark2')

model_private <- lm(Grad.Rate ~ Private + log_full,data=college_sm)
summary(model_private)

#evident that a provate college sees significantly higher grad rates compared to non-private colleges

#what about the Top25perc or more selctive unis?

model_top <- lm(Grad.Rate ~ Private+log_full+Top25perc,data=college_sm)
summary(model_top)
plot(model_top)

#the model summary indicates with the low p values that Private or public school and the top25 percent schools are important indicators of Graduation Rates


