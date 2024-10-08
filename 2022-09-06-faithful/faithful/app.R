#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)


'faithful %>%
            group_by(obs = row_number()) %>%
            ggplot() +
            aes(x = eruptions) +
            aes(group = obs) +
            geom_histogram(bins = input$bins,
                           color = "grey65") +
            geom_rug() +
            scale_y_continuous(limits = c(0, 50))' ->
    code

# code %>% parse

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
    #     # generate bins based on input$bins from ui.R
    #     faithful %>%
    #         group_by(obs = row_number()) %>%
    #         ggplot() +
    #         aes(x = eruptions) +
    #         aes(group = obs) +
    #         geom_histogram(bins = input$bins,
    #                        color = "grey65") +
    #         geom_rug() +
    #         scale_y_continuous(limits = c(0, 50))

    })
}

# Run the application
shinyApp(ui = ui, server = server)
