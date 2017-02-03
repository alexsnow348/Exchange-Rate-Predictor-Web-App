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
                                                 
                                                 c("U.S Dollar to Malaysian Ringgit "= "USD",
                                                   "British Pound to Malaysian Ringgit" = "GBP",
                                                   "Euro to Malaysian Ringgit" = "EURO",
                                                   "Swiss Franc to Malaysian Ringgit" = "CHF",
                                                   "Australian Dollar to Malaysian Ringgit " = "AUD",
                                                   "Singapore Dollar to Malaysian Ringgit" = "SGD")),
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
                                     h3("Predicted Next Day Exchange Rate:"),
                                     tags$strong(tags$span("RM ")),
                                     tags$span(tags$strong(textOutput("result1"))),
                                     tags$h1(""),
                                     tags$h1(""),
                                     tags$strong( helpText("Note: The number of inputs are selected based on the best opitimal models 
                                        which yeild lowest Rooted Mean Square Error(RMSE).") )
                                     
                                     
                              )
                              
                              
                      )
                      ),
             
             
             
             tabPanel("Project Description",

                      fluidRow(
                              column(12,
                                     tags$h3("For now, Please visit the presentation slide of the project."),
                                    tags$a(href="https://docs.google.com/presentation/d/1m9pZClslKSyQQ-nwjuojCsFIyv21bJ6UiRBnUwra83w/edit?usp=sharing", 
                                           tags$strong("Here!"))
                                   
                      ))),
             
             tabPanel("How to Use " ,
                      
                      fluidRow(
                              column(12,
                                     tags$strong(
                                             helpText("Testing Phase: Please use ONLY USD Dataset for now")
                                     ),
                                     tags$h1(""),
                                     tags$h2("Steps:"),
                                     tags$h1(""),
                                     
                                     
                                     tags$ol(
                                             tags$strong(
                                                     tags$li("Select the Currency for Prediction."), 
                                                     tags$p(""),
                                                     tags$li("Select the Model."), 
                                                     tags$p(""),
                                                     tags$li("Please Enter the inputs by referring test dataset based on 
                                                             Currency."),
                                                     tags$p(""),
                                                     tags$li("Please Copy and Paste the desired row to test out."),
                                                     tags$p(""),
                                                     tags$li("Click Predict Button."),
                                                     tags$p(""),
                                                     tags$li("Please come back to How to Use Page to compare
                                                             the predicted result with NextDay value")
                                                     
                                             )
                                             
                                             
                                     )
                              )
                            
                      ),
                      tags$h1(""),
                      fluidRow(
                              column(12,
                                     
                                     
                                     navlistPanel(
                                             "Test Data Sets",
                                             tabPanel("U.S Dollar",
                                                      dataTableOutput("test_data1")),
                                             tabPanel("British Pound ",
                                                      dataTableOutput("test_data2")),
                                             tabPanel("Euro",
                                                      dataTableOutput("test_data3")),
                                             tabPanel("Swiss Franc",
                                                      dataTableOutput("test_data4")),
                                             tabPanel("Australian Dollar ",
                                                      dataTableOutput("test_data5")),
                                             tabPanel("Singapore Dollar ",
                                                      dataTableOutput("test_data7"))
                                     )
                              )
                      )
                      ),
             
             tabPanel("About Me " ,
                      
                      fluidRow(
                              column(12,
                                     
                                     tags$h2("Wut Hmone Hnin Hlaing"),
                                     tags$h3("Junior Data Scientist"),
                                     tags$h5("+601128174379"),
                                     tags$h5("whlaing10@gmail.com"),
                                     tags$a(href="https://github.com/wuthmone",tags$strong("GitHub")),
                                     tags$a(href="https://www.linkedin.com/in/wuthmonehninhlaing", tags$strong( "LinkedIn"))
                                     
                                    
                              )))
            
  ))
             
)

  # Sidebar with a slider input for number of bins 

