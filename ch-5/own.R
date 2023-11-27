library(shiny)

ui <- fluidPage(
  titlePanel("Enter you data here!"),
  verbatimTextOutput("tOutput"),
  textInput("tInput1", "Enter your name: "),
  textInput("tInput2", "Enter your eamail: "),
  textInput("tInput3", "Enter Your designation: "),
  numericInput("nInput", "Enter your number: ", value = 0),
  actionButton("showButton", "Show Input Data")
)

server <- function(input, output, session) {
  observeEvent(input$showButton, {
    output$tOutput <- renderText({
      paste(
        "Name:", input$tInput1,"\n",
        "Email:", input$tInput2, "\n",
        "Designation:", input$tInput3, "\n",
        "Number:", input$nInput, "\n"
      )
    })
  })
}

shinyApp(ui, server)