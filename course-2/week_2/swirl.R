# Week 2: Swirl

# Logic
TRUE & c(TRUE, FALSE, FALSE) # Evaluated with all elements
TRUE && c(TRUE, FALSE, FALSE) # Evaluated only with the first element
TRUE | c(TRUE, FALSE, FALSE) # Evaluated with all elements
TRUE || c(TRUE, FALSE, FALSE) # Evaluated only with the first element

5 > 8 || 6 != 8 && 4 > 3.9
isTRUE(6>4) # Another way of checking inequalities
identical('twins', 'twins') # Checks for identicality
xor(5==6, !FALSE)

ints <- sample(10)
ints > 5
which(ints>7) # Returns a vector of values that return True
any(ints < 0) # Any one evaluates to TRUE => TRUE
all(ints > 0) # Any one evaluates to FALSE => FALSE

# Functions
mean(c(2, 4, 5)) # Mean function
my_mean <- function(my_vector) { # Replicating the mean
  return(sum(my_vector) / length(my_vector))
}
# Anonymous Functions ~ Python Lambdas
mad_libs <- function(...){
  # Do your argument unpacking here!
  args <- list(...)
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}
# Definining binary operator
"%p%" <- function(left, right){ # Remember to add arguments!
  paste(left, right)
}

# Dates and Times
# POSIXct and POSIXlt
d1 <- Sys.Date()
class(d1) # Date
unclass(d1) # Internally date is stored as days since 1970-01-01
d1
d2 <- as.Date("1969-01-01")
unclass(d2) # Ditto - number of days in negative
t1 <- Sys.time()
t1
class(t1) # Time is by default POSIXct
unclass(t1) # Number of seconds since 1970-01-01
t2 <- as.POSIXlt(Sys.time())
class(t2)
t2
str(unclass(t2)) # POSIXlt has more metadata
t2$min
weekdays(d1) # Weekdays(), months() and quarters()
months(t1)
quarters(t2)
t3 <- strptime("October 17, 1986 08:24", "%B %d, %Y %H:%M")
t3
difftime(Sys.time(), t1, units = "days") # Time difference in days
