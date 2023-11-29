library(shiny)

ui <- fluidPage(
  textInput("text", "Enter text:"),
  numericInput("number", "Enter a number:", 0),
  actionButton("update", "Update"),
  textOutput("output")
)

server <- function(input, output, session) {
  values <- reactiveValues(
    textValue = "",
    numberValue = 0
  )
  
  observeEvent(input$update, {
    values$textValue <- input$text
    values$numberValue <- input$number
  })
  
  output$output <- renderText({
    paste("You entered text:", values$textValue, "and number:", values$numberValue)
  })
}

shinyApp(ui, server)