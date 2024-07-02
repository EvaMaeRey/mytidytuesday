tidy_titanic %>% 
  ggplot() + 
  facet_grid(~Sex) + # specify table layout
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        text = element_text(size = 22)) +
  stat_tableprop(geom = "tile") + 
  aes(fill = after_stat(prop_within)) + 
  stat_tableprop() + 
  facet_grid(Sex ~ Survived) + 
  aes(label = after_stat(prop_label)) +
  aes(label = after_stat(percent_label)) + 
  aes(prop_within = Sex) + 
  aes_label_count_percent() +
  aes_label_percent_count() + 
  facet_grid(rows = vars(Sex),
             cols = vars(Age, Survived)) + 
  aes(prop_within = NULL) +
  facet_grid(rows = vars(Age)) 
