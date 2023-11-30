library(shiny)

ui <- fluidPage(
  # User interface components go here
  textOutput("output_text"),
  actionButton("update_button", "Update Value")
)

server <- function(input, output, session) {
  # Server logic goes here
  my_val <- reactiveVal(0)
  
  observe({
    # Code to execute whenever my_val changes
    output$output_text <- renderText({
      value <- my_val()
      # Additional computation based on the value
      value * 2
    })
  })
  
  observeEvent(input$update_button, {
    # Code to execute when the "Update Value" button is clicked
    my_val(my_val() + 1)
  })
}

shinyApp(ui, server)