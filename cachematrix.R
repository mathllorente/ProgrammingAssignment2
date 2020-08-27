#=============================Comments========================================

#I used solve() to cap the inverse matrix
#Look: inverse matrix is only for squared matrix

my_matrix = matrix(1:4, 2, 2) #Squared matrix

solve(my_matrix) #this is my inverse matrix

my_nonsquaredmatrix = matrix(1:10, 2, 5) #non squared matrix

solve(my_nonsquaredmatrix) #it's error, cause the matrix is not squared

#=============================================================================
 
makeCachematrix <- function(x = matrix()) {
    
    inversematrix <- NULL #the in. inverse matrix
    
    setmatrix <- function(y) { #function for: set the matrix
        x <<- y #storage the matrix
        inversematrix <<- NULL #storage the inverse matrix (i'll set in next)
    }
    
    getmatrix <- function() x #function for: get the matrix
    setinverse <- function(inverse) inversematrix <<- inverse #storage the inverse matrix (I'll set in func cacheinverse)
    getinverse <- function() inversematrix  #I'll get in func cacheinverse
    list(setmatrix = setmatrix, getmatrix = getmatrix,
         setinverse = setinverse,
         getinverse = getinverse)}

#Using the function to cap the inverse

func = makeCachematrix() #func  is my  cache function

my_matrix = matrix(1:4, 2, 2) #create a matrix

func$setmatrix(my_matrix) #Setting my matrix 
func$getmatrix() #Seeing my matrix

func$setinverse() #Look: return error, but i'll use this in the next function (cacheinverse)
func$getinverse() #Look: return NULL, but i'll use this in the next function (cacheinverse)

cacheinverse <- function(x, ...) {
    inversematrix <- x$getinverse()
    if(!is.null(inversematrix)) { #If inverse matrix was set (but i set: inversematrix <<- NULL)
        message("getting inverse in cached data")
        return(inversematrix)
    }
    data <- x$getmatrix() #attribute the matrix for data
    inverse <- solve(data) #calculate the inverse matrix and attribute for inverse variable
    x$setinverse(inverse) #setting the inverse matrix
    message("The inverse matrix is:")
    return(x$getinverse()) #returning the inverse
}

#=============================================================================================================
#First execute
cacheinverse(func)
#The inverse is NULL, else will calculate and return the matrix (will jump the "if(!is.null(inversematrix))")
#Second execute
cacheinverse(func)
#The inverse isn't NULL (in storage), else will return the inverse matrix
#=============================================================================================================

#Matheus Leite Llorente
