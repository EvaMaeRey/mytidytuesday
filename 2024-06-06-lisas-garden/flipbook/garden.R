library(tidyverse)

harvest_2021 <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-05-28/harvest_2021.csv')
spending_2021 <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-05-28/spending_2021.csv')


spending_2021 %>% 
  ggplot() + 
  labs(title = "Lisa's Garden Spending, 2021") +
  aes(area = price, id = "All") + 
  ggcirclepack::geom_circlepack(show.legend = F, 
                                color = "black", 
                                linewidth = .15) + 
  coord_equal() + 
  ggcirclepack::geom_circlepack_text(show.legend = F) +
  ggstamp::theme_void_fill()  + 
  aes(label = after_stat(paste0(id, "\n$", area))) + 
  aes(fill = I("aliceblue"))

last_plot() +
  aes(id = vegetable) + 
  labs(title = "Spending breakdown") + 
  aes(label = after_stat(paste0(id, "\n$", area)))

last_plot() %+% 
  harvest_2021 + aes(area = weight) + 
  labs(title = "Lisa's Garden 2021, Harvest") + 
  aes(label = after_stat(paste0(id, "\n", round(area/1000), "kg"))) +
  aes(fill = I("lightsalmon3")) + 
  aes(color = I("grey90"))

last_plot() +
  aes(id = "All") + 
  labs(title = "Harvest, Aggregate") 

harvest_2021 %>% 
  count(wt = weight)
