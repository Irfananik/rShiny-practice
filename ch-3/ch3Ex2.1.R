library(shiny)
ui <- fluidPage(
  numericInput("x1", "Enter your x1 value here!", value = 0),
  numericInput("x2", "Enter your X2 value here!", value = 0),
  numericInput("x3", "Enter your x3 value here!", value = 0),
  numericInput("y1", "Enter your y1 value here!", value = 0),
  numericInput("y2", "Enter your y2 value here!", value = 0),
  textOutput("z1"),
  textOutput("z2")
)

server <- function(input, output, session){
  x <- reactive({
    input$x1 + input$x2 + input$x3
  })
  
  y <- reactive({
    input$y1 + input$y2
  })
  
  output$z1 <- renderText({
    paste0("Total input sum(X property + Y property): ", x() + y())
  })
  
  output$z2 <- renderText({
    paste0("Division to hole sum of input(X property / Y property): ", x() / y())
  })
}

shinyApp(ui, server)