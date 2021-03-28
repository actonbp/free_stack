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
data <- read.csv("data.csv")

data <- data%>%
    mutate(stack = as.factor(stack))


### UI
ui <- fluidPage(
    selectInput(data$stack, label = "Select Twitter Name", choices = c("All",unique(data$stack)))
)

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application
shinyApp(ui = ui, server = server)
