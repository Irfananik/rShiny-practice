library(shiny)

ui <- fluidPage(
  sidebarLayout(
    mainPanel(width = 8,
              plotOutput("distPlot")
    ),
    sidebarPanel(width = 4,
                 sliderInput("obs", "Number of observations:", min = 0, max = 500, value = 250)
    )
  )
)

server <- function(input, output, session) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$obs))
  })
}

shinyApp(ui, server)