# Week 1: I/O

# Reading Data | Writing Data
# Tables <- read.table / read.csv | write.table
# Text Files <- readLines | writeLines
# R Code <- source | dump
# ASCII R Object <- dget | dput
# Saved Workspace <- load | save
# Binary R Object <- unserialize | serialize

# read.table
?read.table # Key Args - Filename, HeaderRow (default FALSE), Separator (default ""), colClasses (Class of each column), stringsAsFactors (whether to encode strings as factors)
# For large tables, calculate RAM, set comment.char = "" and run twice (first on first 1000 lines and then entire using the column classes identified from the first part)

# readr Package
# The readr package encapsulates the base readers, simplifying arguments and providing appropriate warnings to make reading data simpler
install.packages("readr")
library(readr)
?read_csv
# read_csv automatically unzips gzip files
# Setting the col_types is good practice
# col_types accepts an abbreviated representation such as "cic" (="char int char"). We can also specify individual col_types using functions such as col_date, col_character, etc.

# Storing and Reading R Objects
# Descriptive object representations that preserve metadata can be created using dump() or dput(). These functions preserve metadata and are editable (being in ASCII). However they aren't space efficient, and are only partially readable.
x <- data.frame(a = 1, b = "a")
x
dput(x) # Essentially dput outputs RCode that can completely recover back the object entirely
# dump does the same for multiple R objects at once
# Serializing and storing in a binary (and perhaps compressed) form is far more efficient - save() as ".rda" (multiple objects), save.image() as ".RData" (complete workspace) and serialize() (perfectly exportable representation of an object as a stream that can be directed to a file or to the network)

# Output Streams
?file # Opens a connection to a file - gzfile() and bzfile() functions open connections to compressed files. Key Args: filename, open code (r / w / a). Returns a connection object
# For the most part, we do not explicitly deal with connections, since functions such as read.csv abstract away this level of detail
?readLines # The exception is readLines() and its complement writeLines() that does require a connection object
?url # Opens a connection to a webpage. Commonly used for reproducibility, where a dataset might be published to a server and downloaded once again in future cases
