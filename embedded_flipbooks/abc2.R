abc_df <- ggdoremi:::join_phrases_drm_lyrics(drm_phrases = drm_abc, 
                                   lyrics_phrases = lyrics_abc)  

abc_df %>% 
  ggplot() + 
  aes(radius = as.numeric(drm) - 2) +
  stamp_staff_dms(-2) +
  geom_dandalion_segment(color = "black", 
                         size = .5) +
  geom_dandalion_point(size = 13, 
                       fill = "white",
                       shape = 21) +
  aes(label = lyric) +
  geom_dandalion_text() +
  coord_equal() + 
  theme_void() + 
  aes(size = 5) + 
  scale_size(range = c(3,5))

last_plot() %+%
  (ggdoremi:::join_phrases_drm_lyrics(drm_abc, 
                                   lyrics_abc)[1:26,]) + 
  aes(size = 8) + 
  theme(legend.position = "none")
