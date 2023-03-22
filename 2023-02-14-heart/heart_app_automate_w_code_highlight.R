#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# remotes::install_github("statistikat/codeModules")
library(codeModules)

##### R Stuff in the background ######

library(tidyverse)
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
    linewidth = 4,
    alpha = 0.8,
    linetype = "dashed"
  ) +
  coord_equal()


#### version with variables predefined ###

#### UIish ###
input_num_vertices <- 16
input_char_fill <-"darkred"
input_char_color <- "magenta"
input_num_linewidth <- 4
input_num_alpha <- 0.8
input_char_linetype <- "dashed"



'input_num_vertices <- 16
input_char_fill <-"darkred"
input_char_color <- "magenta"
input_num_linewidth <- 4
input_num_alpha <- 0.8
input_char_linetype <- "dashed"' ->
  var_defs_string

#' Title
#'
#' @return
#' @export
#'
#' @examples
#' return_var_defs_string_example()
return_var_defs_string_example <- function(){

'input_num_vertices <- 16
input_char_fill <-"darkred"
input_char_color <- "magenta"
input_num_linewidth <- 4
input_num_alpha <- 0.8
input_char_linetype <- "dashed"'

}



#' Title
#'
#' @param var_defs_string
#'
#' @return
#' @export
#'
#' @examples
#' return_var_defs_string_example() %>%
#' var_defs_data_frame()
var_defs_data_frame <- function(var_defs_string){

  var_defs_string %>%
    read_lines() %>%
    tibble(x = .) %>%
    tidyr::separate(x, sep = "\\s?<-\\s?|\\s?=\\s?", into = c("input","value")) %>%
    mutate(input = str_remove(input, "input_")) %>%
    mutate(input_type = str_extract(input, "num|char")) %>%
    mutate(short_input = str_remove(input, ".+_.+_"))

}


#' Title
#'
#' @param input
#' @param short_input
#' @param value
#'
#' @return
#' @export
#'
#' @examples
#' write_input_code_numeric("num_verticies", "vertices", 16) %>% cat()
write_input_code_numeric <- function(input = "", short_input, value){
  paste0(
'sliderInput(inputId = "', input, '",
             label = "', short_input, '",
             step = 1,
             min = 10,
             max = 200,
             value = ', value, '
             )')

  }

#' Title
#'
#' @param input
#' @param short_input
#' @param value
#'
#' @return
#' @export
#'
#' @examples
#' write_input_code_character("char_color", "color", "magenta") %>% cat()
write_input_code_character <- function(input, short_input, value){
  paste0(
'selectInput(inputId = "', input, '",
             label = "', short_input, '",
             selected = ', value, ',
             choices = ', value, '
             )')
         }

# scaffolding for inputs
#' Title
#'
#' @param var_data_frame
#'
#' @return
#' @export
#'
#' @examples
#' return_var_defs_string_example() %>%
#' var_defs_data_frame() %>%
#' var_data_frame_write_shiny_panel()
var_data_frame_write_shiny_panel <- function(var_data_frame){

  var_data_frame %>%
    mutate(input_type = str_extract(input, "num|char")) %>%
    mutate(input_code = ifelse(input_type == "num",
                               write_input_code_numeric(input, short_input, value),
                               write_input_code_character(input, short_input, value))
           )

}

#' Title
#'
#' @param var_defs_string
#'
#' @return
#' @export
#'
#' @examples
#' return_var_defs_string_example() %>%
#' var_defs_to_shiny_code %>%
#' cat()
var_defs_to_shiny_code <- function(var_defs_string){

    var_defs_string %>%
    var_defs_data_frame() %>%
    var_data_frame_write_shiny_panel() %>%
    pull(input_code) %>%
    paste(collapse = ",\n")

}

#### Server ish ####
return_heart_df(n_vertices = input_num_vertices) %>%
  ggplot() +
  aes(x = x, y = y, group = group) +
  geom_polygon(
    fill = input_char_fill,
    color = input_char_color,
    linewidth = input_num_linewidth,
    alpha = input_num_alpha,
    linetype = input_char_linetype
  ) +
  coord_equal()



### What we need 'for shiny' translation of above  Original approach for reference
'
# library(returnheart)

return_heart_df(n_vertices = input$num_vertices) %>%
  ggplot() +
  aes(x = x, y = y, group = group) +
  geom_polygon(
           fill = input$char_fill,
           color = input$char_color,
           linewidth = input$num_linewidth,
           alpha = input$num_alpha,
           linetype = input$char_linetype
           ) +
  coord_equal()

' ->
  for_shiny1



### What we need 'for shiny'; using string manipulation to get bindings
'
# library(my_return_heart_package)

return_heart_df(n_vertices = input_num_vertices) %>%
  ggplot() +
  aes(x = x, y = y, group = group) +
  geom_polygon(
           fill = input_char_fill,
           color = input_char_color,
           linewidth = input_num_linewidth,
           alpha = input_num_alpha,
           linetype = input_char_linetype
           ) +
  coord_equal()

' -> code_general_form




code_general_form %>% str_replace_all("input_", "input$") ->
  for_shiny_interactivity


####### Shiny Stuff ####

library(shiny)
library(tidyverse)



##### Define server logic ########

server <- function(input, output, session) {


  output$code_out <- renderCode({

    for_shiny_interactivity %>%
      # numeric
      str_replace_all("input\\$num_vertices", as.character(input$num_vertices)) %>%
      str_replace_all("input\\$num_alpha", as.character(input$num_alpha)) %>%
      str_replace_all("input\\$num_linewidth", as.character(input$num_linewidth)) %>%
      # character
      str_replace_all("input\\$char_color", as.character(input$char_color) %>% paste0('\\"', ., '\\"')) %>%
      str_replace_all("input\\$char_linetype", as.character(input$char_linetype) %>% paste0('\\"', ., '\\"')) %>%
      str_replace_all("input\\$char_fill", as.character(input$char_fill) %>% paste0('\\"', ., '\\"'))


    # paste('1 + 1')

  })


  output$distPlot <- renderPlot({

    eval(parse(text = for_shiny_interactivity))

  })

}

## Define UI for application that draws a heart ##
ui <- fluidPage(

  # Application title
  titlePanel("When your heart has some rough edges..." ),

  titlePanel("... add vertices!" ),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "num_vertices",
                  label = "vertices",
                  step = 1,
                  min = 10,
                  max = 200,
                  value = 16
                  ),
      selectInput(inputId = "char_color",
                  label = "color",
                  selected = "magenta",
                  choices = colors()
                  ),
      selectInput(inputId = "char_fill",
                  label = "fill",
                  selected = "darkred",
                  choices = colors(),
                  ),
      radioButtons(inputId = "char_linetype",
                   label = "linetype",
                   selected = "dashed",
                   choices = c("dashed", "dotted", "solid")),
      sliderInput(inputId = "num_alpha",
                  label = "alpha",
                  value = .8,
                  min = 0,
                  max = 1,
                  step = .02
                  ),
      sliderInput(inputId = "num_linewidth",
                  label = "linewidth",
                  value = 4,
                  min = 1,
                  max = 5,
                  step = 1
                  )

    ),

    # Show a plot of the generated distribution
    mainPanel(
      codeOutput("code_out"),
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

shinyApp(
  fluidPage(
    mainPanel(
    codeOutput("code_out"),
    plotOutput("plot_out")
    )
  ),

  function(input, output, session){


    output$code_out <- renderCode({
      "1+1"
    })


    output$plot_out <- renderPlot({
      ggplot(cars) + aes(speed, dist) + geom_point()

    })
  }
)
