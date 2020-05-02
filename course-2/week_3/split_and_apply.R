# Week 3: Split and Apply

# lapply: Loops over a list, applying a function to each element and returning a list
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean) # Apply a function to each element of a list (element names are preserved)
lapply(1:4, runif) # can be construed as evaluating a function on different arguments
lapply(1:4, runif, min = 0, max = 10) # Any additional arguments passed to lapply carry over to the function which is being applied
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
lapply(x, function(mat) { return(mat[,1])}) # lapply is commonly used with anonymous functions that aren't assigned a name 

# sapply: Just like lapply but it tries to simplify the result by a simple set of rules: 
# (1) If the result is a list with every element of length 1, then a vector is returned
# (2) If the result is a list with every element of the same length, then a matrix is returned
# (3) Else, a list is returned
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100,5))
lapply(x, mean) # A list is returned by lapply
sapply(x, mean) # But sapply returns a vector

# split ~ groupby
x <- c(rnorm(10), runif(10), rnorm(10, 1))
x
f <- gl(3, 10) # A function that generates a series of repeated numbers
f # Assigns the first ten indices to group 1, the next 10 to group 2 and so on
split(x, f) # Split divides x basis the levels generated
lapply(split(x, f), mean) # Split-and-apply paradigm

# Splitting a dataframe
library(datasets)
head(airquality)
s <- split(airquality, airquality$Month) # Split by a single level
str(s)
sapply(s, function(x) {return(colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))}) # Calculating column means by splitting and sapplying
x <- rnorm(10)
f1 <- gl(2, 5) # A level with five 1s and five 2s
f1
f2 <- gl(5, 2) # A level with two 1s, 2s, ..., 5
f2
interaction(f1, f2) # An interaction between the two levels
str(split(x, interaction(f1, f2), drop = TRUE)) # Split by an interaction of the two levels, dropping empty levels

# tapply = split + sapply for vectors
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10) # Factor with ten 1s, 2s and 3s
tapply(x, f, mean) # Split and apply
tapply(x, f, mean, simplify = FALSE) # Split and apply without simplifying
tapply(x, f, range) # For functions with more than one return value, simplification does not occur

# apply = apply function to a margin (axis) of a matrix
x <- matrix(rnorm(6), 3, 2)
x
apply(x, 1, mean) # Mean of rows
apply(x, 2, mean) # Mean of columns
# OPTIMIZED rowSums = apply(x, 1, sum)
# OPTIMIZED rowMeans = apply(x, 1, mean)
# OPTIMIZED colSums = apply(x, 2, sum)
# OPTIMIZED colMeans = apply(x, 2, mean)
x <- matrix(rnorm(20), 5, 4)
x
apply(x, 1, quantile, probs = c(0.25, 0.75)) # Applying quantiles to rows with additional argument probs being passed
x <- array(rnorm(2 * 3 * 4), c(2, 3, 4)) # 3D array
x
apply(x, c(1, 2), mean) # Mean across the third dimension
rowMeans(x, dims = 2) # A faster way to compute mean across third dimension - dims = 2 => Sum over dims+1

# mapply ~ zip i.e. apply over multiple objects
mapply(rep, 1:4, 4:1) # Repeat one 4 times, two 3 times, ...
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1)) # The alternative is quite tedious
rnorm(5, 1, 2) # Works well to simulate five random numbers
rnorm(1:5, 1:5, 2) # Does not work all too well to simulate one randome number with mean = 1 and sd = 2, two random numbers with mean = 2 and sd = 2, ...
mapply(rnorm, 1:5, 1:5, 2) # But now it does work - automatic vectorization
# Vectorization turns a function that takes a single argument to one that takes a vector of arguments
# This is useful for plotting a function over a range of values
sumsq <- function(mu, sigma, x) {
    return(sum(((x - mu) / sigma) ^ 2))
}
x <- rnorm(100)
sumsq(1:10, 1:10, x) # Doesn't work - we wanted 10 different values with different means and variances
mapply(sumsq, 1:10, 1:10, MoreArgs = list(x = x)) # Passing x to ten function calls with different values of mu and sigma
vsumsq <- Vectorize(sumsq, c("mu", "sigma")) # Alternatively, vectorize some arguments of a function with Vectorize
vsumsq(1:10, 1:10, x) # Also works
