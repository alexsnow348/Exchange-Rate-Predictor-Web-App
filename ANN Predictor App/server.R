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
                        
                        value1 <- as.numeric(input$dayOne)
                        value2 <- as.numeric(input$dayTwo)
                        value3 <- as.numeric(input$dayThree)
                        
                        test <- cbind(value1,value2,value3)
                        normalized_test <-  (test-min(test))/(max(test)-min(test))
                        
                        
                        model_results <- neuralnet::compute(homo_model1, normalized_test)
                        predicted_oneDayhead <- model_results$net.result
                        
                        model_results2 <- neuralnet::compute(homo_model2, normalized_test)
                        predicted_oneDayhead2 <- model_results2$net.result
                        
                        model_results3 <- neuralnet::compute(homo_model3, normalized_test)
                        predicted_oneDayhead3 <- model_results3$net.result
                        
                        all_predicted <- cbind(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                        result <- denormalized(all_predicted,test)
                
                        max(result)
                       
                }
              
      })
        
        output$result1 <- renderText({
                        test_result()
                
        })

        output$test_data1 <- renderDataTable({
                
                test_data <- denormalized(data_set[[1]][[predictor_order-2]][[2]],usd_non_normalize) 
                names(test_data) <- c("FirstDay","SecondDay","ThirdDay","Next Day")
                head(test_data,10)
                
                
        })
})
