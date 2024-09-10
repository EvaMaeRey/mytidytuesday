compute_panel_lm <- function(data, scales, drop_x = FALSE, formula = y ~ . ){
  
  data |>
    ggplot2::remove_missing() ->
  data
  
  data %>% 
    select(-PANEL) ->
  lmdata
  
  if(drop_x){
    
    lmdata %>% 
      select(-x) ->
    lmdata
    
  }
  
  lm <- lm(data = lmdata, formula = formula)
  
  data$yend = data$y
  data$y = lm$fitted.values
  data$xend = data$x

  data$residuals <- lm$residuals
  
  data
  
}

StatLm <- ggplot2::ggproto("StatLm",
                           ggplot2::Stat,
                           compute_panel = compute_panel_lm)
