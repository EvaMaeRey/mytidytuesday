oregon_population_pyramid_data %>%
  filter(county == "Baker") %>%
  ggplot() + 
  aes(x = percent*100, 
      y = fct_inorder(age), 
      pyramid_cat = gender) +
  geom_rect(stat = StatPyramid,
            sep = 1) + 
  aes(label = age)  + 
  geom_text(stat = StatPyramidlabel) + 
  scale_x_continuous(breaks = c(-10:0 - 1, 0:10 + 1),
                     labels = paste0(c(10:0, 0:10), "%"),
                     limits = c(-10,10)) + 
  labs(y = NULL, x = NULL, fill = NULL) + 
  theme(axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        legend.position = "top",
        legend.justification = "left", 
        panel.grid = element_blank(),
        panel.background = element_rect(fill = "whitesmoke")
        )
