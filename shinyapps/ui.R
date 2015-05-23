library(shiny)

shinyUI(fluidPage(
      titlePanel("Select intervalls of seconds for 1/4 miles from the mtcars data set"),
      fluidRow(
            # Selection area 
            column(2,
                   # radio buttons selecting the regression method
                   radioButtons("Regr", "Select typ of regression line",
                                c("Regression on full data set" = "1", 
                                  "Regression on selected intervall" = "2"), 
                                selected = "1"),
                   
                   # Sidebar with a slider input
                   sliderInput("zoom", "Zoom qsec", 12, 25, value = c(14, 23))
            ),
            # Plot area - plotting the selected interval of the dataset
            column(6,
                   plotOutput('newPlot')
            ),
            # Print out the instructions
            column(4,
                   br(), br(),
                   pre(includeText("help.txt"))
            )
)))
