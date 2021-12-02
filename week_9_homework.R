library(tidyverse)

#load in mloa dataset
mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

head(mloa)

#remove observations with missing values in rel_humid, temp_C_2m, and windSpeed_m_s
mloa %>%
  filter(rel_humid != -99) %>% 
  filter(temp_C_2m != -999.9) %>% 
  filter(windSpeed_m_s!= -999.9)

#Generate a column called “datetime” using the year, month, day, hour24, and min columns

mloa %>%
  filter(rel_humid != -99) %>% 
  filter(temp_C_2m != -999.9) %>% 
  filter(windSpeed_m_s!= -999.9) %>% 
  mutate(datetime = )