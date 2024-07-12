library(ggplot2)
cars |>
  ggplot() + 
  aes(x = speed, y = dist) +
  geom_point() + 
  aes(size = I(8)) + 
  aes(alpha = I(.7)) + 
  aes(color = I("darkolivegreen")) + 
  aes(shape = I(21)) + 
  aes(fill = I("whitesmoke")) + 
  aes(stroke = I(1.5)) + 
  geom_density2d() + 
  aes(linewidth = I(1)) + 
  aes(shape = I(22))
