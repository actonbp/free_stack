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

############################

ui <- fluidPage(
  sidebarLayout(
    mainPanel(

      selectInput("pickvalue", label = "Choose your twitter name to see your stack", unique(data$stack),
                  selected = "NULL", multiple = F)),


    tableOutput("tableOut")

  )
)


server <- function(input, output, session){


  gears <- reactive({

    dat <- data

    if (!is.null(input$pickvalue)){dat <- dat %>% filter(stack %in% input$pickvalue)}

    dat <- dat

    return(dat)

  })

  output$tableOut<- renderTable({gears()})

}

shinyApp(ui = ui, server=server)
