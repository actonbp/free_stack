#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(DT)
data <- read.csv("data.csv")

data <- data%>%
    mutate(stack = as.factor(stack))

stack <- setNames(as.list(data$stack), data$stack)

### UI
ui <- fluidPage(
    selectInput("stack_choice", label = "Select Twitter Name", choices = stack),
    DT::dataTableOutput("mytable")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  react_dat <- reactive({
    dat <- data %>% filter(input$stack_choice %in% data$stack)
    return(dat)
  })
  output$mytable = DT::renderDataTable({
    react_dat
  })
}

# Run the application
shinyApp(ui = ui, server = server)
