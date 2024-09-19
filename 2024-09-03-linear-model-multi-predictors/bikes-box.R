library(dsbox)
dcbikeshare %>%
  mutate(atemp_raw = atemp * 50) %>%
  ggplot(mapping = aes(x = dteday, y = cnt)) +
    geom_point() +
    labs(
      title = "Bike rentals in DC, 2011 and 2012",
      subtitle = "Warmer temperatures associated with more bike rentals",
      x = "Date",
      y = "Bike renrals",
      color = "Temperature (C)"
    ) +
  geom_lm(alpha = .2) +
  geom_text(stat = StatLmGlance, size = 5) +
  stat_lm(geom = 'segment', alpha = .2) + 
  aes(color = atemp_raw) + 
  theme_minimal() + 
  aes(shape = as.factor(season)) + 
  aes(season = as.factor(season)) +
  aes(holiday = holiday) +
  aes(workingday = workingday) +
  aes(dteday = dteday) +
  aes(atemp_raw = atemp_raw)
