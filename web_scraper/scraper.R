# showcases use of the rvest package for webscraping comes with tidyverse itself
library(rvest)
library(dplyr)

# going to use a real estate website to scarpe name location and avg price per square feet of properties from pune for this example

# step 1: read the webpage as a XML object

housing <- read_html("https://www.magicbricks.com/flats-in-pune-for-sale-pppfs")
View(housing)

# step 2: scrape by class-name

# this depends on the structure of the webpage, the magic bricks website has the name of the properties under two different classes
property_titles2 <- housing %>% 
  html_nodes(".mb-srp__card__developer--name--highlight") %>% 
  html_text()
property_titles1 <- housing %>% 
  html_nodes(".mb-srp__card__society--name" ) %>% 
  html_text()
# combining to create the titles list
property_titles_all <- c(property_titles2,property_titles1)


# getting the address for the property
property_address <- housing %>% 
  html_nodes(".mb-srp__card--title" ) %>% 
  html_text()

# getting the listed price 
property_listed_value <- housing %>% 
  html_nodes(".mb-srp__card__price--amount" ) %>% 
  html_text()

# bind all the scraped values into one data frame
Properties_pune <- cbind(property_address, property_listed_value)

# View the final data frame
View(Properties_pune)
