
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mytidytuesday git repo

<!-- badges: start -->
<!-- badges: end -->

The goal of mytidytuesday is to hold the little projects, in the spirit
of tidy tuesday.

``` r
library(magrittr)
#> Warning: package 'magrittr' was built under R version 3.6.2
webpages <- fs::dir_ls(type = "file", recurse = T, glob = "*.html") %>% rev()

webpages %>% 
  paste0("- [",
         . ,
         "]",
         "(https://evamaerey.github.io/mytidytuesday/", ., ")\n") %>% 
  cat()
```

-   [2021-12-24-holiday-card/holiday\_card\_flipbook.html](https://evamaerey.github.io/mytidytuesday/2021-12-24-holiday-card/holiday_card_flipbook.html)
-   [2021-11-26-circle-of-fifths/circle\_of\_fifths\_flipbook.html](https://evamaerey.github.io/mytidytuesday/2021-11-26-circle-of-fifths/circle_of_fifths_flipbook.html)
-   [2021-11-14-datasaurus/datasauRus\_flipbook.html](https://evamaerey.github.io/mytidytuesday/2021-11-14-datasaurus/datasauRus_flipbook.html)
-   [2021-11-14-datasaurus/datasauRus.html](https://evamaerey.github.io/mytidytuesday/2021-11-14-datasaurus/datasauRus.html)
-   [2021-11-04-stamp-capybara/stamp\_potato.html](https://evamaerey.github.io/mytidytuesday/2021-11-04-stamp-capybara/stamp_potato.html)
-   [2021-11-04-stamp-capybara/stamp\_fishes.html](https://evamaerey.github.io/mytidytuesday/2021-11-04-stamp-capybara/stamp_fishes.html)
-   [2021-11-04-stamp-capybara/stamp\_fish\_seuss.html](https://evamaerey.github.io/mytidytuesday/2021-11-04-stamp-capybara/stamp_fish_seuss.html)
-   [2021-11-04-stamp-capybara/stamp\_fish.html](https://evamaerey.github.io/mytidytuesday/2021-11-04-stamp-capybara/stamp_fish.html)
-   [2021-11-04-stamp-capybara/stamp\_capybara.html](https://evamaerey.github.io/mytidytuesday/2021-11-04-stamp-capybara/stamp_capybara.html)
-   [2021-11-03-geom-text-lm-fitted/geom\_text\_lm\_fitted\_exploded.html](https://evamaerey.github.io/mytidytuesday/2021-11-03-geom-text-lm-fitted/geom_text_lm_fitted_exploded.html)
-   [2021-11-03-geom-text-lm-fitted/geom\_text\_lm\_fitted.html](https://evamaerey.github.io/mytidytuesday/2021-11-03-geom-text-lm-fitted/geom_text_lm_fitted.html)
-   [2021-10-31-anscombes-quartet/anscombes\_exploded.html](https://evamaerey.github.io/mytidytuesday/2021-10-31-anscombes-quartet/anscombes_exploded.html)
-   [2021-10-31-anscombes-quartet/anscombes.html](https://evamaerey.github.io/mytidytuesday/2021-10-31-anscombes-quartet/anscombes.html)
-   [2021-10-19-great-pumpkin/memory\_input.html](https://evamaerey.github.io/mytidytuesday/2021-10-19-great-pumpkin/memory_input.html)
-   [2021-10-19-great-pumpkin/memory.html](https://evamaerey.github.io/mytidytuesday/2021-10-19-great-pumpkin/memory.html)
