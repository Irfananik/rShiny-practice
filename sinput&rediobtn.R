library(shiny)

animals <- c("Tiger", "Dog", "Cat", "Bird")
bdState <- c("Dhaka", "Chittagong", "Rangpur", "Rajshahi", "Barishal", "Sylhet", "Moymonshing")

ui <- fluidPage(
  checkboxGroupInput("animals", "Select your favourite animal", animals),
  selectInput("state", "select your favourite state", state.name, multiple = TRUE),
  selectInput("bdState", "Select your Bangladeshi state", bdState),
  
  radioButtons(
    "rb", "Chose your react: ",
    choiceNames = list(
      icon("angry"),
      icon("smile"),
      icon("sad-tear")
    ),
    choiceValues = list("angry", "happy", "sad")
  ),
  
  "Upload file:",
  fileInput("upload", NULL),
  
  fluidRow(
    "Action Button",
    actionButton("click", "Click me!", class = "btn-danger"),
    actionButton("drink", "Drink me!", class = "btn-lg btn-success"),
    actionButton("eat", "Eat me!", class = "btn-block")
  ),
)

server <- function(input, output, session){
  
}

shinyApp(ui, server)