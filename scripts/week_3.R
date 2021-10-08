# loading data in
surveys <- read.csv("data/portal_data_joined.csv")

surveys
class(surveys)
str(surveys)
surveys["species_id"]
surveys[,"species_id"]
surveys[200,]

# create a data frame of row 200 of surveys
surveys200 <- surveys[200,]

str(surveys)
nrow(surveys)

# create a data frame of the last row of surveys
surveys_last <- surveys[34786,]

surveys_last

nrow(surveys)/2

# create data frame from row in the middle of surveys
surveys_middle <- surveys[17393,]

surveys_head <- surveys[-(7:nrow(surveys)), ]
surveys_head

library(tidyverse)

#tidyverse time!
t_surveys <- tibble(surveys)
read_csv("data/portal_data_joined.csv")

t_surveys

class(t_surveys)
