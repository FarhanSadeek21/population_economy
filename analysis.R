# Necessary Libraries
library(tidyverse) # Data Visualization, Wrangling

# Reading as CSV
pop_den_grow <- read.csv('Population, Growth and Density Data.csv')

### Data Cleaning


# Dropping cca2 and rank column
# pop_den_grow <- select(pop_den_grow, -c(cca2, rank))
# Dropping null values
pop_den_grow <- pop_den_grow |>
    drop_na() |>
    mutate(GrowthRate = 100 * (GrowthRate - 1))


View(pop_den_grow)

# Fastest Growing Countries in the World
pop_den_grow[order(-pop_den_grow$GrowthRate),]|>
    select(name, GrowthRate, continent) |>
    filter(continent ==  'Asia') |>
    head(10)

# Visualizations

# Population and Growth Rate
pop_den_grow |>
    select(pop2022, GrowthRate, continent) |>
    ggplot(aes(GrowthRate, pop2022, color = continent)) +
    geom_point()


# Population and Density
pop_den_grow |>
    drop_na() |>
    select(pop2022, Density, continent) |>
    ggplot(aes(log(Density), log(pop2022), color = continent)) +
    geom_point()


# Area and Density
pop_den_grow |>
    drop_na() |>
    select(area, Density, continent) |>
    ggplot(aes(log(Density), log(area), color = continent)) +
    geom_point()
