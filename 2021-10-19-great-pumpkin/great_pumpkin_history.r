library(tidyverse)
library(ggstamp)
ggcanvas()
ggcanvas() +
  stamp_tile(xy = pos_month("2021-10"))
ggcanvas() +
  stamp_tile(xy = pos_month("2021-10"),
             height = .9)
ggcanvas() +
  stamp_tile(xy = pos_month("2021-10"),
             height = .9,
             width = .9)
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1"
  )
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1"
  ) +
  stamp_label(xy = pos_month("2021-10"),
              label = 1:31)
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10"),
             label = 1:31)
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10")[1:30, ],
             label = 1:30) +
  stamp_png(x0y0 = pos_month("2021-10")[30, ],
            png = "noun_pumpkin_3847271.png")
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10")[1:30, ],
             label = 1:30) +
  stamp_png(x0y0 = pos_month("2021-10")[31, ],
            png = "noun_pumpkin_3847271.png")
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10")[1:30, ],
             label = 1:30) +
  stamp_png(x0y0 = pos_month("2021-10")[31, ],
            png = "noun_pumpkin_3847271.png")
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10")[1:30, ],
             label = 1:30) +
  stamp_png2(x0y0 = pos_month("2021-10")[31, ],
             png = "noun_pumpkin_3847271.png")
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10")[1:30, ],
             label = 1:30) +
  stamp_png2(x0y0 = pos_month("2021-10")[31, ],
             png = "noun_pumpkin_3847271.png") +
  theme_void_fill(fill = "lavender")
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10")[1:30, ],
             label = 1:30) +
  stamp_png2(x0y0 = pos_month("2021-10")[31, ],
             png = "noun_pumpkin_3847271.png") +
  theme_void_fill(fill = "lavender") +
  stamp_text_ljust(label = "It's October!",
                   fontface = "italic")
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10")[1:30, ],
             label = 1:30) +
  stamp_png2(x0y0 = pos_month("2021-10")[31, ],
             png = "noun_pumpkin_3847271.png") +
  # theme_void_fill(fill = "lavender") +
  stamp_text_ljust(
    label = "It's October!",
    fontface = "italic",
    size = 12,
    y = .75
  )
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10")[1:30, ],
             label = 1:30) +
  stamp_png2(x0y0 = pos_month("2021-10")[31, ],
             png = "noun_pumpkin_3847271.png") +
  # theme_void_fill(fill = "lavender") +
  stamp_text_ljust(
    label = "It's October!",
    fontface = "italic",
    size = 12,
    y = .75,
    x = -.45
  )
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10")[1:30, ],
             label = 1:30) +
  stamp_png2(x0y0 = pos_month("2021-10")[31, ],
             png = "noun_pumpkin_3847271.png") +
  # theme_void_fill(fill = "lavender") +
  stamp_text_ljust(
    label = "It's October!",
    fontface = "italic",
    size = 12,
    y = .75,
    x = -.45
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] - .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] + .45
  )
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10")[1:30, ],
             label = 1:30) +
  stamp_png2(x0y0 = pos_month("2021-10")[31, ],
             png = "noun_pumpkin_3847271.png") +
  # theme_void_fill(fill = "lavender") +
  stamp_text_ljust(
    label = "It's October!",
    fontface = "italic",
    size = 12,
    y = .75,
    x = -.45
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] - .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] + .45
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] + .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] - .45
  )
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10")[1:30, ],
             label = 1:30) +
  stamp_png2(x0y0 = pos_month("2021-10")[31, ],
             png = "noun_pumpkin_3847271.png") +
  # theme_void_fill(fill = "lavender") +
  stamp_text_ljust(
    label = "It's Almost Halloween!",
    fontface = "italic",
    size = 12,
    y = .75,
    x = -.45
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] - .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] + .45
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] + .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] - .45
  )
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10")[1:30, ],
             label = 1:30) +
  stamp_png2(x0y0 = pos_month("2021-10")[31, ],
             png = "noun_pumpkin_3847271.png") +
  theme_void_fill(fill = "lavender") +
  stamp_text_ljust(
    label = "It's Almost Halloween!",
    fontface = "italic",
    size = 12,
    y = .75,
    x = -.45
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] - .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] + .45
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] + .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] - .45
  )
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10")[1:30, ],
             label = 1:30) +
  stamp_png2(x0y0 = pos_month("2021-10")[31, ],
             png = "noun_pumpkin_1237638.png") +
  theme_void_fill(fill = "lavender") +
  stamp_text_ljust(
    label = "It's Almost Halloween!",
    fontface = "italic",
    size = 12,
    y = .75,
    x = -.45
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] - .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] + .45
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] + .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] - .45
  )
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(xy = pos_month("2021-10")[1:30, ],
             label = 1:30,
             color = "grey35") +
  stamp_png2(x0y0 = pos_month("2021-10")[31, ],
             png = "noun_pumpkin_1237638.png",
             color = "grey35") +
  theme_void_fill(fill = "lavender") +
  stamp_text_ljust(
    label = "It's Almost Halloween!",
    fontface = "italic",
    size = 12,
    y = .75,
    x = -.45,
    color = "grey35"
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] - .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] + .45,
    color = "grey35"
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] + .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] - .45,
    color = "grey35"
  )
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(
    xy = pos_month("2021-10")[1:30, ],
    label = 1:30,
    size = 10,
    color = "grey35"
  ) +
  stamp_png2(x0y0 = pos_month("2021-10")[31, ],
             png = "noun_pumpkin_1237638.png",
             color = "grey35") +
  theme_void_fill(fill = "lavender") +
  stamp_text_ljust(
    label = "It's Almost Halloween!",
    fontface = "italic",
    size = 12,
    y = .75,
    x = -.45,
    color = "grey35"
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] - .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] + .45,
    color = "grey35"
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] + .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] - .45,
    color = "grey35"
  )
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(
    xy = pos_month("2021-10")[1:30, ],
    label = 1:30,
    size = 12,
    color = "grey35"
  ) +
  stamp_png2(x0y0 = pos_month("2021-10")[31, ],
             png = "noun_pumpkin_1237638.png",
             color = "grey35") +
  theme_void_fill(fill = "lavender") +
  stamp_text_ljust(
    label = "It's Almost Halloween!",
    fontface = "italic",
    size = 12,
    y = .75,
    x = -.45,
    color = "grey35"
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] - .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] + .45,
    color = "grey35"
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:26, 1] - .45,
    y = pos_month("2021-10")[1:26, 2] + .45,
    xend = pos_month("2021-10")[1:26, 1] + .45,
    yend = pos_month("2021-10")[1:26, 2] - .45,
    color = "grey35"
  )
ggcanvas() +
  stamp_tile(
    xy = pos_month("2021-10"),
    height = .9,
    width = .9,
    fill = "burlywood1",
    color = "burlywood1"
  ) +
  stamp_text(
    xy = pos_month("2021-10")[1:30, ],
    label = 1:30,
    size = 12,
    color = "grey35"
  ) +
  stamp_png2(x0y0 = pos_month("2021-10")[31, ],
             png = "noun_pumpkin_1237638.png",
             color = "grey35") +
  theme_void_fill(fill = "lavender") +
  stamp_text_ljust(
    label = "It's Halloween!",
    fontface = "italic",
    size = 12,
    y = .75,
    x = -.45,
    color = "grey35"
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:30, 1] - .45,
    y = pos_month("2021-10")[1:30, 2] - .45,
    xend = pos_month("2021-10")[1:30, 1] + .45,
    yend = pos_month("2021-10")[1:30, 2] + .45,
    color = "grey35"
  ) +
  stamp_segment(
    x = pos_month("2021-10")[1:30, 1] - .45,
    y = pos_month("2021-10")[1:30, 2] + .45,
    xend = pos_month("2021-10")[1:30, 1] + .45,
    yend = pos_month("2021-10")[1:30, 2] - .45,
    color = "grey35"
  )
