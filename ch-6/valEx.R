library(shiny)

ui <- fluidPage(
  textInput("text", "Enter text:"),
  actionButton("update", "Update"),
  textOutput("output")
)

server <- function(input, output, session) {
  value <- reactiveVal("")
  
  observeEvent(input$update, {
    value(input$text)
  })
  
  output$output <- renderText({
    paste("You entered:", value())
  })
}

shinyApp(ui, server)