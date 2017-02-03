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
    
        test_result <- reactive({
                
                # HOMO Model
                if(input$currency=="USD" && input$model=="HOMO"){
                        
                        predictor_order <- 3
                     
                        
                        value1 <- as.numeric(input$dayOne)
                        value2 <- as.numeric(input$dayTwo)
                        value3 <- as.numeric(input$dayThree)
                        
                        test <- cbind(value1,value2,value3)
                        normalized_test <-  (test-min(test))/(max(test)-min(test))
                        
                        
                        model_results <- neuralnet::compute(homo_usd_model1_60, normalized_test)
                        predicted_oneDayhead <- model_results$net.result
                        
                        model_results2 <- neuralnet::compute(homo_usd_model2_60, normalized_test)
                        predicted_oneDayhead2 <- model_results2$net.result
                        
                        model_results3 <- neuralnet::compute(homo_usd_model3_60, normalized_test)
                        predicted_oneDayhead3 <- model_results3$net.result
                        
                        all_predicted <- cbind(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                        result <- denormalized(all_predicted,test)
                
                       return(max(result)) 
                       
                }

               # if(input$currency=="GBP" && input$model=="HOMO"){}
                #if(input$currency=="EURO" && input$model=="HOMO"){}
                #if(input$currency=="CHF" && input$model=="HOMO"){}
                #if(input$currency=="AUD" && input$model=="HOMO"){}
                #if(input$currency=="CAD" && input$model=="HOMO"){}
                #if(input$currency=="SGD" && input$model=="HOMO"){}
                
                
                ## Hetro Model
                #if(input$currency=="USD" && input$model=="HETRO"){}
                #if(input$currency=="GBP" && input$model=="HETRO"){}
                #if(input$currency=="EURO" && input$model=="HETRO"){}
                #if(input$currency=="CHF" && input$model=="HETRO"){}
                #if(input$currency=="AUD" && input$model=="HETRO"){}
                #if(input$currency=="CAD" && input$model=="HETRO"){}
                #if(input$currency=="SGD" && input$model=="HETRO"){}

                
          
              
      })
        
        output$result1 <- renderText({
                        test_result()
                
        })

        output$test_data1 <- renderDataTable({
                
                test_data1 <- denormalized(data_set_60[[1]][[predictor_order-2]][[3]],data_set_60[[1]][[predictor_order-2]][[6]]) 
                names(test_data1) <- c("FirstDay","SecondDay","ThirdDay","Next Day")
                tail(test_data1,10)
                
                
        })
        output$test_data2 <- renderDataTable({
                
                test_data2 <- denormalized(data_set[[2]][[predictor_order-2]][[2]],data_set[[2]][[predictor_order-2]][[6]]) 
                names(test_data2) <- c("FirstDay","SecondDay","ThirdDay","Next Day")
                head(test_data2,10)
                
                
        })
        output$test_data3 <- renderDataTable({
                
                test_data3 <- denormalized(data_set[[3]][[predictor_order-2]][[2]],data_set[[3]][[predictor_order-2]][[6]]) 
                names(test_data3) <- c("FirstDay","SecondDay","ThirdDay","Next Day")
                head(test_data3,10)
                
                
        })
        output$test_data4 <- renderDataTable({
                
                test_data4 <- denormalized(data_set[[4]][[predictor_order-2]][[2]],data_set[[4]][[predictor_order-2]][[6]]) 
                names(test_data4) <- c("FirstDay","SecondDay","ThirdDay","Next Day")
                head(test_data4,10)
                
                
        })
        output$test_data5 <- renderDataTable({
                
                test_data5 <- denormalized(data_set[[5]][[predictor_order-2]][[2]],data_set[[5]][[predictor_order-2]][[6]]) 
                names(test_data5) <- c("FirstDay","SecondDay","ThirdDay","Next Day")
                head(test_data5,10)
                
                
        })
    
        output$test_data7 <- renderDataTable({
                
                test_data7 <- denormalized(data_set[[7]][[predictor_order-2]][[2]],data_set[[7]][[predictor_order-2]][[6]]) 
                names(test_data7) <- c("FirstDay","SecondDay","ThirdDay","Next Day")
                head(test_data7,10)
                
                
        })
})
