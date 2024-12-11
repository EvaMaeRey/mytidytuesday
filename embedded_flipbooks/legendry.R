library(tidyverse)
library(legendry)
data.frame(
  category = c("Meat", "Meat", "Vegetables", "Vegetables", "Dairy"),
  food     = c("Beef", "Chicken", "Carrots", "Onions", "Cheese"),
  gram     = c(85,  85, 150, 210, 225),
  calories = c(245, 185, 45, 80, 240)) %>% 
  mutate(food_category = interaction(food, category)) |>
  ggplot() +
  theme_classic() +
  aes(food_category, calories) +
  geom_col() +
  guides(x = "axis_nested") +
  labs(x = NULL) +
  guides(y = guide_axis_nested(key_range_manual(0, 100, "low calories"))) +
  aes(fill = paste(category, food)) +
  guides(fill = "legend_group") +
  labs(fill = NULL) + 
  theme_classic() +
  theme(axis.text.y.left = element_text(angle = 90, hjust = 0.5))
