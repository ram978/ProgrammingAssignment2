## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# functions working:
# 1. Set matrix value
# 2. Get matrix value
# 3. Set inverse matrix value
# 4. Get inverse matric value
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}

#The following function calculates the inverse of the special "matrix" created with the above function using varibales setinverse and getinverse. 
#However, it first checks to matrx is null or not. If so, it gets the inverse matrix from the cache 
#and skips the computation. Otherwise, it calculates the iverse of the 
#data and sets the value of the inverse in the cache via the setiverse function.
## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data.")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  return(m)
}

# Solution
#> source('~/Documents/assign2/rpengassign2/ProgrammingAssignment2/cachematrix.R')
#> s <- makeCacheMatrix()
#> s$set(matrix(rnorm(9), nrow=3, ncol = 3)) 
#> s$get()
#[,1]        [,2]      [,3]
#[1,] -0.29865458 -0.98605013  1.013968
#[2,]  0.51775463 -1.40495335 -1.154969
#[3,]  0.03285516  0.08383103 -1.255785
#> cacheSolve(s)
#[,1]         [,2]       [,3]
#[1,] -1.74146041  1.079103943 -2.3985936
#[2,] -0.57287142 -0.319756686 -0.1684719
#[3,] -0.08380447  0.006887012 -0.8703159
