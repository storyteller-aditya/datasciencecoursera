# Week 1: Subsetting and Vectorization

# The "[]" operator returns an object as the same class as the original, and can be used to select multiple objects

# Vector Subsetting
x <- c("a", "b", "c", "d", "e", "f")
x[1] # R has a 1-based index
x[1:4] # Selecting a range of elements
x[c(1,3,4)] # Selecting a subset of elements
x[x>"c"] # Selecting using a logical operator
x > "c" # Where the inside logical operator outputs this, which is further used for index selection

# Matrix Subsetting
m <- matrix(1:6, 2, 3)
m
m[1, 2] # For matrices, we need two values to extract an element. Returned as a vector of length 1
m[, 2] # Skipping the first returns an entire column
m[1, ] # Skipping the second returns an entire row
m[1, 2, drop = FALSE] # Adding te argument drop = FALSE returns a 1x1 matrix instead of a 1-length vector
m[, 2, drop = FALSE] # The drop argument plays a similar role when returning a 2x1 matrix instead of a 2-length vector

# The "[[]]" operator extracts a single object of a list / dataframe
x <- list(foo = 1:4, bar = 0.6)
x
x[[1]] # Extracts the first element

# The "$" operator extracts an element of a list / dataframe by its literal name
x$foo # Extracts the foo-labelled elements

name <- "foo"
x[[name]] # Can be used with computed indices unlike the $ operator which works only with string literals

# Subsetting Nested Lists
x <- list(a = list(6, 8, 10), b = c(1.1, 2.2))
x[[c(1, 3)]] # Third element of list one
x[[1]][[3]] # Also the third element of list one

# Multiple elements of a list can be extracted using [] operator
x <- list(foo = 1:4, bar = 3.14, baz = "foobar")
x[c(1,3)] # Extracts first and third element

# Partial matching of names is something that can work as a quick shortcut but is discouraged in production code
x <- list(nerinuensef = 7:11, urwngunrsbo = 19:23)
x$u # With $ operator, it works out of the box
x[["u"]] # With "[[]]" it needs an added argument - this will return NULL
x[["u", exact = FALSE]] # With the exact argument set to FALSE, partial matching does indeed do the trick

# Removing NA Values
x <- c(1,2,NA,3,NA,4,NA,NA,5)
x[!is.na(x)] # Removing NA using the is.na() function
y <- c(NA,NA,1,2,3,4,5,NA,6)
filter = complete.cases(x, y) # With complete.cases, we drop a position if any of the objects has an NA at that position (Equivalent to is.na(x) and is.na(y))
filter
x[filter]
y[filter]
air_quality = datasets::airquality
head(air_quality)
head(air_quality[complete.cases(air_quality), ]) # complete.cases works on dataframes too - we can see the missing indices

# Vectorization is out-of-the-box parallelism that has the added benefit of improving the legibility of the code
x <- 1:4
y <- 6:9
x+y # Simply add the vectors
x >= 3 # Compare a vector with a scalar
# If the vectors are of different lengths, R 'recycles' the shorter vector until it is the same length as the longer vector.


# Vectorization for Matrices
x <- matrix(1:4, 2, 2)
x
y <- matrix(rep(10,4), 2, 2)
y
x * y # Element-wise multiplication
x %*% y # Matrix multiplication
