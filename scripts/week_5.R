library(tidyverse)
# Conditional statements

surveys %>%
  filter(!is.na(weight)) %>% # get rid of NAs
  mutate(weight_cat = case_when(weight > mean(weight) ~ "big",
                                weight < mean(weight) ~ "small")) %>% # assign column values
  select(weight, weight_cat) %>% # select just take make our viewing better
  tail() # look at the bottom 6

# Using the iris data frame (this is built in to R), create a new variable that categorizes petal length into three groups:
#small (less than or equal to the 1st quartile)
#medium (between the 1st and 3rd quartiles)
#large (greater than or equal to the 3rd quartile)
#Hint: Explore the iris data using summary(iris$Petal.Length), to see the petal 
#length distribution. Then use your function of choice: ifelse() or case_when() to 
#make a new variable named petal.length.cat based on the conditions listed above. 
#Note that in the iris data frame there are no NAs, so we don’t have to deal with 
#them here.

data(iris)
summary(iris$Petal.Length)
iris %>% 
  mutate(petal.length.cat = case_when(Petal.Length <= 1.6 ~ "small", 
                                      Petal.Length < 5.1 & Petal.Length > 1.6 ~ "medium", 
                                      Petal.Length >= 5.1 ~ "large"))

#practice joining
library(tidyverse)
surveys = read_csv('data/portal_data_joined.csv')
tail_length = read_csv('data/tail_length.csv')

intersect(colnames(surveys), colnames(tail_length))
combo_data_frame <- left_join(surveys, tail_length)
str(combo_data_frame)

#practice pivoting
str(surveys)
temp_df <- surveys %>% group_by(year, plot_id) %>% tally()
pivot_wider(temp_df, names_from = 'year', values_from = 'n')

?n_distinct
