#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#'

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(

  # Application title
  titlePanel("Hearts come in all shapes and sizes..." ),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("a", step = .01,
                  "a:",
                  min = 0,
                  max = 1,
                  value = .5),
      sliderInput("b", step = .01,
                  "b:",
                  min = 0,
                  max = 1,
                  value = .25),
      sliderInput("c", step = .01,
                  "c:",
                  min = 0,
                  max = 1,
                  value = .12),
      sliderInput("d", step = .01,
                  "d:",
                  min = 0,
                  max = 1,
                  value = .06),
      sliderInput("rotation", step = .01,
                  "Num Vertices:",
                  min = 0,
                  max = 1,
                  value = 3),
      sliderInput("radius", step = .01,
                  "radius:",
                  min = 0,
                  max = 1,
                  value = .5),
      sliderInput("height", step = .01,
                  "height:",
                  min = 0,
                  max = 2,
                  value = 1),
      sliderInput("radius", step = .01,
                  "radius:",
                  min = 0,
                  max = 2,
                  value = 1),
    ),

    # Show a plot of the generated distribution
    mainPanel(
      verbatimTextOutput("distText"),
      plotOutput("distPlot")
    )
  )

  # titlePanel(x_mod)


)





'

x0 = 0; y0 = 0; rotation = 3
radius = .5;

groups <- max(c(length(x0), length(y0)))

return_heart_df <- function(n_vertices){

  tibble::tibble(x0, y0, group = 1:groups) %>%
    tidyr::crossing(zero_to_2pi = 2*pi*(1:n_vertices)/n_vertices) %>%
  dplyr::mutate(
    y = y0 + input$height * input$radius * (    # height
        input$a * cos(1 * zero_to_2pi)    # a
      - input$b * cos(2 * zero_to_2pi)    # b
      - input$c * cos(3 * zero_to_2pi)    # c
      - input$d * cos(4 * zero_to_2pi)    # d
      ) - input$rotation * pi,
    x = x0 + input$radius * (sin(zero_to_2pi)^3) - rotation * pi)
}


return_heart_df(n_vertices = 100) %>%
  ggplot() +
  aes(x = x, y = y, group = group) +
  geom_polygon(
           fill = "darkred",
           color = "magenta",
           size = 5,
           alpha = .8,
           linetype = "dashed"
           ) +
  coord_equal(xlim = c(-10,10), ylim(-10,10))

' ->
  for_shiny


# Define server logic required to draw a histogram
server <- function(input, output) {


  output$distText <- renderText({

    for_shiny %>%
      str_replace_all("input\\$a", as.character(input$a)) %>%
      str_replace_all("input\\$b", as.character(input$b)) %>%
      str_replace_all("input\\$c", as.character(input$c)) %>%
      str_replace_all("input\\$d", as.character(input$d)) %>%
      str_replace_all("input\\$rotation", as.character(input$rotation)) %>%
      str_replace_all("input\\$height", as.character(input$height)) %>%
      str_replace_all("input\\$radius", as.character(input$radius))


  })



  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R


    eval(parse(text = for_shiny))

  })


#
#   output$distDf <- renderTable({
#
#     df
#
#   })

}

# Run the application
shinyApp(ui = ui, server = server)

#' ->
#my_shiny_app


#eval(parse(text = my_shiny_app))

