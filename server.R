#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(UsingR)
data(diamond)
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  model <- lm(price ~ carat, data = diamond)
  modelPred <- reactive({
    predict(model, newdata = data.frame(carat = input$carat))
  })
   
  output$distPlot <- renderPlot({
    plot(diamond$carat, diamond$price, 
         xlab = "Carat of a Diamond",
         ylab = "Price (in dollar $)", 
         xlim = c(0.10, 0.40),
         ylim = c(100, 1250))
    
    if(input$showModel) {
      abline(model, col = "red", lwd = 2)
    }
    
    points(input$carat, modelPred(), 
           col = "red", pch = 16, cex = 2)
  })
  
  output$pred <- renderText({
    modelPred()
  })
})
