---
title       : "Testing Classification Algorithm"
subtitle    : 
author      : "Alfredo Quintana"
job         : 
framework   : io2012        
highlighter : highlight.js  
hitheme     : tomorrow      
widgets     : []            
mode        : selfcontained 
knit        : slidify::knit2slides
---

## Testing Classification Algorithm





## 

## In machine learning and statistics, classification is the problem of identifying to which of a set of categories (sub-populations) a new observation belongs, on the basis of a training set of data containing observations (or instances) whose category membership is known.

---

## 

## Tthe k-nearest neighbors algorithm (k-NN) is a non-parametric method used for classification and regression. In both cases, the input consists of the k closest training examples in the feature space. 

![a](http://bdewilde.github.io/assets/images/2012-10-26-knn-concept.png)

---

##

### Lets see a little implementation in R: 

```r
library(class)
data("iris")

set.seed(123)
tr <- sample(1:nrow(iris), nrow(iris)*70/100)

training_set <- iris[tr, ]
testing_set <- iris[-tr, ]

knn_model <- knn(training_set[, -5], testing_set[, -5], iris$Species[tr], k = 10)
table(knn_model, iris$Species[-tr])
```

```
##             
## knn_model    setosa versicolor virginica
##   setosa         12          0         0
##   versicolor      0         15         1
##   virginica       0          2        15
```

---

## If you are interested in this topics please visit our shiny app 

[Testing Classification Algorithm](https://quintana.shinyapps.io/testing_classification_algorithms/)
