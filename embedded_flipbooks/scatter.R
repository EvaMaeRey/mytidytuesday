ggplot(data = gapminder_2002) + 
  aes(y = lifeExp) + 
  aes(x = gdpPercap) + 
  geom_point() + 
  aes(size = pop/1000000000) + 
  aes(color = continent) 
