library(shiny)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title

    titlePanel("One sample t-test: Has the average wait time increased from 70 minutes?"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("data", "Data Set:", choices = c("faithful", "cars")),
            selectInput("x", "x:", choices = NULL),
            checkboxInput("geom_rug",        "geom_rug()",        value = F),
            checkboxInput("geom_histogram",  "Add a histogram with `geom_histogram()`",  value = F),
            checkboxInput("geom_mean",       "geom_mean()" ,       value = F) ,
            numericInput("null_value", "Null value:", value = 70),
            checkboxInput("stamp_mean",      "Draw in the asserted mean...",      value = F),
            checkboxInput("geom_tdist_null", "The dist for the null, geom_tdist_null()", value = F)

        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )

)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

  # Don't know how to actually make this work - shiny illiteracy 🤷‍♀️...
  observeEvent(input$x, {
    choices <- if (input$data == "faithful"){names(faithful)}else{names(cars)}
    updateSelectInput(session, "x", choices = choices)
  })

    output$distPlot <- renderPlot({

      data <- input$data |> get()

      library(ggplot2)
      library(ggt.test)

      layer0 <- if(input$geom_rug)       {geom_rug()}else{NULL}
      layer1 <- if(input$geom_histogram) {geom_histogram(bins = input$bins)}else{NULL}
      layer2 <- if(input$geom_mean)      {geom_mean()}else{NULL}
      layer3 <- if(input$stamp_mean)     {stamp_mean(value = input$null_value)}else{NULL}
      layer4 <- if(input$geom_tdist_null){geom_tdist_null(value = input$null_value, tails = "both")} else{NULL}

      theme_set(ggchalkboard:::theme_blackboard(accent = "orange"))

      data |>
        ggplot() +
        aes(x = waiting) + # Illiteracy...
        layer0 +
        layer1 +
        layer2 +
        layer3 +
        layer4

    })
}

# Run the application
shinyApp(ui = ui, server = server)
