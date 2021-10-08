# load in surveys

read.csv("data/portal_data_joined.csv")
surveys <- read.csv("data/portal_data_joined.csv")
surveys

# refine data to only a few columns and 60 rows
surveys_base <- surveys[1:60, c("species_id","weight","plot_type")]
surveys_base

# convert plot type and id to factors
surveys_base$species_id <-as.factor(surveys_base$species_id)
surveys_base
surveys_base$plot_type <-as.factor(surveys_base$plot_type)
surveys_base

# characters are text while factors store both integer values as levels and corresponding character values

# remove rows where weight is NA
surveys_base_clean <- surveys_base[complete.cases(surveys_base), ]
surveys_base_clean

# CHALLENGE: select weights > 150
challenge_base <- surveys_base_clean[(surveys_base_clean[, 'weight']>150),]
challenge_base
