library(shiny)
ui <- fluidPage(
 textInput("name", "Enter your name here"),
 textOutput("OutPutValue")
)

server <- function(input, output, session) {
  output$OutPutValue <- renderText(string())
  string <- reactive(paste0("Hello ", input$name, "!"))
}

shinyApp(ui, server)