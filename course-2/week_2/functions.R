# Week 2: Functions
f <- function(num = 3) {
    string = "Hello, world!\n"
    for(i in seq_len(num)) {
        cat(string)
    }
    return(num * nchar(string)) # The last expression within a function becomes its return value even if the return statement is not used
}
f(1)
f(num = 2) # Named Arguments
meaningOfLife <- f() # Default Arguments

# Arguments specified by name are taken out of the list of func args, and then all other subsequent ones are matched by position

# Arguments are evaluated lazily, which means that a function won't even notice a missing argument till it is not used
f <- function(a, b) {
  return(a^3)
}
f(7) # Did not notice the lack of b
f <- function(a, b) {
  return(a^3 + b^3)
}
f(7) # Lack of b felt

# ... argument means "a list of as many args as passed". Arguments coming after ... can be matched only by name, not position
paste(3, 5, sep = ":")
