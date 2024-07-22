library(ggplot2)
ggplot(cars) + 
  aes(x = speed) + 
  aes(y = dist) + 
  geom_point()
