#add tidyverse
library(tidyverse)

#1
#create "surveys" tibble from existing data
surveys <- read_csv("data/portal_data_joined.csv")
tibble(surveys)

#2
#keep rows with weight between 30 and 60, and print first 6 rows
surveys %>% filter(weight > 30 & weight < 60)
head(surveys)

#3
#create new tibble with max weight for each species + sex combination
biggest_critters <- surveys %>% filter(!is.na(weight)) %>%
  group_by(species_id, sex) %>%
  summarise(max_weight = max(weight))

#4
#are NAs grouped anywhere?
View(tally(biggest_critters, NA))
arrange(biggest_critters, max_weight)

#5
#remove rows in surveys that weight is NA
#add avg weight of each species + sex combination to surveys
#keep only species, sex, weight, and new avg weight column and save as surveys_avg_weight tibble
avg_weight_surveys <- surveys %>% filter(!is.na(weight)) %>% 
  group_by(species_id, sex) %>% 
  mutate(avg_weight = mean(weight)) %>%
  select(species_id, sex, weight, avg_weight)

View(avg_weight_surveys)

#6
#add column called above_average with logical values for whether a row's weight is above avg for species + sex combination
avg_weight_surveys <- avg_weight_surveys %>% mutate(above_average = weight > avg_weight)
View(avg_weight_surveys)
