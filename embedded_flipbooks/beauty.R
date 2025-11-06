ggpipedpairs(tips) |>
  set_columns(c("total_bill", "time", "tip")) |> 
  set_lower() |> # brings in ggpairs defaults  
  set_mapping(aes(color = time)) |> 
  set_mapping(aes(color = time, alpha = I(.7))) |> 
  set_upper() |>
  set_title("A ggpairs plot") |>
  set_columns(c("total_bill", "tip", "size")) 
