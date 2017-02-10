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
                                                 c("Singapore Dollar to Malaysian Ringgit" = "SGD",
                                                   "U.S Dollar to Malaysian Ringgit "= "USD",
                                                   "British Pound to Malaysian Ringgit" = "GBP",
                                                   "Euro to Malaysian Ringgit" = "EURO",
                                                   "Swiss Franc to Malaysian Ringgit" = "CHF",
                                                   "Australian Dollar to Malaysian Ringgit " = "AUD")),
                                    titlePanel("Prediction Model:"),
                                    
                                    radioButtons("model", "",
                                                 c("Homogeneous Model" = "HOMO",
                                                   "Hetrogeneous Model" = "HETRO")),
                                    submitButton("Submit")
                                    ),
                              conditionalPanel(
                                      condition = "input.currency == 'SGD'"  ,
                                      conditionalPanel(
                                              condition = "input.model == 'HOMO'", 
                                              
                                              column(4,
                                                     titlePanel("Inputs:"),
                                                     textInput("sgd_homo_dayOne", "Enter 1st Day  Data:",  placeholder = "3.30"),
                                                     textInput("sgd_homo_dayTwo", "Enter 2nd Day Data:", placeholder = "3.25"),
                                                     textInput("sgd_homo_dayThree", "Enter 3rd Day  Data:", placeholder = "3.23"),
                                                     submitButton("Predict")
                                              )
                                              
                                              
                                              
                                      )
                                      
                              ),
                              
                              conditionalPanel(
                                      condition = "input.currency == 'USD'"  ,
                                      conditionalPanel(
                                              condition = "input.model == 'HOMO'", 
                                              
                                              column(2,
                                                     titlePanel("Inputs:"),
                                                     tags$h1(""),
                                                     tags$h1(""),
                                                     textInput("usd_homo_dayOne", "Enter 1st Day  Data:",  placeholder = "3.30"),
                                                     textInput("usd_homo_dayTwo", "Enter 2nd Day Data:", placeholder = "3.25"),
                                                     textInput("usd_homo_dayThree", "Enter 3rd Day Data:", placeholder = "3.23"),
                                                     textInput("usd_homo_dayFour", "Enter 4th Day Data:", placeholder = "3.23"), 
                                                     submitButton("Predict")
                                                    
                                              ),
                                              column(2,
                                                    br(),
                                                    br(),
                                                    br(),
                                                    br(),
                                                     textInput("usd_homo_dayFive", "Enter 5th Day  Data:",  placeholder = "3.30"),
                                                     textInput("usd_homo_daySix", "Enter 6th Day  Data:", placeholder = "3.25"),
                                                     textInput("usd_homo_daySeven", "Enter 7th Day Data:", placeholder = "3.23"),
                                                     textInput("usd_homo_dayEight", "Enter 8th Day  Data:", placeholder = "3.23"), 
                                                     textInput("usd_homo_dayNine", "Enter 9th Day Data:", placeholder = "3.23")
                                                    
                                              )
                                             
                                                     
                                              
                                      )
                                      
                              ),
                              
                              conditionalPanel(
                                      condition = "input.currency == 'USD'"  ,
                                      conditionalPanel(
                                              condition = "input.model == 'HETRO'", 
                                              
                                              column(4,
                                                     titlePanel("Inputs:"),
                                                     textInput("dayOne", "Enter 1st Day  Data:",  placeholder = "3.30"),
                                                     textInput("dayTwo", "Enter 2nd Day Data:", placeholder = "3.25"),
                                                     textInput("dayThree", "Enter 3rd Day  Data:", placeholder = "3.23"),
                                                     submitButton("Predict")
                                              )
                                              
                                              
                                              
                                      )
                                      
                              ),
                              
                              conditionalPanel(
                                      condition = "input.currency == 'EURO'"  ,
                                      conditionalPanel(
                                              condition = "input.model == 'HOMO'", 
                                              
                                              column(4,
                                                     titlePanel("Inputs:"),
                                                     textInput("dayOne", "Enter 1st Day  Data:",  placeholder = "3.30"),
                                                     textInput("dayTwo", "Enter 2nd Day Data:", placeholder = "3.25"),
                                                     textInput("dayThree", "Enter 3rd Day  Data:", placeholder = "3.23"),
                                                     submitButton("Predict")
                                              )
                                              
                                              
                                              
                                      )
                                      
                              ),
                              conditionalPanel(
                                      condition = "input.currency == 'GBP'"  ,
                                      conditionalPanel(
                                              condition = "input.model == 'HOMO'", 
                                              
                                              column(4,
                                                     titlePanel("Inputs:"),
                                                     textInput("dayOne", "Enter 1st Day  Data:",  placeholder = "3.30"),
                                                     textInput("dayTwo", "Enter 2nd Day Data:", placeholder = "3.25"),
                                                     textInput("dayThree", "Enter 3rd Day  Data:", placeholder = "3.23"),
                                                     submitButton("Predict")
                                              )
                                              
                                              
                                              
                                      )
                                      
                              ),
                              conditionalPanel(
                                      condition = "input.currency == 'GBP'"  ,
                                      conditionalPanel(
                                              condition = "input.model == 'HETRO'", 
                                              
                                              column(4,
                                                     titlePanel("Inputs:"),
                                                     textInput("dayOne", "Enter 1st Day  Data:",  placeholder = "3.30"),
                                                     textInput("dayTwo", "Enter 2nd Day Data:", placeholder = "3.25"),
                                                     textInput("dayThree", "Enter 3rd Day  Data:", placeholder = "3.23"),
                                                     textInput("dayFour", "Enter 4th Day Data:", placeholder = "3.23"), 
                                                     submitButton("Predict")
                                              )
                                              
                                              
                                              
                                      )
                                      
                              ),
                              conditionalPanel(
                                      condition = "input.currency == 'EURO'"  ,
                                      conditionalPanel(
                                              condition = "input.model == 'HETRO'", 
                                              
                                              column(4,
                                                     titlePanel("Inputs:"),
                                                     textInput("dayOne", "Enter 1st Day  Data:",  placeholder = "3.30"),
                                                     textInput("dayTwo", "Enter 2nd Day Data:", placeholder = "3.25"),
                                                     textInput("dayThree", "Enter 3rd Day  Data:", placeholder = "3.23"),
                                                     submitButton("Predict")
                                              )
                                              
                                              
                                              
                                      )
                                      
                              ),
                              
                            
                              conditionalPanel(
                                      condition = "input.currency == 'SGD'"  ,
                                      conditionalPanel(
                                              condition = "input.model == 'HETRO'", 
                                              
                                              column(4,
                                                     titlePanel("Inputs:"),
                                                     textInput("dayOne", "Enter 1st Day  Data:",  placeholder = "3.30"),
                                                     textInput("dayTwo", "Enter 2nd Day Data:", placeholder = "3.25"),
                                                     textInput("dayThree", "Enter 3rd Day  Data:", placeholder = "3.23"),
                                                     submitButton("Predict")
                                              )
                                              
                                              
                                              
                                      )
                                      
                              ),
                              
                              conditionalPanel(
                                      condition = "input.currency == 'AUD'"  ,
                                      conditionalPanel(
                                              condition = "input.model == 'HETRO'", 
                                              
                                              column(4,
                                                     titlePanel("Inputs:"),
                                                     textInput("dayOne", "Enter 1st Day  Data:",  placeholder = "3.30"),
                                                     textInput("dayTwo", "Enter 2nd Day Data:", placeholder = "3.25"),
                                                     textInput("dayThree", "Enter 3rd Day  Data:", placeholder = "3.23"),
                                                     submitButton("Predict")
                                              )
                                              
                                              
                                              
                                      )
                                      
                              ),
                              
                              conditionalPanel(
                                      condition = "input.currency == 'AUD'"  ,
                                      conditionalPanel(
                                              condition = "input.model == 'HOMO'", 
                                              
                                              column(2,
                                                     titlePanel("Inputs:"),
                                                     tags$h1(""),
                                                     tags$h1(""),
                                                     textInput("dayOne", "Enter 1st Day  Data:",  placeholder = "3.30"),
                                                     textInput("dayTwo", "Enter 2nd Day Data:", placeholder = "3.25"),
                                                     textInput("dayThree", "Enter 3rd Day Data:", placeholder = "3.23"),
                                                     textInput("dayFour", "Enter 4th Day Data:", placeholder = "3.23"), 
                                                     submitButton("Predict")
                                              ),
                                              column(2,
                                                     br(),
                                                     br(),
                                                     br(),
                                                     br(),
                                                     textInput("dayFive", "Enter 5th Day  Data:",  placeholder = "3.30"),
                                                     textInput("daySix", "Enter 6th Day  Data:", placeholder = "3.25"),
                                                     textInput("daySeven", "Enter 7th Day Data:", placeholder = "3.23"),
                                                     textInput("dayEight", "Enter 8th Day  Data:", placeholder = "3.23"), 
                                                     textInput("dayNine", "Enter 9th Day Data:", placeholder = "3.23")
                                                     
                                              )
                                              
                                              
                                              
                                      )
                                      
                              ),
                              conditionalPanel(
                                      condition = "input.currency == 'CHF'"  ,
                                      conditionalPanel(
                                              condition = "input.model == 'HOMO'", 
                                              
                                              column(2,
                                                     titlePanel("Inputs:"),
                                                     tags$h1(""),
                                                     tags$h1(""),
                                                     textInput("dayOne", "Enter 1st Day  Data:",  placeholder = "3.30"),
                                                     textInput("dayTwo", "Enter 2nd Day Data:", placeholder = "3.25"),
                                                     textInput("dayThree", "Enter 3rd Day Data:", placeholder = "3.23"),
                                                     textInput("dayFour", "Enter 4th Day Data:", placeholder = "3.23"), 
                                                     submitButton("Predict")
                                              ),
                                              column(2,
                                                     br(),
                                                     br(),
                                                     br(),
                                                     br(),
                                                     textInput("dayFive", "Enter 5th Day  Data:",  placeholder = "3.30"),
                                                     textInput("daySix", "Enter 6th Day  Data:", placeholder = "3.25"),
                                                     textInput("daySeven", "Enter 7th Day Data:", placeholder = "3.23"),
                                                     textInput("dayEight", "Enter 8th Day  Data:", placeholder = "3.23"), 
                                                     textInput("dayNine", "Enter 9th Day Data:", placeholder = "3.23")
                                              )
                                              
                                              
                                              
                                      )
                                      
                              ),
                              conditionalPanel(
                                      condition = "input.currency == 'CHF'"  ,
                                      conditionalPanel(
                                              condition = "input.model == 'HETRO'", 
                                              
                                              column(2,
                                                     titlePanel("Inputs:"),
                                                     tags$h1(""),
                                                     tags$h1(""),
                                                     textInput("dayOne", "Enter 1st Day  Data:",  placeholder = "3.30"),
                                                     textInput("dayTwo", "Enter 2nd Day Data:", placeholder = "3.25"),
                                                     textInput("dayThree", "Enter 3rd Day Data:", placeholder = "3.23"),
                                                     textInput("dayFour", "Enter 4th Day Data:", placeholder = "3.23"), 
                                                     submitButton("Predict") 
                                              ),
                                              column(2,
                                                     br(),
                                                     br(),
                                                     br(),
                                                     br(),
                                                     textInput("dayFive", "Enter 5th Day  Data:",  placeholder = "3.30"),
                                                     textInput("daySix", "Enter 6th Day  Data:", placeholder = "3.25"),
                                                     textInput("daySeven", "Enter 7th Day Data:", placeholder = "3.23"),
                                                     textInput("dayEight", "Enter 8th Day  Data:", placeholder = "3.23")
                                                     
                                              )
                                              
                                              
                                              
                                      )
                                      
                              ),
                              column(4,
                                     
                                             
                                     titlePanel("Results:"),
                                     h3("Predicted Next Day Exchange Rate:"),
                                     tags$strong(tags$span("RM ")),
                                     
                                     tags$span(tags$strong(textOutput("result1"))),
                                     
                                     tags$h1(""),
                                     tags$h1(""),
                                     tags$strong( helpText("Note: The number of inputs are selected based on the best opitimal models 
                                        which yeild lowest Rooted Mean Square Error (RMSE).") )
                                     
                                     
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
tabPanel("How to Use",
         
         fluidRow(
                 column(12,
                        tags$strong(
                                helpText("Testing Phase: Please use ONLY USD Dataset for now")),
                        column(9,
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
                        
                 )
         ), # Step and model end
         fluidRow(
                 column(12,
                        titlePanel( "Test Datasets"),
                        tags$strong(
                        tabsetPanel(
                                tabPanel("Singapore Dollar ",
                                         dataTableOutput("test_data7")),
                                tabPanel("U.S Dollar",
                                         dataTableOutput("test_data1")),
                                tabPanel("British Pound ",
                                         dataTableOutput("test_data2")),
                                tabPanel("Euro",
                                         dataTableOutput("test_data3")),
                                tabPanel("Swiss Franc",
                                         dataTableOutput("test_data4")),
                                tabPanel("Australian Dollar ",
                                         dataTableOutput("test_data5"))
                               
                        )
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


