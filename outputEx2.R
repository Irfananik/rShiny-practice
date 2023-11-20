library(shiny)
ui <- fluidPage(
  plotOutput("myPlot", height = "300px", width = "700px")
)

server <- function(input, output, session){
  output$myPlot <- renderPlot({
    plot(1:5)
    res = 96
    alt = "a scatterplot of five random numbers"
  })
}

shinyApp(ui, server)