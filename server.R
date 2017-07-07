#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(datasets)



# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),
                        labels=c("3gears","4gears","5gears")) 
  mtcars$am <- factor(mtcars$am,levels=c(0,1),
                      labels=c("Automatic","Manual")) 
  mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8),
                       labels=c("4cyl","6cyl","8cyl"))  
  
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
  
    myvar <- input$variable
    
    if(myvar == "boxplot")
      qplot(gear, mpg, data=mtcars, geom=c("boxplot", "jitter"), 
          fill=gear, main="Mileage by Gear Number",
          xlab="", ylab="Miles per Gallon")
    else if(myvar == "point")
      qplot(wt, mpg, data=mtcars, geom=c("point", "smooth"), 
            method="lm", formula=y~x, color=cyl, 
            main="Regression of MPG on Weight", 
            xlab="Weight", ylab="Miles per Gallon")
    else if(myvar=="sets")
      qplot(hp, mpg, data=mtcars, shape=am, color=am, 
            facets=gear~cyl, size=I(3),
            xlab="Horsepower", ylab="Miles per Gallon") 
    
  })
  
})
