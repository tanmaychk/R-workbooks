library(tidyverse)
library(tidytuesdayR)
tuesdata<-tidytuesdayR::tt_load('2021-09-14')
billboard <- tuesdata$billboard
audio <-tuesdata$audio_features

View(billboard)
View(audio)

# Hypothesis:
# Are the top songs more cheerful? (Valence -> positivity)

bb1 <- billboard %>% 
  mutate(no1 = (peak_position == 1),week_id = mdy(week_id)) %>% 
  group_by(song_id) %>% 
  arrange(week_position,.by_group=TRUE) %>% 
  filter(!duplicated(song_id)) %>% 
  ungroup() %>% 
  select(song_id,no1)

View(bb1)


# joining the two datasets (audio, bb1)

songs <- bb1 %>% 
  left_join(audio,by="song_id")

view(songs)

# learning about the missing data

mean(is.na(songs$valence))

map_dbl(songs, \(x) mean(is.na(x)))

# about 17.5% data is missing, we can overlook it for now

# answering the question, are number 1 songs more cheerfull?

ggplot(songs, aes(x=valence, y=no1))+geom_boxplot()+theme_minimal()


# as we have one quantitative variable broken down into two qualitative variable so the appropriate test to be done here
# is the two sample t test, not assuming equal variances

t.test(valence ~ no1, data=songs)

# small p-value which tells that infact the valence is different between these two groups
# conclusion: yes no1 songs are more valent i.e more cheerfull
# however, the difference is small

# how large an effect is this?
# lets calculate the Cohens d
# Cohens d is a standardized effect size for measuring the difference between two group means

df <- songs %>% group_by(no1) %>% summarise(avg_val = mean(valence,na.rm=TRUE),var_val = var(valence,na.rm = TRUE))

pooled_sd <- sqrt(sum(df$var_val)/2)

cohens_d <- diff(df$avg_val)/pooled_sd
cohens_d

#0.083 which is a very small number which essentially says that there is a only a minute difference between the two, no large effect size for no1 songs and songs that are not no1 at their valence or cheerfullness level

