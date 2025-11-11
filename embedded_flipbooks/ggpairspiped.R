ggpairs_piped(tips) |> # simple start univariate plots 
  # to ggpairs - pairwise plots
  set_lower() |> 
  set_upper() |>
  # Columns and Mapping
  set_columns(c("tip", "total_bill", 
                "time", "smoker")) |> 
  set_columns(c( 2, 1, 6, 4)) |>
  set_columnLabels( c("Tip", "Total Bill", 
                      "Time of Day", "Smoker")) |>
  set_mapping(aes(color = time)) |> 
  set_mapping(aes(color = time, alpha = I(.7))) |> 
  # Matrix Sections
  set_lower(list(continuous = "smooth", 
                 combo = "facetdensity",
                 discrete = "crosstable", 
                 mapping = aes(color = NULL))) |>
  set_upper("blank") |>
  set_diag("blank") |>
  collect() ->
pairs


pairs[2, 1] +
  theme_dark() ->
pairs[2, 1]
  
pairs
