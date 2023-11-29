library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(width = 4,
      sliderInput("obs", "Number of observations:", min = 0, max = 500, value = 250),
      #style = "background-color: #FF0000;"  # Inline CSS for background color
    ),
    mainPanel(width = 8,
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output, session) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$obs))
  })
}

shinyApp(ui, server)