
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
source("global.R")

shinyServer(function(input, output) {

  output$MotionPlot <- renderGvis({
    width1 <- input$width
    height1 <- input$height
    gvisMotionChart(pc_Ed_inf, idvar="variable", timevar="year",
                          options=list(width=width1,height=height1))
    

  })

})
