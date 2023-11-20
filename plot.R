library(shiny)
ui <- fluidPage(
  plotOutput("plot", width = "500px")
)

server <- function(input, output, session){
  output$plot <- renderPlot(plot(1:10), res = 96)
}

shinyApp(ui, server)