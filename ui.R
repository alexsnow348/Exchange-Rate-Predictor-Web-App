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
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Plot Random Numbers"),
        
        # Sidebar with a slider input for number of bins 
        sidebarLayout(
                sidebarPanel(
                        textInput("firstDay", "First Day", value = "", width = NULL, placeholder = "Enter First Day Value"),
                        textInput("secondDay", "Second Day", value = "", width = NULL, placeholder = "Enter First Day Value"),
                        textInput("thirdDay", "Third Day", value = "", width = NULL, placeholder = "Enter First Day Value")
                        
                        
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                        h3("Error"),
                        #textOutput("error", container = if (inline) span else div, inline = FALSE),
                        h3("Acutal"),
                       # textOutput("actual", container = if (inline) span else div, inline = FALSE),
                        h3("Predicted Value")
                       # textOutput("predicted", container = if (inline) span else div, inline = FALSE)
                        
                )
        )
))
