# Debugging Tools

# traceback: Prints out the function call stack after an error occurs. Must be called immediately after error occurs

# debug: Steps through a function one expression at a time to pinpoint exactly where the error occurs
debug(lm) # Activate debugging for lm
x <- 1:10
lm(y ~ x) # Debugger mode: n => next / c => continue to error / Q => quit
undebug(lm) # Unactivate it

# recover: Function execution halts when an error occurs for you to root cause what caused it
options(error = recover) # Changes the default behaviour to recover in case of errors
options(error = NULL) # Changing back to the default behavior

# browser: Suspends exection of a function and puts it into debug mode
# trace: Insert debugging code into a function