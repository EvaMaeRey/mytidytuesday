#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

##### R Stuff in the background ######

x0 = 0; y0 = 0; rotation = 3
radius = .5;

groups <- max(c(length(x0), length(y0)))

return_heart_df <- function(n_vertices){

  tibble::tibble(x0, y0, group = 1:groups) %>%
    tidyr::crossing(the_n = 2*pi*(1:n_vertices)/n_vertices) %>%
    dplyr::mutate(
      y = y0 + radius * (
        .85 * cos(the_n)
        - .35 * cos(2 * the_n)
        - .25 * cos(3 * the_n)
        - .05 * cos(4 * the_n)
      ) - rotation * pi,
      x = x0 + radius * (sin(the_n)^3) - rotation * pi)
}


### Design code to be featured in app ####
return_heart_df(n_vertices = 16) %>%
  ggplot() +
  aes(x = x, y = y, group = group) +
  geom_polygon(
    fill = "darkred",
    color = "magenta",
    size = 4,
    alpha = 0.8,
    linetype = "dashed"
  ) +
  coord_equal()



### What we need 'for shiny' translation of above
'
# library(my_return_heart_package)

return_heart_df(n_vertices = input$z) %>%
  ggplot() +
  aes(x = x, y = y, group = group) +
  geom_polygon(
           fill = input$fill,
           color = input$color,
           size = input$size,
           alpha = input$alpha,
           linetype = input$linetype
           ) +
  coord_equal()

' ->
  for_shiny


####### Shiny Stuff ####

library(shiny)
library(tidyverse)



##### Define server logic ###
#

server <- function(input, output) {


  output$distText <- renderText({

    for_shiny %>%
      str_replace_all("input\\$z", as.character(input$z)) %>%
      str_replace_all("input\\$color", as.character(input$color) %>% paste0('\\"', ., '\\"')) %>%
      str_replace_all("input\\$linetype", as.character(input$linetype) %>% paste0('\\"', ., '\\"')) %>%
      str_replace_all("input\\$fill", as.character(input$fill) %>% paste0('\\"', ., '\\"')) %>%
      str_replace_all("input\\$alpha", as.character(input$alpha)) %>%
      str_replace_all("input\\$size", as.character(input$size))


  })

  output$distPlot <- renderPlot({

    eval(parse(text = for_shiny))

  })

}

## Define UI for application that draws a histogram ##
ui <- fluidPage(

  # Application title
  titlePanel("When your heart has some rough edges..." ),

  titlePanel("... add vertices!" ),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("z",step = 1,
                  "Num Vertices:",
                  min = 10,
                  max = 200,
                  value = 16),
      selectInput("color", label = "color",
                  choices = colors(),
                  selected = "magenta"
      ),
      selectInput("fill", label = "fill",
                  choices = colors(),
                  selected = "darkred"
      ),
      radioButtons("linetype",
                   label = "linetype",
                   selected = "dashed",
                   choices = c("dashed", "dotted", "solid")
      ),
      sliderInput("alpha",step = .02,
                  "alpha",
                  min = 0,
                  max = 1,
                  value = .8),
      sliderInput("size",step = 1,
                  "size",
                  min = 1,
                  max = 5,
                  value = 4)

    ),

    # Show a plot of the generated distribution
    mainPanel(
      verbatimTextOutput("distText"),
      plotOutput("distPlot")
    )
  )

  # titlePanel(x_mod)


)

# Run the application
shinyApp(ui = ui, server = server)

#' ->
#my_shiny_app


#eval(parse(text = my_shiny_app))

