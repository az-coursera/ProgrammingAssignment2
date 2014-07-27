## I don't know if I should write any description for that 'cause it's just obvious.
## Anyway it's just copy-paste of the example from programming assignment page,
## that adapted to create a special object (with the matrix inside) 
## that is able to cache the result of solve() function. 

## creates special object with cache
makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x

    setsolve <- function(solve) s <<- solve
    getsolve <- function() s

    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## caching function that returns an inverted matix
cacheSolve <- function(x, ...) {
    s <- x$getsolve()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setsolve(s)
    s
}
