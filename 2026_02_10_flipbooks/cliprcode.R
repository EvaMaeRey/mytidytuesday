pca_prep |>
  juice() %>%
  ggplot() +
  aes(PC1, PC2) +
  geom_point(alpha = 0.6, 
             size = 2) +
  aes(color = category) +
  aes(label = name) + 
  geom_text(check_overlap = TRUE, 
            hjust = "inward", 
            color = "black") +
  labs(color = NULL) + 
  facet_wrap(facet = 
               vars(category)) + 
  aes(color = I("gray"))
