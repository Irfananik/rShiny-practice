library(shiny)

ui <- fluidPage(
  fluidRow(
    column(width = 6,
           plotOutput("plot1")
    ),
    column(width = 6,
           plotOutput("plot2")
    ),
    column(width = 12,
           offset = 3,
           sliderInput("sInput", "Number of observations:", min = 0, max = 500, value = 250)
    )
  )
)

server <- function(input, output, session) {
  output$plot1 <- renderPlot({
    # first plot
    hist(rnorm(input$sInput), main = "Plot 1")
  })
  
  output$plot2 <- renderPlot({
    # second plot
    hist(runif(input$sInput), main = "Plot 2")
  })
}

shinyApp(ui, server)