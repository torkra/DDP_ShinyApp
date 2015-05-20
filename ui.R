library(shiny)

shinyUI(fluidPage(
      titlePanel("Select intervalls of parents hight from the Galton data set"),
      fluidRow(
            # Selection area 
            column(2,
                   # radio buttons selecting the regression method
                   radioButtons("Regr", "Select typ of regression line",
                                c("Regression on full data set" = "1", 
                                  "Regression on selected intervall" = "2"), 
                                selected = "1"),
                   
                   # Sidebar with a slider input
                   sliderInput("zoom", "Zoom Parents hights", 60, 75, value = c(64, 73))
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
