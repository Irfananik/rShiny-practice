library(shiny)
ui <- fluidPage(
  textInput("name", "Enter your name"),
  passwordInput("password", "Enter your password"),
  textAreaInput("story", "Your comment")
)

server <- function(input, output, session){
  
}

shinyApp(ui, server)