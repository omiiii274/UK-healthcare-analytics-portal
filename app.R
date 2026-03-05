# app.R

# Load required libraries
library(shiny)
library(DBI)
library(RPostgres)
library(ggplot2)
library(dplyr)

# Connect to PostgreSQL database
con <- dbConnect(RPostgres::Postgres(),
                 dbname = 'your_db',
                 host = 'your_host',
                 port = 'your_port',
                 user = 'your_user',
                 password = 'your_password')

# Define UI for the application
ui <- fluidPage(
  titlePanel('Cost-Effectiveness Analysis Dashboard'),
  sidebarLayout(
    sidebarPanel(
      # Input UI elements for user selections
      selectInput('study', 'Select Study:', choices = c('Study1', 'Study2')),
      actionButton('update', 'Update')
    ),
    mainPanel(
      tabsetPanel(
        tabPanel('Tornado Diagrams', plotOutput('tornadoPlot')),  
        tabPanel('CE Plane', plotOutput('cePlanePlot')),  
        tabPanel('CEAC', plotOutput('ceacPlot'))  
      )
    )
  )
)

# Define server logic
server <- function(input, output) {
  observeEvent(input$update, {
    # Query database for cost-effectiveness data
    ce_data <- dbGetQuery(con, 'SELECT * FROM cost_effectiveness WHERE study = \' || input$study || '\';')
    
    # Generate Tornado Diagram
    output$tornadoPlot <- renderPlot({
      ggplot(ce_data, aes(x = factor(Variable), y = Value)) +
        geom_bar(stat = 'identity') +
        coord_flip() +
        ggtitle('Tornado Diagram')
    })
    
    # Generate CE Plane
    output$cePlanePlot <- renderPlot({
      ggplot(ce_data, aes(x = Effectiveness, y = Cost)) +
        geom_point() +
        ggtitle('Cost-Effectiveness Plane')
    })
    
    # Generate CEAC
    output$ceacPlot <- renderPlot({
      ggplot(ce_data, aes(x = Willingness_to_Pay, y = Probability)) +
        geom_line() +
        ggtitle('Cost-Effectiveness Acceptability Curve')
    })
  })
}

# Run the application
shinyApp(ui = ui, server = server)