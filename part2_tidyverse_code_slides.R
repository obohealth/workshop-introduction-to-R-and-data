
library(tidyverse)

## tibbles

tibble(a = 1:26, b = letters)
as_tibble(iris)
iris_tibble <- as_tibble(iris)
as.data.frame(iris_tibble)

## readr

write_csv(iris, "data/iris.csv")

## visualisation

qplot(iris$Species) + ggsave("figures/iris_species_bar.png", width=8, height=5)
qplot(iris$Species, iris$Petal.Length) + ggsave("figures/iris_species_length_scatter.png", width=8, height=5)
qplot(iris$Petal.Length, iris$Petal.Width, colour=iris$Species) + ggsave("figures/iris_species_width_length_scatter.png", width=8, height=5)

ggplot(iris) + ggsave("figures/ggplot_empty.png")
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour=Species)) + ggsave("figures/ggplot_aes.png", width=8, height=5)
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour=Species)) + geom_point() + ggsave("figures/ggplot_aes_geom.png", width=8, height=5)


ggplot(iris, aes(x = Species, y = Petal.Length)) + 
  geom_boxplot() + ggsave("figures/ggplot_boxplot.png", width=8, height=5)

ggplot(iris, aes(x = Species, y = Petal.Length)) + 
  geom_boxplot() + 
  geom_point(colour='red') + ggsave("figures/ggplot_multigeom.png", width=8, height=5)


ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour=Species)) + 
  geom_point() + 
  stat_density_2d() + ggsave("figures/ggplot_density.png", width=8, height=5)




iris %>% group_by(Species) %>% summarise(mean(Petal.Length * Petal.Width))


## transform
filter(iris, Species=="virginica")
filter(iris, Species=="virginica", Sepal.Length>= 7.5)
filter(iris, Species=="virginica" & Sepal.Length>= 7.5)

select(iris, Sepal.Length, Sepal.Width, Species)
select(iris, starts_with("Sepal"), Species)
select(iris, -starts_with("Petal"))

mutate(iris, petal_area = pi * Petal.Length * Petal.Width)

mutate(iris, 
       petal_area = pi * Petal.Length * Petal.Width)

mutate(iris, petal_area = pi * Petal.Length * Petal.Width, Species_abbr = substring(Species, 1, 3))

mutate(iris, 
       # compute the area of a single petal
       petal_area = pi * Petal.Length * Petal.Width, 
       # abbraviate the name of the species
       Species_abbr = substring(Species, 1, 3)
) %>% head()


# spread and gather
iris_obs <- mutate(iris, observation = 1:n())
iris_obs

iris_long <- gather(iris_obs, measurement, value, -Species, -observation) %>% arrange(observation)
iris_long

iris_wide <- spread(iris_long, measurement, value)
iris_wide

ggplot(iris_long, aes(measurement, value)) + geom_boxplot()  + ggsave("figures/long_ggplot.png", width=8, height=5)



useR <- function(){
  print("Good luck and see you!")
}
useR()

