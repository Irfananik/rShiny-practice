library(shiny)
library(ggplot2)

ui <- fluidPage(
  fluidRow(
    column(3, 
           numericInput("lambda1", label = "lambda1", value = 3),
           numericInput("lambda2", label = "lambda2", value = 5),
           numericInput("n", label = "n", value = 1e4, min = 0)
    ),
    column(9, plotOutput("hist"))
  )
)

server <- function(input, output, session){
  x1 <- reactive(rpois(input$n, input$lambda1))
  x2 <- reactive(rpois(input$n, input$lambda2))
  
  output$hist <- renderPlot({
    data <- data.frame(x1 = x1(), x2 = x2())
    
    ggplot(data, aes(x = x1, fill = "red")) +
      geom_freqpoly(binwidth = 1, color = "blue", position = "identity", alpha = 0.5) +
      geom_freqpoly(aes(x = x2), binwidth = 1, color = "green", position = "identity", alpha = 0.5) +
      xlim(c(0, 40)) +
      labs(title = "Frequency Polygon of Poisson-distributed Random Variables")
  }, res = 96)
}

shinyApp(ui, server)