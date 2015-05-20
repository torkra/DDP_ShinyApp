library(shiny)
library(UsingR)

data(galton)

shinyServer(
      function(input, output) {
            
            # Plot with the selected intervalls from the UI
            output$newPlot <- renderPlot({
                  plot(galton[galton$parent > input$zoom[1] & galton$parent < input$zoom[2] ,2], 
                       galton[galton$parent > input$zoom[1] & galton$parent < input$zoom[2] ,1], 
                       xlab='Parents height', ylab="Childerens hights", 
                       col='blue',main='Plot of selected intervall', xlim=c(input$zoom[1],input$zoom[2]), ylim=c(60,75))

                  # Selects Linear regression intervall based in radio button and selcted intervall
                  #  and prints the regression line on the graph
                  if (input$Regr == 1) { abline(lm(galton$child ~ galton$parent)) } 
                  else {abline(lm(galton[galton$parent > input$zoom[1] & galton$parent < input$zoom[2] ,1] ~ 
                                        galton[galton$parent > input$zoom[1] & galton$parent < input$zoom[2] ,2]))}
            })
      }
)


