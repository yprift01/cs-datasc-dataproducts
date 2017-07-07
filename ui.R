#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("MPG Cars Data"),
  
  x<-list(
          tags$h3("Inline Help"), 
          tags$p("To change output select type of chart forom the drop down."), 
          tags$p("Wait for the new content to render.")
        ),
  sidebarLayout(
   
    sidebarPanel(
      selectInput("variable", "Type of plot:",
                  c("Box Plot" = "boxplot",
                    "Point" = "point",
                    "Multiple" = "sets"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
