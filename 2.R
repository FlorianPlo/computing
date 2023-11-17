## 2.1
## a funciton that returns the euclidean norm of a vector: sqrt(sum(xi^2))

x <- runif(10)
euclid_n <- function(x){
  i <- length(x)
  res <- 0
  while(i >= 1){
    res <- res + (x[i]^2)
    i <- i - 1
  }
  sqrt(res)
}
euclid_n(x)

## to test this you can use the other formula for the euclidean norm: sqrt(sum(x^2))

rm(list=ls())


## 2.2

## for every function there is a variable i (for index) and res (for resolution) defined

## a - for function to calculate the sum(x^i) for i=0->n 
funfor <- function(x,n){
  i <- 1
  res <- 0
  for(i in 0:n){
    res <- res + x^i
  }
  res
}

## b - while function to calculate the sum(x^i) for i=0->n 

funwhile <- function(x,n){
  i <- 0
  res <- 0
  while(i <= n){
    res <- res + x^i
    i <- i + 1
  }
  res
}

## c - rep function to calculate the sum(x^i) for i=0->n 

funrep <- function(x,n){
  i <- 0
  res <- 0
  repeat{
    if(i > n) {break}
    res <- res + x^i
    i <- i + 1
  }
  res
}

## d - function to calculate the sum(x^i) for i=0->n 

funout <- function(x,n){
  sum(x^(0:n)) 
}

## define random x,n to ensure that the functions work with random numbers and are always the same
x <- runif(1)
n <- floor(runif(1, 0, 10))

## run all 4 functions with the defined x,n 
funwhile(x,n)
funfor(x,n)
funrep(x,n)
funout(x,n)

rm(list=ls())

x <- 1:10
ifelse(x, x^2, sqrt(x))

funfor <- function(x,n){
  i <- 1
  res <- 0
  ifelse(n,   for(i in 0:n){
    res <- res + ifelse(x, x^i)
  }, 0)

  res
}
funfor(1:4,1:3)
ifelse(n,n*2,0)

