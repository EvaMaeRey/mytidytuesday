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
  titlePanel("Likelihood of that true probability is p given observed number of successes in trials" ),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("num_successes", step = 1,
                  "Number of successes:",
                  min = 0,
                  max = 20,
                  value = 3),
      sliderInput("num_trials", step = 1,
                  "Number of Trials:",
                  min = 1,
                  max = 20,
                  value = 10),
      sliderInput("vline", step = .01,
                  "Probability reference line:",
                  min = 0,
                  max = 1,
                  value = .5)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      verbatimTextOutput("distText"),
      plotOutput("distPlot")
    )
  )

  # titlePanel(x_mod)


)



library(likelihoodExplore)


tidy_likbinom <- function(x = 8, size = 10){
  probs <- 0:1000/1000

  likelihood <- likbinom(x, size, prob = probs, log = F)

  log_likelihood <- likbinom(x, size, prob = probs, log = T)

  tibble::tibble(probs, likelihood, log_likelihood, num_successes = 8, num_trials = 10)

}

'
library(tidyverse)
library(patchwork)
# library(tidylikbinomial)

(ggplot(tidy_likbinom(input$num_successes,input$num_trials)) +
  aes(probs, likelihood) +
  geom_area() +
  geom_vline(xintercept = input$vline,
             linetype = "dashed"))  /

ggplot(tidy_likbinom(input$num_successes,input$num_trials)) +
  aes(probs, log_likelihood) +
  geom_line() +
  geom_vline(xintercept = input$vline,
             linetype = "dashed") +
  patchwork::plot_annotation(title = paste("Likelihood and log likelihood of observing given",input$num_successes , "successes observed in",input$num_trials , "Bernoulli trails") %>% str_wrap(50))
' ->
  for_shiny


# Define server logic required to draw a histogram
server <- function(input, output) {


  output$distText <- renderText({

    for_shiny %>%
      str_replace_all("input\\$num_successes", as.character(input$num_successes)) %>%
      str_replace_all("input\\$num_trials", as.character(input$num_trials)) %>%
      str_replace_all("input\\$vline", as.character(input$vline))


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

