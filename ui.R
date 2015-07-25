library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
    
    # Application title
    headerPanel("Prediction of MPG using Linear Regression Algorithm (MTCARS Dataset)"),
    
    # Sidebar with slider and radiobuttons for selection of 
    # independent variables to compute mpg
    sidebarPanel(
        radioButtons("cyl", "No. of Cylinders:",
                     c("6 Cylinders" = "cyl6",
                       "8 Cylinders" = "cyl8")),
        
        sliderInput("hp", 
                    "Gross Horsepower:", 
                    min = 100,
                    max = 400, 
                    value = 250),
        
        sliderInput("wt", 
                    "Weight(lb/1000):", 
                    min = 2,
                    max = 6, 
                    value = 4),
        
        radioButtons("am", "Transmission:",
                     c("Automatic" = "0",
                       "Manual" = "1")),
        
        actionButton("compute", "Compute MPG"),
        
        h5("Select input for the above variables. Once ready, click on the Compute MPG button. The result will be displayed on the right of the screen.")
        
    ),

    
    # Show the predicted mpg value
    mainPanel(
        h3("Prediction for Mile Per Gallen:"),
        
        h2(textOutput("mpgOutput"))
    )
    
))

