# Tornado Diagram Shiny Module

# Load required libraries
library(shiny)

# Define the UI for the tornado module
mod_tornado_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h3("Tornado Diagram"),
    plotOutput(ns("tornado_plot"))
  )
}

# Define the server logic for the tornado module
mod_tornado_server <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    output$tornado_plot <- renderPlot({
      # Sample data (replace with actual sensitivity analysis data)
      # This should be a data frame with columns: "Parameter", "Estimate"
      df <- data()  # Assuming data() provides the data

      # Create a tornado plot
      barplot(df$Estimate,
              names.arg = df$Parameter,
              horiz = TRUE,
              las = 1,
              col = "steelblue",
              main = "Parameter Sensitivity Analysis")
    })
  })
}

# Example of how to use the module in your app:
# ui <- fluidPage(
#   mod_tornado_ui("tornado1")
# )
# server <- function(input, output) {
#   mod_tornado_server("tornado1", reactive({
#     data.frame(Parameter = c("Param1", "Param2"), Estimate = c(10, 20))
#   }))
# }
# shinyApp(ui, server)