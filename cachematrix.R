## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function helps to create a special matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmatinv <- function(solveinv) m <<- solveinv
  getmatinv <- function() m
  list(set = set, get = get,
       setmatinv = setmatinv,
       getmatinv = getmatinv)
}


## Write a short comment describing this function
## get the cached inverse if present else calculate the inverse using solve
cacheSolve <- function(x, ...) {
  m <- x$getmatinv()
  
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  m <- solve(data)
  x$setmatinv(m)
  m
        ## Return a matrix that is the inverse of 'x'
}
