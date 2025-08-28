library(statexpress)
library(tidyverse)

# 1. layer stack of bricks
compute_group_bricks <- function(data, scales, width = .2){
  
  data %>% 
    mutate(row = row_number()) %>% 
    mutate(y = row - .5) %>% 
    mutate(width = width)
  
}

# 2. layer label stack with count
compute_group_count <- function(data, scales){
  
  data %>% 
    count(x) %>% 
    mutate(y = n,
           label = n)
  
}


# 3. layer add x span
compute_scale <- function(data, scales){
  
  data %>% 
    summarise(min_x = min(x),
              xend = max(x),
              y = 0,
              yend = 0) %>% 
    rename(x = min_x)
  
}


# 4. layer add balancing point 
compute_xmean_at_y0 <- function(data, scales){
  
  data %>% 
    summarise(x = mean(x),
              y = 0, 
              label = "^") 
  
}

# 5. layer add balancing point value label
compute_xmean_at_y0_label <- function(data, scales){
  
  data %>% 
    summarise(x = mean(x),
              y = 0, 
              label = after_stat(round(x - 1, 2))) 
  
}



# 6. 
compute_panel_prop_asserted <- function(data, scales, null = .5){
  
  # stamp type layer - so ignor input data
  data.frame(y = 0, 
             x = null + 1,
             label = "^"
             )
  
}

compute_panel_prop_asserted_label <- function(data, scales, null = .5){
  
  # stamp type layer - so ignor input data
  data.frame(y = 0, 
             x = null + 1,
             label = round(null, 2)
             )
  
}

# Proposed layer composition
compute_dnorm_prop <- function(data, scales, null = .5,   dist_sds = seq(-3.5, 3.5, by = .1)
){
  
  n <- nrow(data)
  
  sd = sqrt(null * (1 - null)/n) # sd of the null distribution
  
  q <- dist_sds * sd + null
  
  data.frame(x = q + 1) %>%
    mutate(height = dnorm(q, sd = sd, mean = null)) %>%
    mutate(height_max = dnorm(0, sd = sd, mean = 0)) %>%
    mutate(y = .45*n*height/height_max) %>%  # This is a bit fragile...
    mutate(xend = x,
           yend = 0) %>% 
    # @teunbrand GeomArea$setup_data() requires a group column. Your panel computation does not preserve groups, but it should.
    mutate(group = 1) 
  
}  


# Proposed layer composition
compute_dnorm_prop_sds <- function(data, scales, null = .5,
  dist_sds = -4:4){
  
  n <- nrow(data)
  
  sd = sqrt(null * (1 - null)/n) # sd of the null distribution
  
  q <- dist_sds * sd + null
  
  data.frame(x = q + 1) %>%
    mutate(height = dnorm(q, sd = sd, mean = null)) %>%
    mutate(height_max = dnorm(0, sd = sd, mean = 0)) %>%
    mutate(y = .45*n*height/height_max) %>% # This is a bit fragile...
    mutate(xend = x,
           yend = 0)

}  




