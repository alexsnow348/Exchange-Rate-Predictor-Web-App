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
shinyServer(function(input, output, session) {
        source("./libraries.R")
        source("./functions.R")
   
        test_homo_sgd <- reactive({
                
                predictor_order <- 3
                value1 <- as.numeric(input$sgd_homo_dayOne)
                value2 <- as.numeric(input$sgd_homo_dayTwo)
                value3 <- as.numeric(input$sgd_homo_dayThree)
                
                test <- cbind(value1,value2,value3)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                
                model_results <- neuralnet::compute(homo_sgd_model1_60, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                
                model_results2 <- neuralnet::compute(homo_sgd_model2_60, normalized_test)
                predicted_oneDayhead2 <- model_results2$net.result
                
                model_results3 <- neuralnet::compute(homo_sgd_model3_60, normalized_test)
                predicted_oneDayhead3 <- model_results3$net.result
                
                all_predicted <- cbind(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                result <- denormalized(all_predicted,test)
                max(result) 
        }) # End SGD HOMO
        
        
        test_homo_usd <- reactive({
                predictor_order <- 9
                
                
                value1 <- as.numeric(input$usd_homo_dayOne)
                value2 <- as.numeric(input$usd_homo_dayTwo)
                value3 <- as.numeric(input$usd_homo_dayThree)
                value4 <- as.numeric(input$usd_homo_dayFour)
                value5 <- as.numeric(input$usd_homo_dayFive)
                value6 <- as.numeric(input$usd_homo_daySix)
                value7 <- as.numeric(input$usd_homo_daySeven)
                value8 <- as.numeric(input$usd_homo_dayEight)
                value9 <- as.numeric(input$usd_homo_dayNine)
                
                test <- cbind(value1,value2,value3,value4,value5,value6,value7,value8,value9)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                
                model_results <- neuralnet::compute(homo_usd_model1_60, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                
                model_results2 <- neuralnet::compute(homo_usd_model2_60, normalized_test)
                predicted_oneDayhead2 <- model_results2$net.result
                
                model_results3 <- neuralnet::compute(homo_usd_model3_60, normalized_test)
                predicted_oneDayhead3 <- model_results3$net.result
                
                all_predicted <- cbind(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                result <- denormalized(all_predicted,test)
                
                max(result)
        }) # End of USD HOMO
        
        result <- observe({
                if(input$currency=="USD" && input$model=="HOMO"){
                       
                        output$result1 <- renderText({
                                test_homo_usd()
                        })
                       
                }
                
                updateTextInput(session, "usd_homo_dayOne", value = "")
                updateTextInput(session, "usd_homo_dayTwo", value = "")
                updateTextInput(session, "usd_homo_dayThree", value = "")
                updateTextInput(session, "usd_homo_dayFour", value = "")
                updateTextInput(session, "usd_homo_dayFive", value = "")
                updateTextInput(session, "usd_homo_daySix", value = "")
                updateTextInput(session, "usd_homo_daySeven", value = "")
                updateTextInput(session, "usd_homo_dayEight", value = "")
                updateTextInput(session, "usd_homo_dayNine", value = "")
                
                
                if(input$currency=="SGD" && input$model=="HOMO"){
                        output$result1 <- renderText({
                                test_homo_sgd()
                        }) 
                       
                }
                
                updateTextInput(session, "sgd_homo_dayOne", value = "")
                updateTextInput(session, "sgd_homo_dayTwo", value = "")
                updateTextInput(session, "sgd_homo_dayThree", value = "")
                
        }) # End of Observe
        
        test_data <- observe({
                
        if(input$model == "HOMO"){
                output$test_data1 <- renderDataTable({
                        predictor_order <- 9
                        test_data1 <- denormalized(data_set_60[[1]][[predictor_order -2]][[3]],data_set_60[[1]][[predictor_order -2]][[6]]) 
                        names(test_data1) <- c("1st Day","2nd Day","3rd Day","4th Day","5th Day","6th Day","7th Day","8th Day","9th Day","Next Day")
                        tail(test_data1,10)
                        
                        
                })
                output$test_data2 <- renderDataTable({
                        predictor_order <- 3
                        test_data2 <- denormalized(data_set_60[[2]][[predictor_order-2]][[2]],data_set_60[[2]][[predictor_order-2]][[6]]) 
                        names(test_data2) <- c("1st Day","2nd Day","3rd Day","Next Day")
                        head(test_data2,10)
                        
                        
                })
                output$test_data3 <- renderDataTable({
                        predictor_order <- 3
                        test_data3 <- denormalized(data_set_60[[3]][[predictor_order-2]][[2]],data_set_60[[3]][[predictor_order-2]][[6]]) 
                        names(test_data3) <- c("1st Day","2nd Day","3rd Day","Next Day")
                        head(test_data3,10)
                        
                        
                })
                output$test_data4 <- renderDataTable({
                        predictor_order <- 9
                        test_data4 <- denormalized(data_set_60[[4]][[predictor_order-2]][[2]],data_set_60[[4]][[predictor_order-2]][[6]]) 
                        names(test_data4) <-  c("1st Day","2nd Day","3rd Day","4th Day","5th Day","6th Day","7th Day","8th Day","9th Day","Next Day")
                        head(test_data4,10)
                        
                        
                })
                output$test_data5 <- renderDataTable({
                        predictor_order <- 9
                        test_data5 <- denormalized(data_set_60[[5]][[predictor_order-2]][[2]],data_set_60[[5]][[predictor_order-2]][[6]]) 
                        names(test_data5) <-  c("1st Day","2nd Day","3rd Day","4th Day","5th Day","6th Day","7th Day","8th Day","9th Day","Next Day")
                        head(test_data5,10)
                        
                        
                })
                
                output$test_data7 <- renderDataTable({
                        predictor_order <- 3
                        test_data7 <- denormalized(data_set_60[[7]][[predictor_order-2]][[2]],data_set_60[[7]][[predictor_order-2]][[6]]) 
                        names(test_data7) <- c("1st Day","2nd Day","3rd Day","Next Day")
                        head(test_data7,10)
                        
                        
                })
                
        } # HOMO DATASEt
                if(input$model == "HETRO"){
                        output$test_data1 <- renderDataTable({
                                predictor_order <- 3
                                test_data1 <- denormalized(data_set_60[[1]][[predictor_order -2]][[3]],data_set_60[[1]][[predictor_order -2]][[6]]) 
                                names(test_data1) <- c("1st Day","2nd Day","3rd Day","Next Day")
                                tail(test_data1,10)
                                
                                
                        })
                        output$test_data2 <- renderDataTable({
                                predictor_order <- 4
                                test_data2 <- denormalized(data_set_60[[2]][[predictor_order-2]][[2]],data_set_60[[2]][[predictor_order-2]][[6]]) 
                                names(test_data2) <- c("1st Day","2nd Day","3rd Day","4th Day","Next Day")
                                head(test_data2,10)
                                
                                
                        })
                        output$test_data3 <- renderDataTable({
                                predictor_order <- 3
                                test_data3 <- denormalized(data_set_60[[3]][[predictor_order-2]][[2]],data_set_60[[3]][[predictor_order-2]][[6]]) 
                                names(test_data3) <- c("1st Day","2nd Day","3rd Day","Next Day")
                                head(test_data3,10)
                                
                                
                        })
                        output$test_data4 <- renderDataTable({
                                predictor_order <- 8
                                test_data4 <- denormalized(data_set_60[[4]][[predictor_order-2]][[2]],data_set_60[[4]][[predictor_order-2]][[6]]) 
                                names(test_data4) <-  c("1st Day","2nd Day","3rd Day","4th Day","5th Day","6th Day","7th Day","8th Day","Next Day")
                                head(test_data4,10)
                                
                                
                        })
                        output$test_data5 <- renderDataTable({
                                predictor_order <- 3
                                test_data5 <- denormalized(data_set_60[[5]][[predictor_order-2]][[2]],data_set_60[[5]][[predictor_order-2]][[6]]) 
                                names(test_data5) <-  c("1st Day","2nd Day","3rd Day","Next Day")
                                head(test_data5,10)
                                
                                
                        })
                        
                        output$test_data7 <- renderDataTable({
                                predictor_order <- 3
                                test_data7 <- denormalized(data_set_60[[7]][[predictor_order-2]][[2]],data_set_60[[7]][[predictor_order-2]][[6]]) 
                                names(test_data7) <- c("1st Day","2nd Day","3rd Day","Next Day")
                                head(test_data7,10)
                                
                                
                        })
                        
                } # HETERO DATASEt
}) # End of Test Data 
        
        session$onSessionEnded(function() {
                test_data$suspend()
                result$suspend()

        }) # End of Session
      
}) # End of server
