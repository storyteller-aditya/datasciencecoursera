# Week 2: Control Structures

# If- Else If - Else 
x <- runif(1, 0, 10)
if (x > 3) {
  y <- 10
} else if (x > 2) {
  y <- 9
} else {
  y <-8
}

# For Loop
for(i in 1:10) {
  print(i)
}
x <- 1:10
for(i in seq_along(x)) {
  print(x[i])
}
for(num in x) {
  print(num)
}
dim(x) <- c(2,5)
x
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  }
}

# While Loop
i <- 0
while(i < 10) {
  print(i)
  i <- i + 1
}

# A Random Walk using While
i <- 5
set.seed(1)
while( i >= 3 && i <= 10) {
  coin = rbinom(1, 1, 0.5)
  if(coin == 1) {
    i <- i + 1
  }
  else {
    i <- i - 1
  }
  print(i)
}

# A Random Walk using Repeat
set.seed(1)
i <- 5
repeat {
  if(i < 3 || i > 10) {
    break
  }
  coin = rbinom(1, 1, 0.5)
  if(coin == 1) {
    i <- i + 1
  }
  else {
    i <- i - 1
  }
  print(i)
}

# Repeat is a infinite while loop that you need to explicitly break out of - useful for optimization where you might need to converge to within a particular threshold

# Next and break
for(i in 1:10) {
  if(i < 3 ) {
    next
  }
  if(i > 7) {
    break
  }
  print(i)
}
