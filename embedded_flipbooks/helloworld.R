library(ggplot2)
cars |>
  ggplot() + 
  aes(x = speed, y = dist) +
  geom_point(size = 6)
