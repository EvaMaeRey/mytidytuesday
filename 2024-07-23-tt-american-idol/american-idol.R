library(ggcirclepack)
songs %>%
  ggplot() + 
  aes(id = "All") +
  geom_circlepack() + 
  geom_circlepack_text(aes(lineheight = I(.7))) +
  aes(fill = I("aliceblue")) +
  coord_equal() +
  aes(id = artist) +
  aes(label = after_stat(area)) + 
  data_mutate_filter(n(), c(artist), .value >= 15) +
  aes(label = str_wrap(after_stat(id), 12)) + 
  data_filter(artist == "Stevie Wonder") + 
  aes(fill = I("plum1")) +
  aes(id = song) +
  aes(label = str_wrap(after_stat(paste0(id, " ", 
                                         area, "X")), 12)) +
  scale_size(range = c(2,3)) +
  data_replace(data = songs |> 
                 filter(artist == "Stevie Wonder") |>
                 mutate(song = str_remove(song, "\\(Stevie Wonder\\)")) |>
                 mutate(song = str_replace(song, "bout", "Bout"))) ->
  p
                

p$data ->
songs_stevie_cleaned

