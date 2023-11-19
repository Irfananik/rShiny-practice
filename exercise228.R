library(shiny)
ui <- fluidPage(
  "Exercises-1:",
  textInput("text","Your name", placeholder = "Enter Your name here!"),
  
  "Exercise-2",
  sliderInput("birthday_slider", "When should we deliver",
              min = as.numeric(as.Date("2020-09-16")),
              max = as.numeric(as.Date("2020-09-23")),
              value = c(as.numeric(as.Date("2020-09-17")), as.numeric(as.Date("2020-09-17"))),
              step = 1),
  
  "Exercise-3",
  sliderInput( "num", "Ex3",
               min = 0,
               max = 100,
               value = c(0,0),
               step = 5
  ),
  actionButton("play", "Play", class = "btn-lg btn-success"),
  
  "Exercise-4",
  selectInput(
    "fruit", "select fruit",
    choices = list(
      "Citrus" = c("Orange", "Lemon", "Grapefruit"),
      "Berries" = c("Strawberry", "Blueberry", "Raspberry"),
      "Tropical" = c("Banana", "Pineapple", "Mango")
    )
  )
  
)

server <- function(input, output, session){
  
}

shinyApp(ui, server)