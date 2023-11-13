## Assignment 1 Test

## Florian Ploder (12209427)
## Kilian Schicho (12116400)
## Mira Radakovic (62005377)
## Tobias Hundsberger (12042646)



## Exercise 1.1
# Let x be 1.23456
x <- 1.23456
print(x)

# Point a - rounding to whole numbers
z <- round(x, digits = 0)
print(z)

# Point b - rounding to three decimal numbers
z <- round(x, digits = 3)
print(z)

# Point c - second decimal digit
z <- floor((x * 100) %% 10) 
print(z)

# Point d - natural and common logarithm
z <- log(x) # natural - default value of log
print(z)

z <- log10(x) # common
print(z)

rm(list=ls())




## Exercise 1.2
# Point a - (1,2,3,4,5,6,7,8,7,6,5,4,3,2,1)
c(1:8, 7:1)

# Point b - (1,2,2,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6)
rep(1:6, 1:6)

# Point c 
matrix(c(1:8, 7), nrow = 3, ncol = 3, byrow = T)

# Point d
?diag # looking at documentation for diag function
A <- matrix(c(1:8, 7), nrow = 3, ncol = 3, byrow = T) # filling matrix up by row
diag(A) <- 0  # setting main diagonal elements to 0   
print(A)

# Point e - a vector of length 100 of the form (1,−1,1,−1,...,−1)
rep(c(1,-1), 50)

# Point f - a vector of length 100 of the form (1,−2,3,−4,...,−100)
rep(1:100*c(1, -1))

rm(list=ls())



## Exercise 1.3

# all integers from 1 to 100 that are not divisible by 2,3 or 5
v <- (1:100)[!(1:100)%%2 == 0 & !(1:100)%%3 == 0 & !(1:100)%%5 == 0] # modulu would be 0 if divisible
print(v)

rm(list=ls())



## Exercise 1.4

# Initial queue
queue <- c("Steve", "Russell", "Alison", "Liam")
print(queue)

# (a) Barry arrives
queue <- c(queue, "Barry") #appending Barry at the end of the queue
print(queue)

# (b) Steve is served
queue <- queue[-which(queue == "Steve")] #remove "Steve" from queue
print(queue)

# (c) Pam talks her way to the front with one item
queue <- c("Pam", queue) #adding Pam to the queue vector at the first index
print(queue)

# (d) Barry gets impatient and leaves
queue <- queue[-which(queue == "Barry")] #identify position "Barry" and remove the element from the queue
print(queue)

# (e) Alison gets impatient and leaves
queue <- queue[-which(queue == "Alison")] #identify position "Alison" and remove the element from the queue
print(queue)

# (f) Find the position of Russell in the queue
position_of_Russell <- which(queue == "Russell") # getting index for Russell in the queue vector - Russell is at the second position
print(paste("Russell is in position", position_of_Russell, "within the current queue."))

# State of the final Queue 
final_queue <- paste("Final queue:", paste(queue, collapse = ", "))
print(final_queue)

rm(list=ls())


## Exercise 1.5
x <- runif(10) # creating random vector with runif function (default: values between 0 and 1)
print(x)

y <- runif(10)
print(y)

# Point a - inner product of x and y
dotprod <- sum(t(x) * y) # transposing x to multiply row element n with column element n - taking the sum of all products to get the inner product
print(dotprod)

# Point b - the norm ||x|| of x
normx <- sqrt(sum(x^2)) # the euclidean norm is a consequence of the pythagorean theorem - captures length of vector
print(normx)

# Point c - the normalized vector of x
normalizedx <- x / normx # turning vector into unit vector (length = 1) with same direction by dividing each component by its norm
print(normalizedx)

rm(list=ls())


## Exercise 1.6 - Let x and y be two vectors in R^10. Assume that x is normalized,
x <- runif(10) # creating random vector in R^10
print(x)
x <- x/sqrt(sum(x^2)) # normalizing vector x by dividing all elements by the norm of x
print(x)
y <- runif(10)
print(y)

# Point a - Compute the orthogonal projection px(y) of y into the linear span of x
orthproj <- (t(x)%*%y)%*%x # %*% for real matrix multiplication "t(x)%*%y" results in constant that is multiplied element-wise with x to get the orthogonal projection
print(orthproj)

# Point b -  projection of a vector y into the linear span is given a linear map given by projection matrix Px = xt(x)
projmatrix <- x%*%t(x) # Computing Px
print(projmatrix)

all.equal(projmatrix%*%y, t(orthproj)) #Verifying that Pxy is equal to (t(x)y)x by the all.equal function
#we transposed the orthproj so that they have the same dimensions and are comparable 
projmatrix%*%y == t(orthproj)
#The differences in all.equal and == are that all.equal compares the objects as a whole, while == compares every single value differently. 
#all.equal also seems to have a pre set tolerance (it compares objects 'near equality'), while == gets influenced by rounding errors.
#If the compared objects x, y in all.equal(x,y) are different, comparison is still made to some extent, and a report of the differences is returned.
rm(list=ls())


## Exercise 1.7 - Let u1, u2, and u3 be three (linearly independent) vectors in R^10
# Point a - choosing elements at random to get three linearly independent vectors
u1 <- runif(10)
print(u1)
u2 <- runif(10)
print(u2)
u3 <- runif(10)
print(u3)

# Point b - create matrix U by means of R function cbind 
U <- cbind(u1,u2,u3)
dim(U) # dimensions 10x3 - matrix with 10 rows and 3 columns - fullrank!
print(U)

# Point c - Compute projection matrix P = U*(t(U)U)^-1t(U)
P <- U %*% solve(t(U) %*% U) %*% t(U) # using solve to get the inverse of t(U)U
print(P)

# Point d - Compute pU (y) for some random vector y in R^10
y <- runif(10) # creating random vector y
print(y)

projectiony <- P %*% y # projected vector y into the linear span of columns of matrix U
print(projectiony)

rm(list=ls())

