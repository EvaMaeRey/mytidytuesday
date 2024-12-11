library(tidyverse)
library(legendry)
data.frame(
  category = c("Meat", "Meat", "Vegetables", "Vegetables", "Dairy"),
  food     = c("Beef", "Chicken", "Carrots", "Onions", "Cheese"),
  gram     = c(85,  85, 150, 210, 225),
  calories = c(245, 185, 45, 80, 240)) %>% 
  mutate(food_category = interaction(food, category)) |>
  mutate(category_food = paste(category, food)) |>
  ggplot() +
  theme_classic() +
  aes(x = food_category, 
      y = calories) +
  geom_col() +
  aes(fill = category_food) +
  guides(x = "axis_nested") +
  guides(fill = "legend_group") +
  labs(x = NULL, fill = NULL) + 
  guides(y = guide_axis_nested(
    key_range_manual(0, 100, "low calories"))
    ) +
  theme_classic() +
  theme(axis.text.y.left = 
          element_text(angle = 90, hjust = 0.5))
