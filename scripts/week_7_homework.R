library(tidyverse)
#To get the population difference between 2002 and 2007 for each country, it would probably be easiest to have a country in each row and a column for 2002 population and a column for 2007 population.
#Notice the order of countries within each facet. You’ll have to look up how to order them in this way.
#Also look at how the axes are different for each facet. Try looking through ?facet_wrap to see if you can figure this one out.
#The color scale is different from the default- feel free to try out other color scales, just don’t use the defaults!
#The theme here is different from the default in a few ways, again, feel free to play around with other non-default themes.
#The axis labels are rotated! Here’s a hint: angle = 45, hjust = 1. It’s up to you (and Google) to figure out where this code goes!
#Is there a legend on this plot?


gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

gapminder_new <- gapminder %>% filter(year %in% c(2002, 2007)) %>% 
  pivot_wider(id_cols = c(country, continent), names_from = year,values_from = pop) %>% 
  mutate(popDiff = `2007` - `2002`) %>% 
  filter(continent != "Oceania")

ggplot(gapminder_new) + facet_wrap(~ continent, scales = 'free') +
  geom_bar(aes(x = reorder(country, popDiff), y = popDiff),stat = 'identity') +
  labs(x = 'Country', y= 'Change in pop. 2002-2007') + 
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45))


