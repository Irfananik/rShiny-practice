library(shiny)

ui <- fluidPage(
  h2("Using reactiveValues and reactiveVal"),
  fluidRow(
    column(6,
           actionButton("incrementValues", "Increment using reactiveValues"),
           actionButton("dicrimentValues", "Dicriment using reactiveValues"),
           textOutput("outputValues")
    ),
    column(6,
           actionButton("incrementVal", "Increment using reactiveVal"),
           actionButton("dicrimentVal", "Increment using reactiveVal"),
           textOutput("outputVal")
    )
  )
)

server <- function(input, output, session) {
  # Using reactiveValues
  values <- reactiveValues(
    counterValues = 0
  )
  
  observeEvent(input$incrementValues, {
    values$counterValues <- values$counterValues + 1
  })
  observeEvent(input$dicrimentValues, {
    values$counterValues <- values$counterValues - 1
  })
  
  output$outputValues <- renderText({
    paste("Counter (reactiveValues):", values$counterValues)
  })
  
  # Using reactiveVal
  counterVal <- reactiveVal(0)
  
  observeEvent(input$incrementVal, {
    counterVal(counterVal() + 1)
  })
  observeEvent(input$dicrimentVal, {
    counterVal(counterVal() - 1)
  })
  
  output$outputVal <- renderText({
    paste("Counter (reactiveVal):", counterVal())
  })
}

shinyApp(ui, server)