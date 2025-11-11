ggpairs_piped(tips) |> 
  set_lower() |> # 
  set_columns(c("tip", "total_bill")) |>
  set_lower(list(continuous = "smooth")) |> # lm is default
  set_lower(list(continuous = "autopoint")) |>
  set_lower(list(continuous = "cor")) |>
  set_lower(list(continuous = "density")) |>
  set_lower(list(continuous = "smooth_lm")) |>
  set_lower(list(continuous = "smooth_loess")) |>
  set_columns(c("time", "smoker")) |> 
  set_lower(list(discrete = "autopoint")) |>
  set_lower(list(discrete = "count")) |>
  set_lower(list(discrete = "cross")) |>
  set_lower(list(discrete = "table")) |>
  set_lower(list(discrete = "crosstable")) |>
  set_lower(list(discrete = "ratio")) |> 
  set_lower(list(discrete = "rowbar")) |>
  set_lower(list(discrete = "trends")) |>
  set_lower(list(discrete = "facetbar")) |> # default
  set_columns(c("tip", "smoker")) |>
  set_lower(list(combo = "autopoint")) |>
  set_lower(list(combo = "box")) |>
  set_lower(list(combo = "box_no_facet")) |>
  set_lower(list(combo = "denstrip")) |>
  set_lower(list(combo = "dot")) |>
  set_lower(list(combo = "dot_no_facet"))|>
  set_lower(list(combo = "facetdensitystrip")) |>
  set_lower(list(combo = "facethist")) |>
  set_lower(list(combo = "summarise_by")) |>
  set_lower(list(combo = "trends"))
