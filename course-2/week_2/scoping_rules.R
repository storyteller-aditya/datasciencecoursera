# Week 2: Scoping Rules

# Values bound a variable are searched in the following list in order. The first match found is returned
search()

# Each function has its own environment, an environment being a set of {variable: value} pairs defined in the function itself
# Each environment has a parent and may  have multiple children environments
# Now, since  a function in R can be defined within another function. Hence, each function's parent environment which may or may not be the same as the global environment.
# Moreover, when a function starts looking for a variable which is not defined within itself (a free variable), where it begins the search varies from language to language
# Lexical scoping is when the search starts from the environment in which the function was defined, while in dynamic scoping the search begins from the environment in which the function is called
# R implements lexical scoping. The implication of doing so is that each function must carry pointers to whatever variables are defined within them. Hence, as a side effect, lexical scoping implies that all data must be stored in memory.

# A function that returns another function
make.power <- function(n) {
  pow <- function(x) {
    return(x^n)
  }
  return(pow)
}
cube <- make.power(3)
cube # Cube carries its own environment
cube(18) # That environment is what defines n to be 3
ls(environment((cube))) # And we can take a look
