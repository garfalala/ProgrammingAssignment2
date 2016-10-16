## Put comments here that give an overall description of what your
## functions do

## Usage example: 

## m <- matrix(c(1:4),2,2)                # creates a matrix
## cached_m <- makeCacheMatrix(m)         # sets the matrix cache environment
## cacheSolve(cached_m)                   # calculates the inverse matrix and
##                                        # sets the value in the cache
## cachesolve(cached_m)                   # gets the value from the cache


## Write a short comment describing this function

## makeCacheMatrix stores the matrix passed as a parameter in its environment
## and defines the functions set, get, settinv and gettinv
## that will be called by the function cacheSolve.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  } 
  get <- function() {
    x
  }
  setinv <- function(solve) {
    inv <<- solve
  }
  getinv <- function() {
    inv
  }
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
  
}


## Write a short comment describing this function

## cacheSolve first calls getinv to check if the inverse matrix is
## already calculated. If it is, it returns the value of the inverse matrix.
## Otherwise, it gets the value of the matrix from the 
## makeCacheMatrix environment using get, then calculates the inverse matrix, 
## sets the inverse matrix value in the makeCacheMatrix environment for later use 
## and finally returns the inverse matrix.

cacheSolve <- function(mcm, ...) {
        ## Return a matrix that is the inverse of 'mcm'
  inv <- mcm$getinv()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- mcm$get()
  inv <- solve(data)
  mcm$setinv(inv)
  inv
}

