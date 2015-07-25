library(shiny)
library(datasets)

# Factor cylinder and transmission fields
mpgData <- mtcars
mpgData$cyl <- factor(mpgData$cyl)
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

# Define server logic required to compute mpg based on 
# linear regression algorithm mpg ~ cyl + hp + wt + am
shinyServer(function(input, output) {
    
    # Computation of mpg using coefficient of variables
    # y-intercept : +33.7083
    # 6 cylinder  : -3.0313
    # 8 cylinder  : -2.1637
    # Horsepower  : -0.0321
    # Weight      : -2.4968
    # Transmission: +1.8092
    
    mpgValue <- reactive({
        
        if (input$cyl == "cyl6" & input$compute >= 1){
            mpg = 33.7083-3.0313-(0.0321*as.numeric(input$hp))-(2.4968*as.numeric(input$wt))+(1.8092*as.numeric(input$am))
            
        }
        else if (input$cyl == "cyl8" & input$compute >= 1){
            mpg = 33.7083-2.1637-(0.0321*as.numeric(input$hp))-(2.4968*as.numeric(input$wt))+(1.8092*as.numeric(input$am))

        }   
        
    })
    
    # Return the computed value of mpg as output
    output$mpgOutput <- renderText({
           input$compute
           isolate(mpgValue())
    })
        
})
