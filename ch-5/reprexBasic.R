library(shiny)

ui <- fluidPage(
  selectInput("n", "Select the number", 1:10),
  plotOutput("plot")
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    n <- as.numeric(input$n) * 2
    plot(head(cars, n))
  })
}

shinyApp(ui, server)