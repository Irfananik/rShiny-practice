library(shiny)
ui <- fluidPage(
  #case 1
  verbatimTextOutput("myOutput"),
  #case 2
  textOutput("textoutput"),
  #case 3
  verbatimTextOutput("myOutput2"),
  #case 4
  textOutput("myOutput3")
)

server <- function(input, output, session){
  output$myOutput <- renderPrint({
    summary(mtcars)
  })
  
  output$textoutput <- renderText({
    "Good Mornning!"
  })
  
  output$myOutput2 <- renderPrint({
    t.test(1:5, 2:6)
  })
  
  output$myOutput3 <- renderText({
    str(lm(mpg ~ wt, data = mtcars))
  })
}

shinyApp(ui, server)