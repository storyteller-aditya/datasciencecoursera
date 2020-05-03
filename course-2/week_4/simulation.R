# Week 4: Simulation

# For each probability distribution there are four functions:
# with prefixes "r", "d", "p" and "q"
# "r" generates random numbers sampled from the distribution
# "d" evaluated the density at a point
# "p" evaluates the cumulative distribution at a point
# "q" evaluated the quantile (inverse cumulative distribution)
# Probability distributions include norm (Gaussian), unif (Uniform),
# pois (Poisson), binom(Binomial), etc

set.seed(1)
rnorm(10, mean = 5, sd = 0.05) # Generates 10 random from a Gaussian
pnorm(5.15, mean = 5, sd = 0.05) # Probability of being less than three std devs above mean
dnorm(5.15, mean = 5, sd = 0.05) # Density = 1/sqrt(2*pi*sigma^2) * exp(-1/2 * ((x - mu) / sigma)^2 )

# Seeds
set.seed(1)
rnorm(10, mean = 5, sd = 0.05) # Seed setting ensures replicability

# Simulating a linear model
# Example: y = a + bx + c where x ~ N(0, 2^2), a = 0.5, b = 1, c~N(0, 1^2)
set.seed(10)
x <- rnorm(100, 0, 2)
c <- rnorm(100, 0, 1)
y <- 0.5 + x + c
summary(y)
plot(x, y)

# Random Sampling
set.seed(1)
sample(1:10, 4) # Sample randomly

set.seed(1)
sample(1:10, 4, replace = TRUE) # Sample randomly with replacement

set.seed(1)
sample(1:10) # Random permutation

library(datasets)
data("airquality")
head(airquality)
airquality[sample(rownames(airquality), 10), ] # Random sample of data.frame
