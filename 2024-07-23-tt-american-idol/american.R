library(ggcirclepack)
songs %>%
  ggplot() + 
  aes(id = "All") +
  geom_circlepack() + 
  geom_circlepack_text() +
  aes(fill = I("aliceblue")) +
  coord_equal() +
  aes(id = paste(song, artist)) + 
  aes(label = after_stat(area)) + 
  data_mutate_filter(.value = n(), .by = song, keep = .value >= 5) +
  aes(label = str_wrap(after_stat(id), 12)) + 
  scale_size(range = c(2,3)) +
  data_mutate_filter(.value = n(), .by = c(song, artist), keep = .value >= 5) +
  NULL
