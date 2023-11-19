library(shiny)

ui <- fluidPage(
  titlePanel("SelectInput with Subheadings"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("fruit", "Select a fruit",
                  choices = list(
                    "Citrus" = c("Orange", "Lemon", "Grapefruit"),
                    "Berries" = c("Strawberry", "Blueberry", "Raspberry"),
                    "Tropical" = c("Banana", "Pineapple", "Mango")
                  )
      )
    ),
    mainPanel(
      textOutput("selected_fruit")
    )
  )
)

server <- function(input, output) {
  output$selected_fruit <- renderText({
    paste("You selected:", input$fruit)
  })
}

shinyApp(ui, server)
