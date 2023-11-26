library(shiny)

f <- function(x) g(x)
g <- function(x) h(x)
h <- function(x) x * 2

ui <- fluidPage(
  selectInput("n", "Select Number", 1:10),
  plotOutput("plot")
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    #finding a error here("non-numeric argument to binary operator")
    n <- as.numeric(input$n)   #previous line was - n <- f(input$n)
    plot(head(cars, n))
  }, res = 96)
}

shinyApp(ui, server)