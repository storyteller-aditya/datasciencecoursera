# Lesson 2: Working Directory
getwd() # Current working directory
setwd() # Set working directory
list.files() # Objects in current working directory
dir() # Also the same result
ls() # Objects in current workspace
args(list.files) # Arguments of the function
dir.create("testdir") # Creates a new directory
file.create("mytest.R") # Creates a new file
file.exists("mytest.R") # Checks the existence of a file
file.info("mytest.R") # ls -ltrh equivalent
file.rename("mytest.R", "mytest2.R") # Rename file
file.copy("mytest2.R", "mytest3.R") # Copy file
file.path("mytest3.R") # Relative path of file
file.path("folder1", "folder2") # Equivalent to os.path.join
dir.create(file.path("testdir2", "testdir3"), recursive = TRUE) # Recursively create missing directories
setwd(old.dir) # Revert to original directory

# Lesson 3: Sequences of Numbers
pi:10 # Step of 1, starting with the initial value, till the value does not become greater than the final value
15:1 # Last < First => Step = -1
seq(0, 10, by = 0.5) # Sequence is a generalization that allows step
my_seq <- seq(5, 10, length = 30) # Or even the number of values
seq(along.with = my_seq) # Another sequence of the same length as my_seq
seq_along(my_seq) # Same as above
rep(0, times = 40) # Repetitions of a number
rep(c(0, 1, 2), times = 10) # Repetitions of a vector
rep(c(0, 1, 2), each = 10) # Each values is repeated and then next value

# Lesson 4: Vectors
my_char <- c("My", "name", "is")
paste(my_char, collapse = " ") # " ".join([...]) Equivalent
my_name <- c(my_char, "xyz")
paste(1:3, c("X","Y","Z"), sep = "") # Paste can be used for multiple vectors
paste(LETTERS, 1:4, sep = "-") # LETTERS is a keyword character vector containing a:z

# Lesson 5: Missing Values
y <- rnorm(1000) # 1000 values sampled from the random normal distribution
my_data <- sample(c(y, z), 100) # Sampling a fixed number of values from a vector

# Lession 6: Subsetting Vectors
# Index vectors come in four different flavors -- logical vectors, vectors of positive integers, vectors of negative integers, and vectors of character strings
# NA > 0  evaluates to NA
x[c(-2, -10)] # All values except the 2nd and the 10th
x[-c(2, 10)] # A shorter way of the same
vect <- c(foo = 11, bar = 2, norf = NA)
vect2 <- c(11,2,NA)
names(vect2) <- c("foo", "bar", "norf")
identical(vect, vect2) # Checks for identical values

# Lesson 7: Matrices and DataFrames
my_vector <- 1:20
length(my_vector)
dim(my_vector) <- c(4,5)

