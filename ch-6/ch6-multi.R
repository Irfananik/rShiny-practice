library(shiny)

ui <- fluidPage(
  tabsetPanel(
    tabPanel("Import data", 
             fileInput("file", "Data", buttonLabel = "Upload..."),
             textInput("name", "Enter your name", ""),
             textInput("email", "Enter your email"),
             numericInput("number", "Enter your number", 0, min = 0)
    ),
    
    tabPanel("Histogram with slider input",
             fluidRow(
               column(4,
                      sliderInput("sInput", "Number of observations:", min = 0, max = 500, value = 250),
               ),
               column(8,
                      plotOutput("distPlot")
               )
             )
    ),
    tabPanel("Tird panel")
),
)

server <- function(input, output, session) {
  #histogram output
  output$distPlot <- renderPlot({
    hist(rnorm(input$sInput))
  })
}

shinyApp(ui, server)