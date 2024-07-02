library(tidyverse)
library(ggcirclepack)
read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-02-20/isc_grants.csv") |>
  ggplot() + 
  aes(area = funded, 
      id = proposed_by %>% str_replace(" ", "\n"), 
      fill = group) + 
  geom_circlepack(fun = mean) + 
  geom_circlepack_text(fun = mean, lineheight = .8,
                       color = "whitesmoke") +
  coord_equal() + 
  aes(text = title) + 
  aes(label = after_stat(paste(id,"\n", area))) + 
  facet_wrap(~year) + 
  ggstamp::theme_void_fill("whitesmoke") + 
  scale_size(range = c(-3, 5), transform = "sqrt")


read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-02-20/isc_grants.csv") |>
  ggplot() + 
  aes(area = funded, 
      id = "All") + 
  geom_circlepack(fun = mean) + 
  geom_circlepack_text(fun = mean, 
                       lineheight = .8,
                       color = "whitesmoke")  + 
  aes(label = round(after_stat(area))) +
  coord_equal()

last_plot() + 
  facet_wrap(~year)

last_plot() + 
  aes(fill = group)

last_plot() + 
  aes(id = proposed_by)

last_plot() + 
  aes(label = str_wrap(after_stat(paste(id, round(area))), 5))
  


read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-02-20/isc_grants.csv") |>
  ggplot() + 
  aes(area = funded, 
      id = "All") + 
  geom_circlepack() + 
  geom_circlepack_text(
                       lineheight = .8,
                       color = "whitesmoke")  + 
  aes(label = round(after_stat(area))) +
  coord_equal()

