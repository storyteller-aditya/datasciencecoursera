# Week 1: Basics

# R Objects
# Atomic Classes: character, numeric (double), integer, complex, logical
x <- 1 # By default, numbers are numeric (double) type
typeof(x)
x <- 1L # But with an L suffix they become integers
typeof(x)

# Attributes: Object metadata such as names, classes or dimension lengths

# Vector: Sequence of entries of the same type
x <- vector() # Vectors can be initialized using "vector()"
x
?vector # Arguments - mode (one of the atomic classes) and length
x <- vector("numeric", length = 10) # A numeric vector
x
x <- 12:22 # Creating a range vector
x
x <- c(0.5, 0.6, 0.7) # "c()" concatenates objects of the same type to create vectors
x

# Implicit Coercion: In case "c()" encounters objects of different type it attempts to coerce them to the same type
x <- c(0.5, "a") # Thus x becomes a character vector since numbers can be converted to characters trivially

# Explicit Coercion
x <- 0:6
class(x) # Provides the class of a vector
as.numeric(x) # Coerces to numeric
as.logical(x) # Coerces to logical, where only 0 = FALSE
as.character(x) # Coerces to character

# If implicit coercion fails, a warning is thrown and NAs are introduced
x <- c("a", "b", "c")
as.numeric(x)

# Matrix: A column-major vector with multiple dimensions
m <- matrix(nrow = 2, ncol = 3)
m # By default, a matrix is initialized with NAs
attributes(m) # A matrix has one attribute by default, the dim
dim(m) # The dim attribute can be separately called using the dim() function
m <- matrix(1:6, nrow = 2, ncol = 3) # Matrices are stored in column-major format, and is filled out column-by-column
m
m <- 1:10
dim(m) <- c(2, 5) # By setting the dim attribute of a vector, it becomes a matrix
m
cbind(1:3, 2:4, 3:5, 4:6) # Matrices can also be created by column-binding vectors
rbind(1:3, 2:4, 3:5, 4:6) # Or by row-binding them

# List: Sequence of entries of any type
x <- list(1, "a", TRUE) # Lists are created by the list function
x
x <- vector("list", length = 3) # Funnily, an empty list can be created using the vector function with mode = "list"
x

# Factor: An integer vector, where each integer has a label. The R-equivalent of a Python dict (can be ordered or unorderd though). They add value by being self-describing
x <- factor(c("y", "y", "y", "n", "n"))
attributes(x) # It has two attributes - the class and the levels (the order of the labels)
x
x <- factor(c("y", "y", "y", "n", "n"), levels = c("y", "n"))
x # Ordering levels is useful for some modelling functions

# Special Values: NA / NaN (Missing) and Inf
x <- c(1, NA, NaN, 3, Inf, -Inf) # Create a vector with missing values
x
is.na(x) # Checks for NA (NaN is a subclass of NA but not vice-versa)
is.nan(x) # Checks for NaN
is.infinite(x) # Checks for Inf

# DataFrames: Tabular data in R. Represented as a special type fo list where each element (= one column) has to have the same length (= # of rows). They can store different classes of objects in each column unlike matrices
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
attributes(x) # It has attributes names (= col_names) and row.names
nrow(x) # The number of rows
ncol(x) # The number of columns

# Names: We can set the names attribute for vectors, lists and matrices to make them legible as well
x <- 1:3
names(x) <- c("NY", "NJ", "LA")
attributes(x) # We see the names attribute we have set
x # And it makes the vector more legible
x <- list("LA" = 1, "NY" = 2, "NJ" = 3) # Named list initializations seem eerily like Python dicts
x
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
attributes(m) # We see that we have set the dimnames attribute
m # And the matrix is printed clearly
colnames(m) <- c("e", "f") # We can also set the colnames independently
rownames(m) <- c("g", "h") # Or even the rownames
attributes(m) # And the attribute dimnames has been updated accordingly
m # And the matrix reflects it
