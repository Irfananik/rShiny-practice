library(shiny)

ui <- fluidPage(
  selectInput("territory", "Territory", choices = NULL),
  tableOutput("selected")
)

server <- function(input, output, session) {
  # Create a sample sales data frame (replace this with your actual data)
  #data.frame - created with columns TERRITORY and SalesAmount.Replace this with your actual data.
  sales <- data.frame(
    TERRITORY = c("North", "South", "East", "West","North", "South", "East", "West"),
    SalesAmount = c(100, 150, 200, 120, 180, 130, 160, 110)
  )
  
  # Update choices in selectInput
  updateSelectInput(session, "territory", choices = sales$TERRITORY)
  
  #filters the sales
  selected <- reactive({
    sales[sales$TERRITORY == input$territory, ]
  })
  
  output$selected <- renderTable({
    head(selected(), 10)
  })
}

shinyApp(ui, server)