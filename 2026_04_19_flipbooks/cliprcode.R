library(infer)

gss |> tibble() |>
  specify(age ~ partyid) |>
  calculate(stat = "F") ->
F_hat

gss |>
  specify(age ~ partyid) |>
  hypothesize(null = "independence") |>
  generate(reps = 1000, 
           type = "permute") |>
  calculate(stat = "F") |> 
  visualize() +
  shade_p_value(obs_stat = F_hat, 
                direction = "greater")
