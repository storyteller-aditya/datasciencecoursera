# Week 3 Assignment -> A rudimentary cached matrix

# There are three functions defined for this assignment
# (1) makeCacheMatrix that carries a matrix and its cached inverse
# (2) cacheSolve that inverts a matrix, returning a cached value if possible
# (3) test that tests the functions for various invertible matrices
# At the end, the test function is called to test our code

# A function that carries with it a matrix and its inverse
makeCacheMatrix <- function(mat = matrix()) {
    # inv_mat stores the inverse of the matrix mat
    inv_mat <- NULL # Lazy evaluation of matrix inverse
    
    # A setter function for the matrix mat
    set_mat <- function(user_mat) {
        print("Matrix Setter")
        mat <<- user_mat # Set the matrix mat
        inv_mat <<- NULL # Invalidate cache. Will be lazily evaulated
    }
    
    # A getter function for the matrix mat
    get_mat <- function() {
        print("Matrix Getter")
        return(mat) # Returns the matrix mat
    }
    
    # A setter function for the inverse
    set_inv <- function(inv) {
        print("Inv Matrix Setter")
        inv_mat <<- inv # Sets the inverse matrix
    }
    
    # A getter function for the inverse
    get_inv <- function() {
        print("Inv Matrix Getter")
        return(inv_mat) # Returns the inverse matrix
    }
    
    # A list of getters and setters
    getters_and_setters = list(
        set = set_mat, get = get_mat,
        set_inv = set_inv, get_inv = get_inv
    )
    
    # Returns getters and setters
    return(getters_and_setters)
}


# A function that inverts a matrix, while caching the latest inverse
cacheSolve <- function(mat, ...) {
    mat_inv <- mat$get_inv()
    if(!is.null(mat_inv)) {
        message("Using the cached matrix")
        return(mat_inv)
    }
    matrix <- mat$get()
    mat_inv <- solve(matrix, ...)
    mat$set_inv(mat_inv)
    return(mat_inv)
}


# A function that tests our code
test <- function() {
    # Make cache matrix
    cache_mat <- makeCacheMatrix()
    
    print("Create an invertible square matrix whose determinant != 0")
    mat <- matrix(c(1:2, 2:1), nrow = 2, ncol = 2) # det(mat) = -3
    print(mat)
    print("---")
    
    print("Assign it to cache_mat")
    cache_mat$set(mat)
    print("---")
    
    print("Compute its inverse")
    mat_inv <- cacheSolve(cache_mat)
    # First gets the inverse ("Inv Matrix Getter")
    # Finds it to be null and thus gets the matrix ("Matrix Getter")
    # Finally, sets inverse matrix for caching ("Inv Matrix Setter")
    print(mat_inv)
    print("---")
    
    print("Print the value of mat_inv present in cache_mat")
    print(cache_mat$get_inv())
    print("They are indeed the same! Thus the inverse of mat has been cached")
    print("---")
    
    other_mat_inv <- cacheSolve(cache_mat)
    print(other_mat_inv)
    print("And we see that our cacheSolve returns the cached value instead!")
    print("---")
    
    print("Create another invertible matrix")
    mat <- matrix(c(1:5, 4:1), nrow = 3, ncol = 3) # det(mat) = -8
    print(mat)
    print("---")
    
    print("Set the new matrix")
    cache_mat$set(mat)
    print("---")
    
    print("Validate that the inverse matrix stored in cache_mat has been set to null")
    print(cache_mat$get_inv())
    print("---")
    
    print("Calculate the inverse for the new matrix")
    inv_mat <- cacheSolve(cache_mat)
    print(inv_mat)
    print("---")
    
    print("Success!")
}

test()
