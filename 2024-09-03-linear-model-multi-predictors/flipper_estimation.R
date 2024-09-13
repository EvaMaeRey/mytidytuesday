palmerpenguins::penguins %>% 
  head(2)

ggplot(palmerpenguins::penguins) + 
  aes(y = flipper_length_mm, x = bill_depth_mm) + 
  geom_point(color = "Black") +
  aes(bill_depth_mm = bill_depth_mm) +
  geom_lm(alpha = .2) +
  geom_text(stat = StatLmGlance, size = 5) +
  stat_lm(geom = 'segment', alpha = .2) +
  aes(color = species) + 
  aes(shape = sex) + 
  aes(island = island) + 
  aes(body_mass_g = body_mass_g)

return_model()

