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
        
        test_mlp_sgd <- reactive({
                predictor_order <- 3
                
                value1 <- as.numeric(input$sgd_homo_dayOne)
                value2 <- as.numeric(input$sgd_homo_dayTwo)
                value3 <- as.numeric(input$sgd_homo_dayThree)
                
                test <- cbind(value1,value2,value3)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                model_results <- neuralnet::compute(mlp_sgd, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                result <- denormalized(predicted_oneDayhead,test)
                return(result)
        }) # End SGD MLP
        
        test_rnn_sgd <- reactive({
                predictor_order <- 3
                
                value1 <- as.numeric(input$sgd_homo_dayOne)
                value2 <- as.numeric(input$sgd_homo_dayTwo)
                value3 <- as.numeric(input$sgd_homo_dayThree)
                
                test <- cbind(value1,value2,value3)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                test_input_array_1 <- list()
                for (i in 1:predictor_order){
                        input_day <- as.matrix(normalized_test[,i]) 
                        test_input_array_1 <- c(test_input_array_1,input_day)
                }
                
                test_input_array_1 <- as.numeric(test_input_array_1)
                test_input_try <- array(test_input_array_1, dim=c(dim(input_day),predictor_order))
                
                test_result <- predictr(rnn_sgd, test_input_try )
                predict_value <- denormalized(test_result,test)
                result <- denormalized(predict_value,test)
                return(result)
        }) # End SGD RNN
        
        test_rbf_sgd <- reactive({
                predictor_order <- 3
                
                value1 <- as.numeric(input$sgd_homo_dayOne)
                value2 <- as.numeric(input$sgd_homo_dayTwo)
                value3 <- as.numeric(input$sgd_homo_dayThree)
                
                test <- cbind(value1,value2,value3)
                if(is.na(test[,1])){ return("NA")}
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                result <- predict(rbf_sgd,normalized_test)
                result <- denormalized(result,test)
                return(result)
        }) # End SGD RBF
        
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
        
        test_mlp_usd <- reactive({
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
                
                model_results <- neuralnet::compute(mlp_usd, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                
                result <- denormalized(predicted_oneDayhead,test)
                return(result)
                
                
        }) # End of USD MLP
        
        test_rnn_usd <- reactive({
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
                
                test_input_array_1 <- list()
                for (i in 1:predictor_order){
                        input_day <- as.matrix(normalized_test[,i]) 
                        test_input_array_1 <- c(test_input_array_1,input_day)
                }
                
                test_input_array_1 <- as.numeric(test_input_array_1)
                test_input_try <- array(test_input_array_1, dim=c(dim(input_day),predictor_order))
                
                test_result <- predictr(rnn_usd, test_input_try )
                predict_value <- denormalized(test_result,test)
                result <- denormalized(predict_value,test)
                
                return(result)
        }) # End USD RNN
        
        test_rbf_usd <- reactive({
                
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
                if(is.na(test[,1])){ return("NA")}
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                result <- predict(rbf_usd,normalized_test)
                result <- denormalized(result,test)
                return(result)
        }) # End USD RBF
        
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
        
        test_mlp_gbp <- reactive({
                
                predictor_order <- 3
                value1 <- as.numeric(input$gbp_homo_dayOne)
                value2 <- as.numeric(input$gbp_homo_dayTwo)
                value3 <- as.numeric(input$gbp_homo_dayThree)
                
                test <- cbind(value1,value2,value3)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                
                model_results <- neuralnet::compute(mlp_gbp, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                result <- denormalized(predicted_oneDayhead,test)
        }) # End of GBP MLP
        
        test_rnn_gbp <- reactive({
                predictor_order <- 3
                value1 <- as.numeric(input$gbp_homo_dayOne)
                value2 <- as.numeric(input$gbp_homo_dayTwo)
                value3 <- as.numeric(input$gbp_homo_dayThree)
                
                test <- cbind(value1,value2,value3)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                test_input_array_1 <- list()
                for (i in 1:predictor_order){
                        input_day <- as.matrix(normalized_test[,i]) 
                        test_input_array_1 <- c(test_input_array_1,input_day)
                }
                
                test_input_array_1 <- as.numeric(test_input_array_1)
                test_input_try <- array(test_input_array_1, dim=c(dim(input_day),predictor_order))
                
                test_result <- predictr(rnn_gbp, test_input_try )
                predict_value <- denormalized(test_result,test)
                result <- denormalized(predict_value,test)
                
                return(result)
        }) # End GBP RNN
        
        test_rbf_gbp <- reactive({
                
                predictor_order <- 3
                value1 <- as.numeric(input$gbp_homo_dayOne)
                value2 <- as.numeric(input$gbp_homo_dayTwo)
                value3 <- as.numeric(input$gbp_homo_dayThree)
                
                test <- cbind(value1,value2,value3)
                if(is.na(test[,1])){ return("NA")}
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                result <- predict(rbf_gbp,normalized_test)
                result <- denormalized(result,test)
                return(result)
        }) # End GBP RBF
        
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
        
        test_mlp_eur <- reactive({
                
                predictor_order <- 3
                value1 <- as.numeric(input$eur_homo_dayOne)
                value2 <- as.numeric(input$eur_homo_dayTwo)
                value3 <- as.numeric(input$eur_homo_dayThree)
                
                test <- cbind(value1,value2,value3)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                
                model_results <- neuralnet::compute(mlp_eur, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                result <- denormalized(predicted_oneDayhead,test)
                return(result) 
        }) # End od EURO MLP
        
        test_rnn_eur <- reactive({
                predictor_order <- 3
                value1 <- as.numeric(input$eur_homo_dayOne)
                value2 <- as.numeric(input$eur_homo_dayTwo)
                value3 <- as.numeric(input$eur_homo_dayThree)
                
                test <- cbind(value1,value2,value3)
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                
                test_input_array_1 <- list()
                for (i in 1:predictor_order){
                        input_day <- as.matrix(normalized_test[,i]) 
                        test_input_array_1 <- c(test_input_array_1,input_day)
                }
                
                test_input_array_1 <- as.numeric(test_input_array_1)
                test_input_try <- array(test_input_array_1, dim=c(dim(input_day),predictor_order))
                
                test_result <- predictr(rnn_eur, test_input_try )
                predict_value <- denormalized(test_result,test)
                result <- denormalized(predict_value,test)
                
                return(result)
        }) # End EURO RNN
        
        test_rbf_eur <- reactive({
                
                predictor_order <- 3
                value1 <- as.numeric(input$eur_homo_dayOne)
                value2 <- as.numeric(input$eur_homo_dayTwo)
                value3 <- as.numeric(input$eur_homo_dayThree)
                
                test <- cbind(value1,value2,value3)
                if(is.na(test[,1])){ return("NA")}
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                result <- predict(rbf_eur,normalized_test)
                result <- denormalized(result,test)
                return(result)
        }) # End EURO RBF
        
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
        
        test_mlp_chf <- reactive({
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
                model_results <- neuralnet::compute(mlp_chf, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                result <- denormalized(predicted_oneDayhead,test)
                
                return(result)
                
                
        }) # End of CHF MLP
        
        test_rnn_chf <- reactive({
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
                
                test_input_array_1 <- list()
                for (i in 1:predictor_order){
                        input_day <- as.matrix(normalized_test[,i]) 
                        test_input_array_1 <- c(test_input_array_1,input_day)
                }
                
                test_input_array_1 <- as.numeric(test_input_array_1)
                test_input_try <- array(test_input_array_1, dim=c(dim(input_day),predictor_order))
                
                test_result <- predictr(rnn_chf, test_input_try )
                predict_value <- denormalized(test_result,test)
                result <- denormalized(predict_value,test)
                
                return(result)
        }) # End CHF  RNN
        
        test_rbf_chf <- reactive({
                
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
                if(is.na(test[,1])){ return("NA")}
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                result <- predict(rbf_chf,normalized_test)
                result <- denormalized(result,test)
                return(result)
        }) # End CHF RBF
        
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
        
        test_mlp_aud <- reactive({
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
                model_results <- neuralnet::compute(mlp_aud, normalized_test)
                predicted_oneDayhead <- model_results$net.result
                result <- denormalized(predicted_oneDayhead,test)
                
                return(result)
                
                
        }) # End of AUD MLP
        
        test_rnn_aud <- reactive({
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
                
                test_input_array_1 <- list()
                for (i in 1:predictor_order){
                        input_day <- as.matrix(normalized_test[,i]) 
                        test_input_array_1 <- c(test_input_array_1,input_day)
                }
                
                test_input_array_1 <- as.numeric(test_input_array_1)
                test_input_try <- array(test_input_array_1, dim=c(dim(input_day),predictor_order))
                
                test_result <- predictr(rnn_aud, test_input_try )
                predict_value <- denormalized(test_result,test)
                result <- denormalized(predict_value,test)
                
                return(result)
        }) # End AUD  RNN
        
        test_rbf_aud <- reactive({
                
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
                if(is.na(test[,1])){ return("NA")}
                normalized_test <-  (test-min(test))/(max(test)-min(test))
                result <- predict(rbf_aud,normalized_test)
                result <- denormalized(result,test)
                return(result)
        }) # End CHF RBF
        
        result <- observe({
                # USD HOMO
                if(input$currency=="USD" && input$model=="HOMO"){
                       
                        output$result1 <- renderText({
                                test_homo_usd()
                        })
                       
                }
                # USD MLP
                if(input$currency=="USD" && input$model=="MLP"){
                        output$result1 <- renderText({
                                test_mlp_usd()
                        }) 
                        
                }
                #USD RNN
                if(input$currency=="USD" && input$model=="RNN"){
                        output$result1 <- renderText({
                                test_rnn_usd()
                        }) 
                        
                }
                #USD RBF
                if(input$currency=="USD" && input$model=="RBF"){
                        output$result1 <- renderText({
                                test_rbf_usd()
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
                # SGD MLP
                if(input$currency=="SGD" && input$model=="MLP"){
                        output$result1 <- renderText({
                                test_mlp_sgd()
                        }) 
                        
                }
                # SGD RNN
                if(input$currency=="SGD" && input$model=="RNN"){
                        output$result1 <- renderText({
                                test_rnn_sgd()
                        }) 
                        
                }
                # SGD RBF
                if(input$currency=="SGD" && input$model=="RBF"){
                        output$result1 <- renderText({
                                test_rbf_sgd()
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
                
                # GBP MLP
                if(input$currency=="GBP" && input$model=="MLP"){
                        output$result1 <- renderText({
                                test_mlp_gbp()
                        }) 
                        
                }
                
                # GBP MLP
                if(input$currency=="GBP" && input$model=="RNN"){
                        output$result1 <- renderText({
                                test_rnn_gbp()
                        }) 
                        
                }
                
                # GBP RBF
                if(input$currency=="GBP" && input$model=="RBF"){
                        output$result1 <- renderText({
                                test_rbf_gbp()
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
                
                # EURO MLP
                if(input$currency=="EURO" && input$model=="MLP"){
                        output$result1 <- renderText({
                                test_mlp_eur()
                        }) 
                        
                }
                
                # EURO RNN
                if(input$currency=="EURO" && input$model=="RNN"){
                        output$result1 <- renderText({
                                test_rnn_eur()
                        }) 
                        
                }
                
                # EURO RBF
                if(input$currency=="EURO" && input$model=="RBF"){
                        output$result1 <- renderText({
                                test_rbf_eur()
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
                # CHF MLP
                if(input$currency=="CHF" && input$model=="MLP"){
                        
                        output$result1 <- renderText({
                                test_mlp_chf()
                        })
                        
                }
                # CHF RNN
                if(input$currency=="CHF" && input$model=="RNN"){
                        
                        output$result1 <- renderText({
                                test_rnn_chf()
                        })
                        
                }
                
                # CHF RBF
                if(input$currency=="CHF" && input$model=="RBF"){
                        
                        output$result1 <- renderText({
                                test_rbf_chf()
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
                
                # AUD MLP
                if(input$currency=="AUD" && input$model=="MLP"){
                        
                        output$result1 <- renderText({
                                test_mlp_aud()
                        })
                        
                }
                
                # AUD RNN
                if(input$currency=="AUD" && input$model=="RNN"){
                        
                        output$result1 <- renderText({
                                test_rnn_aud()
                        })
                        
                }
                
                # AUD RBF
                if(input$currency=="AUD" && input$model=="RBF"){
                        
                        output$result1 <- renderText({
                                test_rbf_aud()
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
                
        if(input$model == "HOMO" || input$model == 'MLP'|| input$model == 'RNN'|| input$model == 'RBF' ){
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
                        tail(test_data2,10)
                        
                        
                })
                output$test_data3 <- renderDataTable({
                        predictor_order <- 3
                        test_data3 <- denormalized(data_set_60[[3]][[predictor_order-2]][[2]],data_set_60[[3]][[predictor_order-2]][[6]]) 
                        names(test_data3) <- c("1st Day","2nd Day","3rd Day","Next Day")
                        tail(test_data3,10)
                        
                        
                })
                output$test_data4 <- renderDataTable({
                        predictor_order <- 9
                        test_data4 <- denormalized(data_set_60[[4]][[predictor_order-2]][[2]],data_set_60[[4]][[predictor_order-2]][[6]]) 
                        names(test_data4) <-  c("1st Day","2nd Day","3rd Day","4th Day","5th Day","6th Day","7th Day","8th Day","9th Day","Next Day")
                        tail(test_data4,10)
                        
                        
                })
                output$test_data5 <- renderDataTable({
                        predictor_order <- 9
                        test_data5 <- denormalized(data_set_60[[5]][[predictor_order-2]][[2]],data_set_60[[5]][[predictor_order-2]][[6]]) 
                        names(test_data5) <-  c("1st Day","2nd Day","3rd Day","4th Day","5th Day","6th Day","7th Day","8th Day","9th Day","Next Day")
                        tail(test_data5,10)
                        
                        
                })
                
                output$test_data7 <- renderDataTable({
                        predictor_order <- 3
                        test_data7 <- denormalized(data_set_60[[7]][[predictor_order-2]][[2]],data_set_60[[7]][[predictor_order-2]][[6]]) 
                        names(test_data7) <- c("1st Day","2nd Day","3rd Day","Next Day")
                        tail(test_data7,10)
                        
                        
                })
                
        } # HOMO DATASET
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
                                tail(test_data2,10)
                                
                                
                        })
                        output$test_data3 <- renderDataTable({
                                predictor_order <- 3
                                test_data3 <- denormalized(data_set_60[[3]][[predictor_order-2]][[2]],data_set_60[[3]][[predictor_order-2]][[6]]) 
                                names(test_data3) <- c("1st Day","2nd Day","3rd Day","Next Day")
                                tail(test_data3,10)
                                
                                
                        })
                        output$test_data4 <- renderDataTable({
                                predictor_order <- 8
                                test_data4 <- denormalized(data_set_60[[4]][[predictor_order-2]][[2]],data_set_60[[4]][[predictor_order-2]][[6]]) 
                                names(test_data4) <-  c("1st Day","2nd Day","3rd Day","4th Day","5th Day","6th Day","7th Day","8th Day","Next Day")
                                tail(test_data4,10)
                                
                                
                        })
                        output$test_data5 <- renderDataTable({
                                predictor_order <- 3
                                test_data5 <- denormalized(data_set_60[[5]][[predictor_order-2]][[2]],data_set_60[[5]][[predictor_order-2]][[6]]) 
                                names(test_data5) <-  c("1st Day","2nd Day","3rd Day","Next Day")
                                tail(test_data5,10)
                                
                                
                        })
                        
                        output$test_data7 <- renderDataTable({
                                predictor_order <- 3
                                test_data7 <- denormalized(data_set_60[[7]][[predictor_order-2]][[2]],data_set_60[[7]][[predictor_order-2]][[6]]) 
                                names(test_data7) <- c("1st Day","2nd Day","3rd Day","Next Day")
                                tail(test_data7,10)
                                
                                
                        })
                        
                } # HETERO DATASET
                
}) # End of Test Data 
        
        session$onSessionEnded(function() {
                test_data$suspend()
                result$suspend()

        }) # End of Session
      
}) # End of server
