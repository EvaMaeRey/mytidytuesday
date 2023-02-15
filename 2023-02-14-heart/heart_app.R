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
  titlePanel("What does pnorm(x = z) do?" ),

  titlePanel("Integrates under the normal from -infinity to Z" ),



  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("z",step = .02,
                  "Z:",
                  min = -5,
                  max = 5,
                  value = 0)

    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      verbatimTextOutput("distText")
    )
  ),

  # titlePanel(x_mod)


)




'
x0 = 0
y0 = 0
n_vertices = 40
rotation = 0
radius = .5
size = 4
linetype = "dashed"
color = "magenta"
fill = "darkred"
alpha = .8

groups <- max(c(length(x0), length(y0)))

  tibble::tibble(x0, y0, group = 1:groups) %>%
    tidyr::crossing(the_n = 2*pi*(1:n_vertices)/n_vertices) %>%
  dplyr::mutate(
    y = y0 + radius * (
      .95 * cos(the_n)
      - .35 * cos(2 * the_n)
      - .25 * cos(3 * the_n)
      - .05 * cos(4 * the_n)
      ) - rotation * pi,
    x = x0 + radius * (sin(the_n)^3) - rotation * pi) ->
  df
df

ggplot() +
  annotate(geom = "polygon",
           x = df$x,
           y = df$y,
           size = size,
           fill = fill,
           alpha = alpha,
           linetype = linetype,
           color = color,
           group = df$group
           )
' ->
  for_shiny


# Define server logic required to draw a histogram
server <- function(input, output) {





  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R


    eval(parse(text = for_shiny))

  })

  output$distText <- renderText({

    for_shiny %>%
      str_replace_all("input\\$z", as.character(input$z))

  })


}

# Run the application
shinyApp(ui = ui, server = server)

#' ->
#my_shiny_app


#eval(parse(text = my_shiny_app))

