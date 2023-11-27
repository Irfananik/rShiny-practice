library(shiny)

ui <- fluidPage(
  titlePanel("Hello Mickey!"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs", "Observations:", min = 0, max = 100, value = 30)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)