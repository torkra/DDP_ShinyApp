library(shiny)
library(UsingR)

data(mtcars)

shinyServer(
      function(input, output) {
            
            # Plot with the selected intervalls from the UI
            output$newPlot <- renderPlot({
                  plot(mtcars[mtcars$qsec > input$zoom[1] & mtcars$qsec < input$zoom[2] ,7], 
                       mtcars[mtcars$qsec > input$zoom[1] & mtcars$qsec < input$zoom[2] ,1] , 
                       xlab='qsec', ylab="mpg", 
                       col='blue',main='Plot of selected intervall', xlim=c(input$zoom[1],input$zoom[2]), ylim=c(10,30))

                  # Selects Linear regression intervall based in radio button and selcted intervall
                  #  and prints the regression line on the graph
                  if (input$Regr == 1) { abline(lm(mtcars$mpg ~ mtcars$qsec)) } 
                  else {abline(lm(mtcars[mtcars$qsec > input$zoom[1] & mtcars$qsec < input$zoom[2] ,1]  ~ 
                                  mtcars[mtcars$qsec > input$zoom[1] & mtcars$qsec < input$zoom[2] ,7]))}
            })
      }
)


