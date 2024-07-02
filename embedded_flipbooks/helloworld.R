library(ggplot2)
ggplot(cars) +
  aes(speed, dist) + 
  geom_point()
