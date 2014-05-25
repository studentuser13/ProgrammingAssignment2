## These functions return the inverse matrix of a given solvable matrix,
## and return a cached value in the case the same matrix is passed to the
## solve function. Returning the cache value reduces the system time
## needed to return the value.

## These functions assume the matrix will aways be solvable, that is square
## (e.g. 3x3, 16x16), and not singular (not solvable).

## STUB: makeCacheMatrix <- function(x = matrix)
## This function creates a list containing subfunctions to handle matrices. 
## Subfunctions get and set the not yet computed matrix, and get and set
## the stored, computed, inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
	  ## Create a list with functions and a matrix
	m <- NULL
	set <- function(y){ ## This subfunction sets the matrix to be computed
		x <<- y
		m <<- NULL
	}
	get <- function()x ## This subfunction returns the not yet computed matrix
	setinverse <- function(solve) m <<- solve ## This subfunction sets the computed inverse matrix
	getinverse <- function()m ## This subfunction returns the cached computed inverse matrix
	list(set = set, get = get, setinverse = setinverse, ## list containing functions
		 getinverse = getinverse)
}

## STUB: cacheSolve <- function(x, ...)
## This function takes a list returned by makeCacheMatrix containing subfunctions
## to retrieve and store matrices and computes the inverse matrix (matrix^-1).
## If the same inverse has already been computed, then the function returns the
## stored value.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m <- x$getinverse() ## (makeCacheMatrix subfuntion) retrieve the inverse matrix
	if(!is.null(m)){ ## check if data is present in cache
		message("retrieving cache...") ## notify user data is cached
		return(m)
	}
	data <- x$get() ## (makeCacheMatrix subfunction) return the matrix to be computed
	m <- solve(data,...) ## compute inverse matrix 
	x$setinverse(m) ## (makeCacheMatrix subfuntion) set the cache with the computed matrix
	m
}
