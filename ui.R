
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("AP U.S History project, Gracie Little 2 June 2016"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel("Adjust the width and height to fit your browser",
                 # Simple integer interval for width and height of graph
                 sliderInput("width", "width:",
                             min=400, max=900, value=500),
                 sliderInput('height',"height;",
                             min=500, max= 900,value=600)),

    # Show a plot of the motion plot
    mainPanel(
      htmlOutput("MotionPlot")
    )
  )
))
