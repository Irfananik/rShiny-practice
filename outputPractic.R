library(shiny)
ui <- fluidPage(
  textOutput("text"),
  verbatimTextOutput("code")
)

server <- function(input, output, session){
  output$text <- renderText({
    "Hello Eaveryone!"
  })
  
  output$code <- renderPrint({
    summary(1:20)
  })
}

shinyApp(ui, server)