library(gtsummary)

trial |>
  tbl_wide_summary(
    include = c(response, grade),
    statistic = c("{n}", "{p}")
  ) ->
  hide


trial |>
  tbl_wide_summary(
    include = c(age, marker),
    statistic = c("{median}", "{p25}, {p75}")
  ) ->
out

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



