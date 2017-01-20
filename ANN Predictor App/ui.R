#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
#library(rsconnect)
#rsconnect::deployApp('~/Desktop/FYP_WEP_APP/ANN Predictor App')

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = "bootstrap.css",
              titlePanel("ANN  Exchange Rate Predictor"),
  # Application title
  navbarPage("",
             header = tags$head(tags$link(rel = "stylesheet", 
                                          type = "text/css", href = "style.css")),
             
             tabPanel("Exchange Rate Predictor",
                      h4("Note: For the first time tester, please refer to the How To Use page") ,
                      fluidRow(
                              column(4,
                                     titlePanel(" Currency:"),
                                    radioButtons("currency", "",
                                                 c("Malaysian Ringgit to U.S Dollar" = "USD",
                                                   "Malaysian Ringgit to British Pound" = "GBP",
                                                   "Malaysian Ringgit to Euro" = "EURO",
                                                   "Malaysian Ringgit to Swiss Franc" = "CHF",
                                                   "Malaysian Ringgit to Australian Dollar " = "AUD",
                                                   "Malaysian Ringgit to Canadian Dollar" = "CAD",
                                                   "Malaysian Ringgit to Singapore Dollar" = "SGD")),
                                    titlePanel("Prediction Model:"),
                                    radioButtons("model", "",
                                                 c("Homogeneous Model" = "HOMO",
                                                   "Hetrogeneous Model" = "HETRO")),
                                    submitButton("Predict")
                                    ),
                              
                              column(4,
                                     titlePanel("Inputs:"),
                                     textInput("dayOne", "Enter First Day Input Data:",  placeholder = "3.30"),
                                     textInput("dayTwo", "Enter Second Day Input Data:", placeholder = "3.25"),
                                     textInput("dayThree", "Enter Third Day Input Data:", placeholder = "3.23")
                                     #textInput("dayFour", "Enter Fourth Day Input Data:", placeholder = "3.23")
                                     
                                     
                              ),
                              column(4,
                                    
                                     titlePanel("Results:"),
                                     h3("Predicted Tomorrow exchange rate is:"),
                                     textOutput("result1")
                                     
                              )
                              
                              
                      )
                      ),
             
             
             
             tabPanel("Project Description",

                      fluidRow(
                              column(12,
                                     textOutput("")
                      ))),
             
             tabPanel("How to Use " ,
                      
                      fluidRow(
                              column(12,
                                     textOutput("")
                              ))),
             
             tabPanel("About Me " ,
                      
                      fluidRow(
                              column(12,
                                     textOutput("")
                              )))
            
  ))
             
)

  # Sidebar with a slider input for number of bins 

