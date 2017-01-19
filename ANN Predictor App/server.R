#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        source("./libraries.R")
        source("./functions.R")
        
        predictor_order <- 3
        row_select <- 1
       
      
        test_result <- reactive({
                if(input$currency=="USD" && input$model=="HOMO"){
                        homo_model1 <- Result_USD_HOMO_LIST[[row_select]][[5]][[6]][[1]]   
                        homo_model2 <- Result_USD_HOMO_LIST[[row_select]][[5]][[6]][[2]]   
                        homo_model3 <- Result_USD_HOMO_LIST[[row_select]][[5]][[6]][[3]] 
                        usd_non_normalize <- data_set[[1]][[predictor_order - 2]][[6]] 
                        
                        value1 <- as.numeric(input$dayOne)
                        value2 <- as.numeric(input$dayTwo)
                        value3 <- as.numeric(input$dayThree)
                        
                        firstDay <- denormalized(value1,usd_non_normalize)
                        secondDay <- denormalized(value2,usd_non_normalize)
                        thirdDay <- denormalized(value3,usd_non_normalize)
                        
                        test <- cbind(firstDay,secondDay,thirdDay)
                        
                        model_results <- neuralnet::compute(homo_model1, test)
                        predicted_oneDayhead <- denormalized(model_results$net.result,usd_non_normalize)
                        
                        model_results2 <- neuralnet::compute(homo_model2, test)
                        predicted_oneDayhead2 <- denormalized(model_results2$net.result,usd_non_normalize)
                        
                        model_results3 <- neuralnet::compute(homo_model3, test)
                        predicted_oneDayhead3 <- denormalized(model_results3$net.result,usd_non_normalize)
                        
                        
                        max(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                }
              
                
              
      })
        
        output$result1 <- renderText({
                test_result()
        })
})
