library(shiny)
ui <- fluidPage(
  numericInput("a", "Enter a value for a", value = 0),
  numericInput("b", "Enter a value for b", value = 0),
  numericInput("d", "Enter a value for d", value = 0),
  textOutput("f")
)

server <- function(input, output, session){
  c <- reactive({
    input$a + input$b
  })
  
  e <- reactive({
    c() + input$d
  })
  
  output$f <- renderText({
    e()
  })
}

shinyApp(ui, server)