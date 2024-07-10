trial |>
  tbl_summary(
    include = age,
    type = all_continuous() ~ "continuous2",
    statistic = all_continuous() ~ c("{mean} ({sd})",
                                     "{median} ({p25}, {p75})",
                                     "{min}, {max}"),
    digits = age ~ list(sd = 2), # show the SD to 2 decimal places
    missing = "no"
  ) ->
out

trial |>
 tbl_summary(
    include = c(age, grade, response),
    by = trt, # split table by group
    missing = "no" # dont list missing data separately
  ) |>
  add_n() %>% # add column with total number of non-missing observations
  modify_header(label = "**Variable**") %>% # update the column header
  bold_labels() ->
gtstable

names(gtstable)

str(gtstable$table_body) ->
  shhh; str(gtstable$table_styling) ->
  shhh; str(gtstable$call_list) ->
  shhh; str(gtstable$cards) ->
  shhh; str(gtstable$inputs)


