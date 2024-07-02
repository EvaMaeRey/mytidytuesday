tidy_titanic %>% 
  ggplot() + 
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        text = element_text(size = 22)) +
  guides(fill = "none") +
  stat_tableprop(geom = "tile") + 
  stat_tableprop() + 
  facet_grid(~ Sex) + # specify table layout
  facet_grid(Sex ~ Survived) + 
  aes(label = after_stat(prop_label)) +
  aes(label = after_stat(percent_label)) + 
  aes(prop_within = Sex) + 
  aes(label = after_stat(count_percent_label)) +
  aes(label = after_stat(percent_count_label)) +
  facet_grid(rows = vars(Sex),
             cols = vars(Age, Survived)) + 
  aes(prop_within = Sex) + 
  aes(prop_within = Age) +
  facet_grid(rows = vars(Age)) +
  aes(prop_within = NULL) + 
  aes(label = after_stat(sum))
