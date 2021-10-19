#in-class challenge questions
#select only species id, add new column called hindfoot_half containing values that are half the hindfoot_length
#in this new column there are no NAs and all values are less than 30

surveys_hindfoot_half <- surveys %>% filter(!is.na(hindfoot_length)) %>%
  mutate(hindfoot_half = hindfoot_length/2) %>%
  select(species_id, hindfoot_half) %>%
  filter(hindfoot_half <30)
surveys_hindfoot_half

#group by and summarize, use to find the mean, min, and max hindfoot length for each species (using species_id)
surveys_summary_stats <- surveys %>%
  filter(!is.na(hindfoot_length)) %>%
group_by(species_id) %>%
  summarise(mean(hindfoot_length), min(hindfoot_length), max(hindfoot_length))
surveys_summary_stats

