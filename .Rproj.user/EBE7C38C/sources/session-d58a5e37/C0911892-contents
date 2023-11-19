library(shiny)
ui <- fluidPage(
  numericInput("num", "First Number", value = 0, min = 0, max = 100),
  sliderInput("num2", "Second Number", value = 50, min = 0, max = 100),
  sliderInput("rang", "Range", value = c(30,40), min = 0, max = 100)
)

server <- function(input, output, session){
  
}

shinyApp(ui, server)