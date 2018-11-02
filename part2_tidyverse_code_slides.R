
library(tidyverse)

## tibbles

tibble(a = 1:26, b = letters)
as_tibble(iris)
iris_tibble <- as_tibble(iris)
as.data.frame(iris_tibble)

## readr

write_csv(iris, "data/iris.csv")

## visualisation

qplot(iris$Species) + ggsave("figures/iris_species_bar.png")
qplot(iris$Species, iris$Petal.Length) + ggsave("figures/iris_species_length_scatter.png")
qplot(iris$Petal.Length, iris$Petal.Width, colour=iris$Species) + ggsave("figures/iris_species_width_length_scatter.png")

ggplot(iris) + ggsave("figures/ggplot_empty.png")
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour=Species)) + ggsave("figures/ggplot_aes.png")
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour=Species)) + geom_point() + ggsave("figures/ggplot_aes_geom.png")

ggplot(iris, aes(x = Species, y = Petal.Length * Petal.Width)) + 
  geom_boxplot()


ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour=Species)) + 
  geom_point() + 
  stat_density_2d() + ggsave("figures/ggplot_density.png")




iris %>% group_by(Species) %>% summarise(mean(Petal.Length * Petal.Width))


## transform
filter(iris_tibble, Species=="virginica")
filter(iris_tibble, Species=="virginica", Sepal.Length>= 7.5)
filter(iris_tibble, Species=="virginica" & Sepal.Length>= 7.5)
filter(iris_tibble, Species)

