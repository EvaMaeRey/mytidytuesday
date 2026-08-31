#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

compute_panel_around <- function(data, scales, around_start = 0, radius = 1){

  data |>
    mutate(row_id = row_number()) |>
    mutate(around = around_start* 2*pi/360 + 2 * pi * row_id/n(),
           x = radius*cos(around),
           y = radius*sin(around),
           angle = 360*around/(2*pi),
           end = 0)


}

StatAround <- ggproto("StatAround", Stat,
                      compute_panel = compute_panel_around,
                      default_aes = aes(hjust = after_stat(1),
                                        xend = after_stat(end),
                                        yend = after_stat(end)))


# summer_times_places |>
#   ggplot() +
#   aes(label = cities) +
#   coord_equal(ylim = c(-1.2,1.2), xlim = c(-1.2,1.2)) +
#   geom_text(stat = StatAround, radius = .975) +
#   geom_text(stat = StatAround,
#             radius = 1.025, around_start = 90,
#             aes(label = hour_pretty),
#             hjust = 0) +
#   geom_segment(stat = StatAround,
#                around_start = pi/24 + 1,
#                linetype = "dashed") +
#   geom_polygon(stat = StatAround, color = "darkgray", fill = NA,
#                data = data.frame(x = 1:80), inherit.aes = F) +
#   labs(title = "Virtual meetup coordinators' wheel, Summer 2026",
#        subtitle = "From the ggplot2 extenders ❤️") +
#   theme_void(base_size = 9, ink = "darkgray")

library(tidyverse)
places <- tribble(~cities, ~hour,
                  "Melbourne/\nSydney", 6,
                  "Auckland", 8,
                  "San\nFrancisco", 13,
                  "Denver/\nSalt Lake",   14,
                  "Chicago/\nDallas", 15,
                  "New York/\nAtlanta", 16,
                  "Sao Paolo", 17,
                  "London/\nEdinburgh", 21,
                  "Amsterdam/\nBerlin", 22,
                  "Kampala", 23)
library(tidyverse)


summer_times_places <- tibble(hour = 1:24,
                              hour_pretty = rep(1:12, 2) |>
                                paste(c(rep("AM", 11), "noon",
                                        c(rep("PM", 11), "midnight"))) |>
                                str_remove("12 ")) |>
  left_join(places)

summer_times_places <- tibble(hour = 1:24,
                              hour_pretty = rep(1:12, 2) |>
                                paste(c(rep("AM", 11), "noon",
                                        c(rep("PM", 11), "midnight"))) |>
                                str_remove("12 ")) |>
  left_join(places)



geom_text_inner <- make_constructor(GeomText, stat = StatAround, radius = .975)
geom_text_outer <- make_constructor(GeomText, stat = StatAround, radius = 1.025, hjust = 0)
stamp_segment_pie_cuts <- make_constructor(GeomSegment, stat = StatAround, around_start = pi/24 + 1,
                                           linetype = "dotted", inherit.aes = FALSE)

GeomPolygonHollow <- ggproto("GeomPolygonHollow", GeomPolygon,
                             default_aes = GeomPolygon$default_aes |>
                               modifyList(aes(color = from_theme(ink), fill = NA)))

stamp_polygon_circle <- make_constructor(GeomPolygonHollow, stat = StatAround, data = data.frame(x = 1:200), inherit.aes = FALSE)

theme_timezone_wheel <- function(...){

  theme_void(base_size = 9, ink = "darkgray", ...)

}



theme_timezone_wheel() |> theme_set()

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Build up your timezone wheel 'layer by layer' 🙃"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          checkboxInput("geom.text.inner", "geom_text_inner()", value = TRUE),
          checkboxInput("geom.text.outer", "geom_text_outer()", value = TRUE),
          checkboxInput("stamp.segment.pie.cuts", "stamp_segement_pie_cuts()", value = TRUE),
          checkboxInput("stamp.polygon.circle", "stamp_polygon_circle()", value = TRUE),
          checkboxInput("coord.equal.padded", "coord_equal(ylim = c(-1.2,1.2), xlim = c(-1.2,1.2))", value = TRUE)

        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {


    output$distPlot <- renderPlot({

      mapping.geom.text.outer = aes(label = hour_pretty)
      mapping.geom.text.inner = NULL
      coord.equal.padded = if(input$coord.equal.padded){coord_equal(ylim = c(-1.2,1.2), xlim = c(-1.2,1.2))}
      geom.text.inner = if(input$geom.text.inner){geom_text_inner(mapping = mapping.geom.text.inner)}
      geom.text.outer = if(input$geom.text.outer){geom_text_outer(mapping = mapping.geom.text.outer)}
      stamp.segment.pie.cuts = if(input$stamp.segment.pie.cuts){stamp_segment_pie_cuts()}
      stamp.polygon.circle = if(input$stamp.polygon.circle){stamp_polygon_circle()}


      summer_times_places |>
        ggplot() +
        aes(label = cities) +
        coord.equal.padded +
        geom.text.inner +
        geom.text.outer +
        stamp.segment.pie.cuts +
        stamp.polygon.circle

    })
}

# Run the application
shinyApp(ui = ui, server = server)
