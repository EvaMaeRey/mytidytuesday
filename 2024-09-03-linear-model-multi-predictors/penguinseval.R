palmerpenguins::penguins %>% 
  ggplot() + 
  aes(y = flipper_length_mm, x = bill_depth_mm) + 
  geom_point() + 
  geom_point(stat = StatLm, alpha = .25) + 
  geom_segment(stat = StatLm, alpha = .25) +
  aes(color = species) + aes(species = species) + 
  aes(shape = sex) + 
  aes(body_mass_g = body_mass_g) + 
  aes(bill_length_mm = bill_length_mm) + 
  aes(island = island)  + 
  aes(year = year)
