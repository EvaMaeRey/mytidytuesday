# count table 
ggtable(penguins) 
  
# count by species, sex
last_table() |>
  set_rows(species)|>
  set_cols(sex) 

# average bill depth table
last_table() |>
  set_fun(mean) |>
  set_value(bill_depth_mm)
