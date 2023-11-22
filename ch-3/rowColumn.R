library(shiny)
library(ggplot2)

ui <- fluidPage(
  fluidRow(
    column(
      4,
      "Distribution1",
      numericInput("n1", label = "n", value = 1000, min = 1),
      numericInput("meant1", label = "µ", value = 0, step = 0.1),
      numericInput("sd1", label = "σ", value = 0.5, min = 0.1, step = 0.1)
    ),
    column(
      4,
      "Distribution2",
      numericInput("n2", label = "n", value = 1000, min = 1),
      numericInput("meant2", label = "µ", value = 0, step = 0.1),
      numericInput("sd2", label = "σ", value = 0.5, min = 0.1, step = 0.1)
    ),
    column(
      4,
      "Frequency polygon",
      numericInput("binwidth", label = "Bin width", value = 0.1, step = 0.1),
      sliderInput("range", label = "range", value = c(-3, 3), min = -5, max = 5)
    )
  ),
  
  fluidRow(
    column(9, plotOutput("hist")),
    column(3, verbatimTextOutput("ttest"))
  )
)

server <- function(input, output, session){
  output$hist <- renderPlot({
    x1 <- rnorm(input$n1, input$meant1, input$sd1)
    x2 <- rnorm(input$n2, input$meant2, input$sd2)
    
    ggplot() +
      geom_freqpoly(aes(x = x1), binwidth = input$binwidth, color = "blue") +
      geom_freqpoly(aes(x = x2), binwidth = input$binwidth, color = "red") +
      xlim(input$range)
  }, res = 96)
  
  output$ttest <- renderPrint({
    x1 <- rnorm(input$n1, input$meant1, input$sd1)
    x2 <- rnorm(input$n2, input$meant2, input$sd2)
    
    result <- t.test(x1, x2)
    result
  })
}

shinyApp(ui, server)
