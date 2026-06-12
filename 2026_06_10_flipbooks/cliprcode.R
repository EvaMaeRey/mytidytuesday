library(tidyverse)
library(ggcube)
ggplot(data = mammoth_df) +
  coord_3d(expand = FALSE,
           ratio = c(1.5,1,1.4),
           yaw = -10,
           light = light(direction = c(1, 0, 0))) +
  aes(x = V1) + 
  aes(y = V3) + 
  aes(z = V2) + 
  coord_3d() + 
  geom_point_3d() +
  aes(shape = I(21)) + 
  aes(fill = I(confetti) ) +
  aes(color = I("white")) +
  aes(stroke = .2)
