#1
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
surveys_wide <- surveys %>% filter(!is.na(hindfoot_length)) %>% 
  group_by(genus, plot_type) %>% 
  summarise(avg_hindfoot_length = mean(hindfoot_length)) %>% 
  pivot_wider(names_from = 'plot_type', values_from = 'avg_hindfoot_length') %>% 
  arrange(Control)

View(surveys_wide)

#2
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)
surveys <- surveys %>% filter(!is.na(weight))
summary(surveys)
#using case_when
surveys %>% mutate(weight_cat = case_when(weight <= 20 ~ 'small', weight > 20 & weight < 48 ~ 'medium', weight >= 48 ~ 'large'))
#using ifelse
surveys %>% mutate(weight_cat = ifelse(weight >= 20, 'small', ifelse(weight > 20 & weight < 48, 'medium', 'large')))
