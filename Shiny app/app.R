library(shiny)


ui <- fluidPage(
  titlePanel("Z to P"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("zInput", "Z", 0, 3.4, 0, step = 0.1)
    ),
    mainPanel(
      verbatimTextOutput("results")
    )
  )
)

server <- function(input, output) {
  P <- reactive({pnorm(-abs(input$zInput))
  })
  output$results <- renderPrint({
    P()
  })
}

shinyApp(ui = ui, server = server)