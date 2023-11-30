library(shiny)

ui <- fluidPage(
  sliderInput("slider", "Select a value", 1, 100, 50),
  textOutput("text")
)

server <- function(input, output, session) {
  observe({
    output$text <- renderText({
      paste("You selected:", input$slider)
    })
  })
}

shinyApp(ui, server)