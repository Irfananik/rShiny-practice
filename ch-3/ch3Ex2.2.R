library(shiny)
ui <- fluidPage(
  numericInput("d", "Enter a value for d", value = 0),
  numericInput("a", "Enter a value for a", value = 0),
  numericInput("c", "Enter a value for c", value = 1),
  numericInput("b", "Enter a value for b", value = 2),
  textOutput("result")
)

server <- function(input, output, session){
  d <- reactive(c() ^ input$d)
  a <- reactive(input$a * 10)
  c <- reactive(b() / input$c) 
  b <- reactive(a() + input$b)
  
  output$result <- renderText({
    d()
  })
}

shinyApp(ui, server)