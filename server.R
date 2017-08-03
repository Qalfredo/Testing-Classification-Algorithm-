#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$plot1 <- renderPlotly({
    
    
    data(iris)
    plot_ly(iris, x = ~Sepal.Length, y = ~Sepal.Width, color = ~Species, size = 2, sizes = c(2,50), alpha = 0.6)
    
  })
  
  output$plot2 <- renderPlotly({
    
    data(iris)
    plot_ly(iris, x = ~Petal.Length, y = ~Petal.Width, color = ~Species, size = 2, sizes = c(2,50), alpha= 0.6)
  })
  
  output$efectividad <-renderTable({
    
    
   
    library(class)
    
    data("iris")
    
    
    
    set.seed(123)
    tr <- sample(1:150, nrow(iris)*input$nn/100)
    
    training_set <- iris[tr, ]
    testing_set <- iris[-tr, ]
    
    
    
    knn_model <- knn(training_set[, -5], testing_set[, -5], iris$Species[tr], k = input$neigh)
    cm <- table(knn_model, iris$Species[-tr])
    tab <- data.frame(cm[1, ], cm[2, ], cm[3, ])
    colnames(tab) <- c("setosa", "versicolor", "virginica")
    rownames(tab) <- c("setosa", "versicolor", "virginica")
    
    tab
    
  }, rownames = T)
  
  output$plot3 <- renderPlotly({
    
    library(plotly)
    library(class)
    
    data("iris")
    set.seed(123)
    tr <- sample(1:nrow(iris), nrow(iris)*input$nn/100)
    
    training_set <- iris[tr, ]
    testing_set <- iris[-tr, ]
    
    knn_model <- knn(training_set[, -5], testing_set[, -5], iris$Species[tr], k = input$neigh)
    v <- c()
    vv <- 1:150
    j <-iris$Species[-tr]
    for (i in 1:(nrow(testing_set)) ){
      if (knn_model[i] == j[i]) {
        v <- c(v, "Well Clasified")
      }else{ v <- c(v,"Bad Classified")}
    }
    p <- plot_ly(testing_set, x = testing_set$Sepal.Length, y = testing_set$Sepal.Width, color = ~Species, size = 2, sizes = c(2,50), text = v, alpha = 0.6)
    p
  })
  
})
