ggtable(data = tidytitanic::tidy_titanic) |>
  set_rows(sex) |>
  set_cols(survived) |>
  set_cols(age) |>
  set_rows(NULL) |>
  set_rows(c(sex, survived)) |>
  set_cols(c(age, class))
