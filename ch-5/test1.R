library(shiny)

ui <- fluidPage(
  textInput("user_input", "Enter text:"),
  verbatimTextOutput("output_text")
)

server <- function(input, output, session) {
  observe({
    output$output_text <- renderPrint({
      input$user_input
    })
  })
}

shinyApp(ui, server)