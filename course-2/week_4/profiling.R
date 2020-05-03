# Week 4: Profiling
# Design your code, then optimize starting with the biggest wins
# Profile your code rathen than guessing

# system.time has three values including:
# user time: CPU Time
# elapsed time: Human Time
# User(CPU) Time < Elapsed Time because a lot of time is spent getting data
system.time(readLines("http://www.jhsph.edu")) 

# Elapsed Time < User(CPU) Time because of parallelism
hilbert <- function(n) {
    i <- 1:n
    return(1 / outer(i - 1, i, "+"))
}
x <- hilbert(1000)
system.time(svd(x))

# R Profiler
# Rprof profiles while summaryRprof decodes
Rprof() # To turn on profiler
Rprof(NULL) # To turn off profiler
