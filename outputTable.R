library(shiny)
ui <- fluidPage(
  HTML("<h2 style='font-weight: bold;'>This is a static dataset</h2>"),
  tableOutput("static"),
  
  HTML("<h2 style='font-weight: bold;'>This is a dynamic dataset</h2>"),
  dataTableOutput("dynamic")
)

server <- function(input, output, session){
  output$static <- renderTable(head(mtcars))
  output$dynamic <- renderDataTable(mtcars, options = list(pageLength = 7))
}

shinyApp(ui, server)