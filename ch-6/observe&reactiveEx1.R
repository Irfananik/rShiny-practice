library(shiny)

ui <- fluidPage(
  sliderInput("slider", "Select a value", 1, 100, 50),
  textOutput("text")
)

server <- function(input, output, session) {
  sliderValue <- reactive({
    input$slider
  })
  
  output$text <- renderText({
    paste("You selected:", sliderValue())
  })
}

shinyApp(ui, server)