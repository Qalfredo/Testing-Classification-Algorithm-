#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(navbarPage(theme = shinytheme("spacelab"),"",
                   tabPanel("Home",
                            
                            # Application title
                            titlePanel(strong("Testing K Nearest Neighbors Algorithm on Iris Data", style = "font-size:50px")),
                            
                            # Sidebar with a slider input for number of bins
                            sidebarLayout(
                              sidebarPanel(
                                h2("Coursera App", align = "center"),p("This is a simple Shiny app developed by Alfredo Quintana as the Final Project in the Developing Data Products, August 2017")
                                
                              ),
                              
                              
                              mainPanel(
                                strong(h1("General Documentation")), p("- About the Algorithm : k-nearest neighbour classification for test set from training set. For each row of the test set, the k nearest (in Euclidean distance) training set vectors are found, and the classification is decided by majority vote, with ties broken at random. If there are ties for the kth nearest vector, all candidates are included in the vote.", style = "font-size:28px"), 
                                  p("-  Basically we are passing the data to a model that learns patterns and then predict the label of a value", style = "font-size:28px")
                                
                                )
                              )
                            
                              ),
                   tabPanel("Data",
                            titlePanel(strong("Testing K Nearest Neighbors Algorithm on Iris Data", style = "font-size:50px")),
                            sidebarLayout(
                              sidebarPanel(
                                h2("About the Data"), p("This famous (Fisher's or Anderson's) iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica."),
                                p("iris is a data frame with 150 cases (rows) and 5 variables (columns) named Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, and Species.")
                                
                              ),
                              mainPanel(
                                
                                fluidRow(column(12,plotlyOutput("plot1"),plotlyOutput("plot2"))
                              ))
                            )
                            
                   ),
                   tabPanel("Classification Tool",
                            titlePanel(strong("Testing K Nearest Neighbors Algorithm on Iris Data", style = "font-size:50px")),
                            sidebarLayout(
                              sidebarPanel(
                              
                                sliderInput("nn",
                                            "Size of the Training Set",
                                            min = 50,
                                            max = 80,
                                            value = 70),
                                selectInput("neigh",
                                            label = "Select an apropiate k", choices = list("one neighbour"=1,"three neighbors"=3, "five neighbors"=5)
                                            
                                ),
                                p("- Second, we want you to split the whole dataset in two parts: training and testing. For exampe, a choice of 70 means you are spliting in a 70% and 30 % subsets."), p("- First we want you to choose an apropiate k, it has to do with the amount of near neighbours we are considering in our model"), p(" We show the model preformance, the table represents the confussion matrix of our model, and the plot is a graphic representation of the testing set. Also if you drag the pointer over a point you can see if it has been classified well or not. ")
                                
                                
                                
                              ),
                              mainPanel(
                                fluidRow(
                                  h2("Model Performance", align = "center"), div(tableOutput("efectividad"), align = "center"), div(plotlyOutput("plot3"), align = "center")
                                )
                                
                                
                              )
                            )
                            
                   )
                              ))