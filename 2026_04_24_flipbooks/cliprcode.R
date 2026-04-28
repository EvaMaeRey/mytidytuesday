library(tidyverse)
library(plotROC)

D.ex <- rbinom(50, 1, .5)

roc_data <- data.frame(D = c(D.ex, D.ex),
           M = c(rnorm(50, mean = D.ex, sd = .4), 
                 rnorm(50, mean = D.ex, sd = 1)),
           Z = c(rep("A", 50), rep("B", 50))) 

roc_data |> 
  ggplot() + 
  aes(m = M, d = D) +
  geom_roc() ->
ggroc


roc_data |> 
  rename(m = M, d = D) |> 
StatRoc$compute_group()

calc_auc(ggroc)
