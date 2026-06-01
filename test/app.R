#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Has the average wait time increased from 65 minutes?"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("null_value",
                        "Null value:",
                        min = 0,
                        max = 100,
                        value = 65),
            checkboxInput("geom_rug", "geom_rug()", value = F),
            checkboxInput("geom_histogram", "geom_histogram()", value = F),
            checkboxInput("geom_mean", "geom_mean()", value = F) ,
            checkboxInput("stamp_mean", "stamp_mean()", value = F),
            checkboxInput("geom_tdist_null", "geom_tdist_null()", value = F)
        ),
         # initialvalue


        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )

)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({

      library(ggplot2)
      library(ggt.test)

      layer0 <- if(input$geom_rug){geom_rug()}else{NULL}
      layer1 <- if(input$geom_histogram){geom_histogram(bins = input$bins)}else{NULL}
      layer2 <- if(input$geom_mean)     {geom_mean()}else{NULL}
      layer3 <- if(input$stamp_mean)    {stamp_mean(value = input$null_value)}else{NULL}
      layer4 <- if(input$geom_tdist_null){geom_tdist_null(value = input$null_value)} else{NULL}

      faithful |>
        ggplot() +
        aes(x = waiting) +
        layer0 +
        layer1 +
        layer2 +
        layer3 +
        layer4 +
        NULL

    })
}

# Run the application
shinyApp(ui = ui, server = server)
