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
shinyUI(fluidPage(theme = "bootstrap.css",
              titlePanel("ANN  Exchange Rate Predictor"),
  # Application title
  navbarPage("",
             header = tags$head(tags$link(rel = "stylesheet", 
                                          type = "text/css", href = "style.css")),
             tabPanel("Exchange Rate Predictor",
                      fluidRow(
                              column(3,
                                     titlePanel("Input"),
                                     textInput("dayOne", "Enter First Day Input Data:",placeholder = "3.30"),
                                     textInput("dayTwo", "Enter Second Day Input Data:", placeholder = "3.25"),
                                     textInput("dayThree", "Enter Third Day Input Data:", placeholder = "3.23"),
                                     submitButton("Predict")
                              ),
                              column(6,
                                     plotOutput("")
                              )
                              
                              
                      )
                      ),
             
             
             
             tabPanel("Project Description",

                      fluidRow(
                              column(6,
                                     
                                     sliderInput("slideMGP", "Enter MPG",
                                                 10,35, value = 20),
                                     checkboxInput("showModel1","Show/Hide Model 1",
                                                   value = T),   
                                     checkboxInput("showModel2", "Show/Hide Model 2", value = T),
                                     submitButton("Submit")
                              ),
                              column(6,
                                     plotOutput("plot1"),
                                     h3("Predict Horsepower from Model 1: "),
                                     textOutput("pred1"),
                                     h3("Predicted Horsepower from Model 2:"),
                                     textOutput("pred2")
                              )
                              
                              
                      )
                      ),
             tabPanel("How to Use " ,
                      sliderInput("slideMGP", "Enter MPG",
                                  10,35, value = 20),
                      checkboxInput("showModel1","Show/Hide Model 1",
                                    value = T),   
                      checkboxInput("showModel2", "Show/Hide Model 2", value = T),
                      submitButton("Submit")
                      ),
             tabPanel("About Me " ,
                      sliderInput("slideMGP", "Enter MPG",
                                  10,35, value = 20),
                      checkboxInput("showModel1","Show/Hide Model 1",
                                    value = T),   
                      checkboxInput("showModel2", "Show/Hide Model 2", value = T),
                      submitButton("Submit")
             )
  )
  
             


  # Sidebar with a slider input for number of bins 

))
