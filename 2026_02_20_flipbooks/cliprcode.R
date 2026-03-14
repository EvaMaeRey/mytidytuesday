gapminder::gapminder |> 
  filter(country %in% c("France") ) |> 
  ggplot() + 
  aes(x = year,
      y = lifeExp) + 
  geom_line() + 
  aes(y2 = gdpPercap) +
  geom_line_sec_axis()
