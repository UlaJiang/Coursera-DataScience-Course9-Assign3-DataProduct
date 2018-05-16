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
  titlePanel("Predict Diamnd Price from Carat"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("carat",
                   "What is the carat of the diamond?",
                   min = 0.10,
                   max = 0.40,
                   value = 0.20),
       checkboxInput("showModel", 
                     "Show/Hide Model", 
                     value = TRUE)
    ),
    # Show a plot of the generated distribution
    mainPanel(
       h3("Plot of diamond dataset with its linear model (optional)"),
       plotOutput("distPlot"),
       h3("Predicted Price (in dollar $) from Model"),
       textOutput("pred")
    )
  )
))
