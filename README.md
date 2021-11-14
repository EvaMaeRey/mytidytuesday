
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mytidytuesday git repo

<!-- badges: start -->
<!-- badges: end -->

The goal of mytidytuesday is to hold the little projects, in the spirit
of tidy tuesday.

``` r
library(magrittr)
#> Warning: package 'magrittr' was built under R version 3.6.2
webpages <- fs::dir_ls(type = "file", recurse = T, glob = "*.html")

webpages %>% 
  paste0("https://evamaerey.github.io/mytidytuesday/", ., "\n") %>% 
  cat()
```

<https://evamaerey.github.io/mytidytuesday/2021-10-19-great-pumpkin/memory.html>
<https://evamaerey.github.io/mytidytuesday/2021-10-19-great-pumpkin/memory_input.html>
<https://evamaerey.github.io/mytidytuesday/2021-10-31-anscombes-quartet/anscombes.html>
<https://evamaerey.github.io/mytidytuesday/2021-10-31-anscombes-quartet/anscombes_exploded.html>
<https://evamaerey.github.io/mytidytuesday/2021-11-03-geom-text-lm-fitted/geom_text_lm_fitted.html>
<https://evamaerey.github.io/mytidytuesday/2021-11-03-geom-text-lm-fitted/geom_text_lm_fitted_exploded.html>
<https://evamaerey.github.io/mytidytuesday/2021-11-04-stamp-capybara/stamp_capybara.html>
<https://evamaerey.github.io/mytidytuesday/2021-11-04-stamp-capybara/stamp_fish.html>
<https://evamaerey.github.io/mytidytuesday/2021-11-04-stamp-capybara/stamp_fish_seuss.html>
<https://evamaerey.github.io/mytidytuesday/2021-11-04-stamp-capybara/stamp_fishes.html>
<https://evamaerey.github.io/mytidytuesday/2021-11-04-stamp-capybara/stamp_potato.html>
