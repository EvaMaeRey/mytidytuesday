library(tidyverse)
library(plotROC)

D.ex <- rbinom(50, 1, .5)

data.frame(D = c(D.ex, D.ex)) |> 
  mutate(M = c(rnorm(50, mean = D.ex, sd = .4), 
               rnorm(50, mean = D.ex, sd = 1)),
         Z = c(rep("A", 50), rep("B", 50))) |> 
  ggplot() + 
  aes(m = M, d = D) +
  geom_roc() + 
  aes(color = Z) ->
ggroc2

calc_auc(ggroc2) |> tibble()
