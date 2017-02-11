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
        
        test_hetero_sgd <- reactive({
                
                predictor_order <- 3
                
                value1 <- as.numeric(input$sgd_hetero_dayOne)
                value2 <- as.numeric(input$sgd_hetero_dayTwo)
                value3 <- as.numeric(input$sgd_hetero_dayThree)
                
                test <- cbind(value1,value2,value3)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                
                model_results <- neuralnet::compute(hetro_sgd_model1_60, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                
                model_results2 <- neuralnet::compute(hetro_sgd_model2_60, normalized_test)
                predicted_oneDayhead2 <- model_results2$net.result
                
                model_results3 <- neuralnet::compute(hetro_sgd_model3_60, normalized_test)
                predicted_oneDayhead3 <- model_results3$net.result
                
                all_predicted <- cbind(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                result <- denormalized(all_predicted,test)
                
                max(result) 
        }) # End SGD HETERO
        
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
        
        test_hetero_usd <- reactive({
                predictor_order <- 3
                
                
                value1 <- as.numeric(input$usd_hetero_dayOne)
                value2 <- as.numeric(input$usd_hetero_dayTwo)
                value3 <- as.numeric(input$usd_hetero_dayThree)
                
                test <- cbind(value1,value2,value3)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                
                model_results <- neuralnet::compute(hetro_usd_model1_60, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                
                model_results2 <- neuralnet::compute(hetro_usd_model2_60, normalized_test)
                predicted_oneDayhead2 <- model_results2$net.result
                
                model_results3 <- neuralnet::compute(hetro_usd_model3_60, normalized_test)
                predicted_oneDayhead3 <- model_results3$net.result
                
                all_predicted <- cbind(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                result <- denormalized(all_predicted,test)
                
                max(result)
        }) # End of USD HETERO
        
        test_homo_gbp <- reactive({
                
                predictor_order <- 3
                value1 <- as.numeric(input$gbp_homo_dayOne)
                value2 <- as.numeric(input$gbp_homo_dayTwo)
                value3 <- as.numeric(input$gbp_homo_dayThree)
                
                test <- cbind(value1,value2,value3)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                
                model_results <- neuralnet::compute(homo_gbp_model1_60, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                
                model_results2 <- neuralnet::compute(homo_gbp_model2_60, normalized_test)
                predicted_oneDayhead2 <- model_results2$net.result
                
                model_results3 <- neuralnet::compute(homo_gbp_model3_60, normalized_test)
                predicted_oneDayhead3 <- model_results3$net.result
                
                all_predicted <- cbind(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                result <- denormalized(all_predicted,test)
                min(result) 
        }) # End of GBP HOMO
        
        test_hetero_gbp <- reactive({
                
                predictor_order <- 4
                value1 <- as.numeric(input$gbp_hetero_dayOne)
                value2 <- as.numeric(input$gbp_hetero_dayTwo)
                value3 <- as.numeric(input$gbp_hetero_dayThree)
                value4 <- as.numeric(input$gbp_hetero_dayFour)
                
                test <- cbind(value1,value2,value3,value4)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                
                model_results <- neuralnet::compute(hetro_gbp_model1_60, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                
                model_results2 <- neuralnet::compute(hetro_gbp_model2_60, normalized_test)
                predicted_oneDayhead2 <- model_results2$net.result
                
                model_results3 <- neuralnet::compute(hetro_gbp_model3_60, normalized_test)
                predicted_oneDayhead3 <- model_results3$net.result
                
                all_predicted <- cbind(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                result <- denormalized(all_predicted,test)
                min(result) 
        }) # End of GBP HETERO
        
        test_homo_eur <- reactive({
                
                predictor_order <- 3
                value1 <- as.numeric(input$eur_homo_dayOne)
                value2 <- as.numeric(input$eur_homo_dayTwo)
                value3 <- as.numeric(input$eur_homo_dayThree)
                
                test <- cbind(value1,value2,value3)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                
                model_results <- neuralnet::compute(homo_eur_model1_60, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                
                model_results2 <- neuralnet::compute(homo_eur_model2_60, normalized_test)
                predicted_oneDayhead2 <- model_results2$net.result
                
                model_results3 <- neuralnet::compute(homo_eur_model3_60, normalized_test)
                predicted_oneDayhead3 <- model_results3$net.result
                
                all_predicted <- cbind(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                result <- denormalized(all_predicted,test)
                min(result) 
        }) # End of EURO HOMO
        
        test_hetero_eur <- reactive({
                
                predictor_order <- 3
                value1 <- as.numeric(input$eur_hetero_dayOne)
                value2 <- as.numeric(input$eur_hetero_dayTwo)
                value3 <- as.numeric(input$eur_hetero_dayThree)
                
                test <- cbind(value1,value2,value3)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                
                model_results <- neuralnet::compute(hetro_eur_model1_60, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                
                model_results2 <- neuralnet::compute(hetro_eur_model2_60, normalized_test)
                predicted_oneDayhead2 <- model_results2$net.result
                
                model_results3 <- neuralnet::compute(hetro_eur_model3_60, normalized_test)
                predicted_oneDayhead3 <- model_results3$net.result
                
                all_predicted <- cbind(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                result <- denormalized(all_predicted,test)
                max(result) 
        }) # End of EURO HETERO
        
        test_homo_chf <- reactive({
                predictor_order <- 9
                
                
                value1 <- as.numeric(input$chf_homo_dayOne)
                value2 <- as.numeric(input$chf_homo_dayTwo)
                value3 <- as.numeric(input$chf_homo_dayThree)
                value4 <- as.numeric(input$chf_homo_dayFour)
                value5 <- as.numeric(input$chf_homo_dayFive)
                value6 <- as.numeric(input$chf_homo_daySix)
                value7 <- as.numeric(input$chf_homo_daySeven)
                value8 <- as.numeric(input$chf_homo_dayEight)
                value9 <- as.numeric(input$chf_homo_dayNine)
                
                test <- cbind(value1,value2,value3,value4,value5,value6,value7,value8,value9)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                
                model_results <- neuralnet::compute(homo_chf_model1_60, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                
                model_results2 <- neuralnet::compute(homo_chf_model2_60, normalized_test)
                predicted_oneDayhead2 <- model_results2$net.result
                
                model_results3 <- neuralnet::compute(homo_chf_model3_60, normalized_test)
                predicted_oneDayhead3 <- model_results3$net.result
                
                all_predicted <- cbind(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                result <- denormalized(all_predicted,test)
                
                mean(result)
        }) # End of CHF HOMO
        
        test_hetero_chf <- reactive({
                predictor_order <- 8
                
                value1 <- as.numeric(input$chf_hetero_dayOne)
                value2 <- as.numeric(input$chf_hetero_dayTwo)
                value3 <- as.numeric(input$chf_hetero_dayThree)
                value4 <- as.numeric(input$chf_hetero_dayFour)
                value5 <- as.numeric(input$chf_hetero_dayFive)
                value6 <- as.numeric(input$chf_hetero_daySix)
                value7 <- as.numeric(input$chf_hetero_daySeven)
                value8 <- as.numeric(input$chf_hetero_dayEight)
                
                test <- cbind(value1,value2,value3,value4,value5,value6,value7,value8)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                
                model_results <- neuralnet::compute(hetro_chf_model1_60, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                
                model_results2 <- neuralnet::compute(hetro_chf_model2_60, normalized_test)
                predicted_oneDayhead2 <- model_results2$net.result
                
                model_results3 <- neuralnet::compute(hetro_chf_model3_60, normalized_test)
                predicted_oneDayhead3 <- model_results3$net.result
                
                all_predicted <- cbind(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                result <- denormalized(all_predicted,test)
                
                max(result)
        }) # End of CHF HETERO
        
        test_homo_aud <- reactive({
                predictor_order <- 9
                
                
                value1 <- as.numeric(input$aud_homo_dayOne)
                value2 <- as.numeric(input$aud_homo_dayTwo)
                value3 <- as.numeric(input$aud_homo_dayThree)
                value4 <- as.numeric(input$aud_homo_dayFour)
                value5 <- as.numeric(input$aud_homo_dayFive)
                value6 <- as.numeric(input$aud_homo_daySix)
                value7 <- as.numeric(input$aud_homo_daySeven)
                value8 <- as.numeric(input$aud_homo_dayEight)
                value9 <- as.numeric(input$aud_homo_dayNine)
                
                test <- cbind(value1,value2,value3,value4,value5,value6,value7,value8,value9)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                
                model_results <- neuralnet::compute(homo_aud_model1_60, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                
                model_results2 <- neuralnet::compute(homo_aud_model2_60, normalized_test)
                predicted_oneDayhead2 <- model_results2$net.result
                
                model_results3 <- neuralnet::compute(homo_aud_model3_60, normalized_test)
                predicted_oneDayhead3 <- model_results3$net.result
                
                all_predicted <- cbind(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                result <- denormalized(all_predicted,test)
                
                mean(result)
        }) # End of AUD HOMO
        
        test_hetero_aud <- reactive({
                predictor_order <- 3
                
                
                value1 <- as.numeric(input$aud_hetero_dayOne)
                value2 <- as.numeric(input$aud_hetero_dayTwo)
                value3 <- as.numeric(input$aud_hetero_dayThree)
                
                test <- cbind(value1,value2,value3)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                
                model_results <- neuralnet::compute(hetro_aud_model1_60, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                
                model_results2 <- neuralnet::compute(hetro_aud_model2_60, normalized_test)
                predicted_oneDayhead2 <- model_results2$net.result
                
                model_results3 <- neuralnet::compute(hetro_aud_model3_60, normalized_test)
                predicted_oneDayhead3 <- model_results3$net.result
                
                all_predicted <- cbind(predicted_oneDayhead,predicted_oneDayhead2,predicted_oneDayhead3)
                result <- denormalized(all_predicted,test)
                
                max(result)
        }) # End of AUD HETERO
        
        result <- observe({
                # USD HOMO
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
                
                # USD HETERO
                if(input$currency=="USD" && input$model=="HETRO"){
                        
                        output$result1 <- renderText({
                                test_hetero_usd()
                        })
                        
                }
                
                updateTextInput(session, "usd_hetero_dayOne", value = "")
                updateTextInput(session, "usd_hetero_dayTwo", value = "")
                updateTextInput(session, "usd_hetero_dayThree", value = "")
                
                # SGD HOMO
                if(input$currency=="SGD" && input$model=="HOMO"){
                        output$result1 <- renderText({
                                test_homo_sgd()
                        }) 
                       
                }
                
                updateTextInput(session, "sgd_homo_dayOne", value = "")
                updateTextInput(session, "sgd_homo_dayTwo", value = "")
                updateTextInput(session, "sgd_homo_dayThree", value = "")
                
                # SGD HOMO
                if(input$currency=="SGD" && input$model=="HETRO"){
                        output$result1 <- renderText({
                                test_hetero_sgd()
                        }) 
                        
                }
                
                updateTextInput(session, "sgd_hetero_dayOne", value = "")
                updateTextInput(session, "sgd_hetero_dayTwo", value = "")
                updateTextInput(session, "sgd_hetero_dayThree", value = "")
                
                # GBP HOMO
                if(input$currency=="GBP" && input$model=="HOMO"){
                        output$result1 <- renderText({
                                test_homo_gbp()
                        }) 
                        
                }
                
                updateTextInput(session, "gbp_homo_dayOne", value = "")
                updateTextInput(session, "gbp_homo_dayTwo", value = "")
                updateTextInput(session, "gbp_homo_dayThree", value = "")
                
                # GBP HETERO
                if(input$currency=="GBP" && input$model=="HETRO"){
                        output$result1 <- renderText({
                                test_hetero_gbp()
                        }) 
                        
                }
                
                updateTextInput(session, "gbp_hetero_dayOne", value = "")
                updateTextInput(session, "gbp_hetero_dayTwo", value = "")
                updateTextInput(session, "gbp_hetero_dayThree", value = "")
                updateTextInput(session, "gbp_hetero_dayFour", value = "")
                
                # EURO HOMO
                if(input$currency=="EURO" && input$model=="HOMO"){
                        output$result1 <- renderText({
                                test_homo_eur()
                        }) 
                        
                }
                
                updateTextInput(session, "eur_homo_dayOne", value = "")
                updateTextInput(session, "eur_homo_dayTwo", value = "")
                updateTextInput(session, "eur_homo_dayThree", value = "")
                
                # EURO HETERO
                if(input$currency=="EURO" && input$model=="HETRO"){
                        output$result1 <- renderText({
                                test_hetero_eur()
                        }) 
                        
                }
                
                updateTextInput(session, "eur_hetero_dayOne", value = "")
                updateTextInput(session, "eur_hetero_dayTwo", value = "")
                updateTextInput(session, "eur_hetero_dayThree", value = "")
                
                # CHF HOMO
                if(input$currency=="CHF" && input$model=="HOMO"){
                        
                        output$result1 <- renderText({
                                test_homo_chf()
                        })
                        
                }
                
                updateTextInput(session, "chf_homo_dayOne", value = "")
                updateTextInput(session, "chf_homo_dayTwo", value = "")
                updateTextInput(session, "chf_homo_dayThree", value = "")
                updateTextInput(session, "chf_homo_dayFour", value = "")
                updateTextInput(session, "chf_homo_dayFive", value = "")
                updateTextInput(session, "chf_homo_daySix", value = "")
                updateTextInput(session, "chf_homo_daySeven", value = "")
                updateTextInput(session, "chf_homo_dayEight", value = "")
                updateTextInput(session, "chf_homo_dayNine", value = "")
                
                # CHF HETERO
                if(input$currency=="CHF" && input$model=="HETRO"){
                        
                        output$result1 <- renderText({
                                test_hetero_chf()
                        })
                        
                }
                
                updateTextInput(session, "chf_hetero_dayOne", value = "")
                updateTextInput(session, "chf_hetero_dayTwo", value = "")
                updateTextInput(session, "chf_hetero_dayThree", value = "")
                updateTextInput(session, "chf_hetero_dayFour", value = "")
                updateTextInput(session, "chf_hetero_dayFive", value = "")
                updateTextInput(session, "chf_hetero_daySix", value = "")
                updateTextInput(session, "chf_hetero_daySeven", value = "")
                updateTextInput(session, "chf_hetero_dayEight", value = "")
                
                # AUD HOMO
                if(input$currency=="AUD" && input$model=="HOMO"){
                        
                        output$result1 <- renderText({
                                test_homo_aud()
                        })
                        
                }
                
                updateTextInput(session, "aud_homo_dayOne", value = "")
                updateTextInput(session, "aud_homo_dayTwo", value = "")
                updateTextInput(session, "aud_homo_dayThree", value = "")
                updateTextInput(session, "aud_homo_dayFour", value = "")
                updateTextInput(session, "aud_homo_dayFive", value = "")
                updateTextInput(session, "aud_homo_daySix", value = "")
                updateTextInput(session, "aud_homo_daySeven", value = "")
                updateTextInput(session, "aud_homo_dayEight", value = "")
                updateTextInput(session, "aud_homo_dayNine", value = "")
                
                
                # AUD HETERO
                if(input$currency=="AUD" && input$model=="HETRO"){
                        
                        output$result1 <- renderText({
                                test_hetero_aud()
                        })
                        
                }
                
                updateTextInput(session, "aud_hetero_dayOne", value = "")
                updateTextInput(session, "aud_hetero_dayTwo", value = "")
                updateTextInput(session, "aud_hetero_dayThree", value = "")
                
                
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
