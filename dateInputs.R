library(shiny)
ui <- fluidPage(
  dateInput("dob", "Your birthday date" ),
  dateRangeInput("holiday", "Your next vacation limit")
)

server <- function(input, output, session){
  
}

shinyApp(ui, server)