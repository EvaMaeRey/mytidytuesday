tidy_titanic %>% 
  ggtable() + 
  facet_grid(~ Sex) + # specify table layout
  facet_grid(Sex ~ Survived) + 
  aes(label = after_stat(prop_label)) +
  aes(label = after_stat(percent_label)) + 
  aes(prop_within = Sex) + 
  aes_label_count_percent() +
  aes(prop_within = Survived) + 
  aes(prop_within = Sex) + 
  aes_label_percent_count() + 
  facet_grid(rows = vars(Sex),
             cols = vars(Age, Survived)) + 
  aes(prop_within = Age) +
  facet_grid(rows = vars(Age)) +
  aes(prop_within = NULL)


