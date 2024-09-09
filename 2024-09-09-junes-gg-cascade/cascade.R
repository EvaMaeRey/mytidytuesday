library(ggtrace)
library(ggplot2)

as.list(body(ggplot2:::ggplot_build.ggplot)) ->
  build

sapply(build, deparse1) |>
  grep(x = _, "l\\$\\w+", value = TRUE) |>
  gsub(x = _, ".*l(\\$\\w+).*", "ggplot2:::Layer\\1") ->
layer_methods

gsub(x = layer_methods, ".*\\$", "") ->
  names(layer_methods)

ggplot(mtcars, aes(cyl)) +
  stat_count() ->
p

stat_count_Layer <- lapply(
  layer_methods,
  \(x) {
    rlang::inject(
      capture_fn(p, !!rlang::parse_expr(x), cond = 1)
    )
  }
)

list(setup = capture_fn(p, Layout$setup)) ->
  p_Layout

layer_data(p, 1)

mtcars |>
  stat_count_Layer$layer_data(plot_data = _) |>
  stat_count_Layer$setup_layer(data = _) |>
    # Detour around Layout$setup()
    list() |>
    p_Layout$setup(data = _) |>
    el(1) |>
  stat_count_Layer$compute_aesthetics(data = _) |>
  stat_count_Layer$compute_statistic(data = _) |>
  stat_count_Layer$map_statistic(data = _) |>
  stat_count_Layer$compute_geom_1(data = _) |>
  stat_count_Layer$compute_geom_2(data = _) |>
  stat_count_Layer$finish_statistics(data = _)


