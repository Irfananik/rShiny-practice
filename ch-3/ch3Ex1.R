library(shiny)
ui <- fluidPage(
  textInput("name", "Enter your name here"),
  textOutput("greeting")
)
  
server <- function(input, output, session){
  output$greeting <- renderText(paste0("Hello ", input$name))
}

#server <- function(input, output, session){
  #greeting <- reactive({
    #paste0("Hello ", input$name)
 #})
  #output$greeting <- renderText({
    #greeting()
  #})
#}

#server <- function(input, output, server) {
  #output$greting <- renderText(paste0("Hello", input$name))
#}


shinyApp(ui, server)