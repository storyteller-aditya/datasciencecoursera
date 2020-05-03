# Week 4: Swirl

# Looking at data
dim(plants)
nrow(plants) # Number of rows
ncol(plants) # Number of columns
object.size(plants) # Memory consumed
names(plants) # Column names
head(plants, 10) # Top 6 rows by default, in this case top 10
tail(plants, 15) # Last 15 rows
summary(plants) # Feel of the data
table(plants$Active_Growth_Period) # The actual counts of a column
str(plants) # Good way to understand data structure

# Simulation
sample(1:6, 4, replace = TRUE) # Sampling a roll of four six-sided dice
sample(LETTERS) # LETTERS  is a vector of capital English alphabets. Sampling without a number = Random permutation
flips <- sample(c(0, 1), 100, replace = TRUE, prob = c(0.3, 0.7)) # 100 tosses of a biased coin with p(H) = 0.3
sum(flips) # And we see ~70 tails

# Each probability distribution in R has an r*** function (for "random"), a d*** function (for "density"), a p*** (for "probability"), and q*** (for "quantile")
flips2 <- rbinom(n = 100, size = 1, prob = 0.7) # Another way of simulating 100 tosses of a biased coin with p(H) = 0.3
sum(flips2)

rnorm(10, mean = 100, sd = 25) # 10 numbers from Gaussian with mean 100 and sd 25
my_pois <- replicate(100, rpois(5, lambda = 10)) # Simulating 100 draws of 5 numbers from Poisson with mean 10
cm <- colMeans(my_pois) # Column means of the 100 separate draws
hist(cm) # Means of the 100 Poisson draws tends to normal -> Central Limit Theorem
# Others: rexp, rchisq, rgamma, ...

# Base Graphics
data(cars)
plot(cars) # plots=scatter b/w two columns, uses column names as axis labels and creates axis tick marks at appropriate numbers
plot(x = cars$speed, y = cars$dist) # In this case it is unsure about the column names, and just uses the names of the arguments passed
plot(x = cars$speed, y = cars$dist, xlab = "Speed",
     ylab = "Stopping Distance") # Thus we explicitly set the labels
plot(cars, main = "My Plot") # The main argument sets the title
plot(cars, sub = "My Plot Subtitle") # The sub argument sets the subtitle
plot(cars, col = 2) # Red dots
plot(cars, pch = 2) # Triangle
plot(cars, xlim = c(10, 15)) # xlim
plot(cars,) # The main argument sets the title

data(mtcars)
boxplot(formula = mpg ~ cyl, data = mtcars) # Formula API defined relation b/w variables to be plotted
hist(mtcars$mpg) # A histogram

# GGPlot: http://www.ling.upenn.edu/~joseff/rstudy/week4.html
