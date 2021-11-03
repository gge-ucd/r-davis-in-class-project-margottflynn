library(tidyverse)
gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

#1a. calculate mean life expectancy on each continent
gapminder <- gapminder %>% group_by(continent, year) %>% 
  mutate(mean_lifeExp = mean(lifeExp))

#1b. create a plot that shows how life expectancy has changed over time in each continent
gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")
gapminder %>% ggplot( aes(x = year, y = mean_lifeExp)) +
  geom_line(mapping = aes(color = continent))

#2. Look at the following code and answer the following questions. 
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

#What do you think the scale_x_log10() line of code is achieving? 
#The scale_x_log10() line of code is changing the x axis to a logarithmic scale to better fit the gdp per capita data
#What about the geom_smooth() line of code?
#Geom_smooth() seems to help visualize the overall trend of the scatterplot (like a trendline)

#3. Create a boxplot that shows the life expectency for Brazil, China, El Salvador, Niger, and the United States, 
#with the data points in the backgroud using geom_jitter. 
#Label the X and Y axis with “Country” and “Life Expectancy” and title the plot “Life Expectancy of Five Countries”.
View(gapminder)
countries <- c('Brazil', 'China', 'El Salvador', 'Niger', 'United States')
filter(gapminder, country %in% countries) %>% 
ggplot(aes(x= country, y = lifeExp)) +
  geom_jitter() +
  geom_boxplot(alpha = 0.3) +
  ggtitle("Life Expectancy of Five Countries") +
  xlab("Country") + ylab("Life Expectancy")
