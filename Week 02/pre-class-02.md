# pre-class


Make sure you commit this often with meaningfull messages. 

### Background

The exponential distribution is defined by its cumulative distribution function
\(F(x) = 1-e^{-\lambda x}\)

The R function ***rexp()*** generates random variables with an exponential distribution. For example 
<center><strong>rexp(n=10, rate=5)</strong> </center>

results in 10 exponentially distributed numbers with a rate \(\lambda=5\). If you leave out the 5 and just have
<center><strong>rexp(n=10) </strong></center>
then this results in 10 exponentially distributed numbers with a rate \(\lambda=1\), this is also referred to as the "standard exponential distribution". 

### Part 1


1. Generate 200 random values from the standard exponential distribution and store them in a vector `exp.draws.1`.  Find the mean and standard deviation of `exp.draws.1`.

exp.draws.1 <- rexp(n=200)
mean(exp.draws.1)
sd(exp.draws.1)

2. Repeat, but change the rate to 0.2, 5, 7.3 and 10, storing the results in vectors called  `exp.draws.0.2`,  `exp.draws.5`,  `exp.draws.7.3` and  `exp.draws.10`. 

exp.draws.0.2 <- rexp(n=200, rate=0.2)  
mean(exp.draws.0.2)  
sd(exp.draws.0.2)  

exp.draws.5 <- rexp(n=200, rate=5)  
mean(exp.draws.5)  
sd(exp.draws.5)  

exp.draws.7.3 <- rexp(n=200, rate=7.3)  
mean(exp.draws.7.3)  
sd(exp.draws.7.3)  

exp.draws.10 <- rexp(n=200, rate=10)  
mean(exp.draws.10)  
sd(exp.draws.10)  
  

3. The function `plot()` is the generic function in R for the visual display of data. `hist()` is a function that takes in and bins data as a side effect. To use this function, we must first specify what we'd like to plot.
    a. Use the `hist()` function to produce a histogram of your standard exponential distribution. 
    b. Use `plot()` with this vector to display the random values from your standard distribution in order.
    c. Now, use `plot()` with two arguments -- any two of your other stored random value vectors -- to create a scatterplot of the two vectors against each other.

#a
hist(exp.draws.1)  
#b
plot(exp.draws.1)  
#c
plot(exp.draws.0.2,exp.draws.10)  

4. We'd now like to compare the properties of each of our vectors. Begin by creating a vector of the means of each of our five distributions in the order we created them and saving this to a variable name of your choice. Using this and other similar vectors, create the following scatterplots and explain in words what is going on:
    a. The five means versus the five rates used to generate the distribution.
    b. The standard deviations versus the rates.
    c. The means versus the standard deviations.
#a
five_means <- c(mean(exp.draws.1), mean(exp.draws.0.2), mean(exp.draws.5), mean(exp.draws.7.3), mean(exp.draws.10))

five_rates <- c(1, 0.2, 5, 7.3, 10)

plot(five_means, five_rates)  
#plotting the mean and rate coordinates for each of the 5 vectors. you can see that the mean increases as the rate lambda decreases.

#b
five_sd <- c(sd(exp.draws.1), sd(exp.draws.0.2), sd(exp.draws.5), sd(exp.draws.7.3), sd(exp.draws.10))

plot(five_sd, five_rates)  
#plotting the standard deviation and rates for each of the 5 vectors. you can see that the standard deviation increases as the rate lambda decreases. this is similar to what we saw in the previous plot, which makes intuitive sense because of the relationship between mean and standard deviation.

#c
plot(five_means, five_sd)  
#plotting the means and standard deviation for each of the 5 vectors. you can see the close relationship between mean and standard deviation

For each plot, explain in words what's going on.

### Part II (PHP 2560 Only)


5. R's capacity for data and computation is large to what was available 10 years ago. 
    a. To show this, generate 1.1 million numbers from the standard exponential distribution and store them in a vector called `big.exp.draws.1`. Calculate the mean and standard deviation.
    b. Plot a histogram of `big.exp.draws.1`.  Does it match the function \(1-e^{-x}\)?  Should it? 
    c. Find the mean of all of the entries in `big.exp.draws.1` which are strictly greater than 1. You may need to first create a new vector to identify which elements satisfy this.
    d. Create a matrix, `big.exp.draws.1.mat`, containing the the values in 
`big.exp.draws.1`, with 1100 rows and 1000 columns. Use this matrix as the input to the `hist()` function and save the result to a variable of your choice. What happens to your data?
    e. Calculate the mean of the 371st column of `big.exp.draws.1.mat`.
    f. Now, find the means of all 1000 columns of `big.exp.draws.1.mat` simultaneously. Plot the histogram of column means.  Explain why its shape does not match the histogram in problem 5b).

#a
big.exp.draws.1 <- rexp(n=1100000)  
mean(big.exp.draws.1)  
sd(big.exp.draws.1)  

#b
hist(big.exp.draws.1)  
#It does match the CDF and it should because the histogram gives the frequency of values x in big.exp.draws.1 and the CDF is Pr(X <= x)

#c
big.exp.draws.1_greater <- big.exp.draws.1[big.exp.draws.1 > 1]  
mean(big.exp.draws.1_greater)

#d
big.exp.draws.1.mat <- matrix(big.exp.draws.1, nrow = 1100, ncol = 1000)  
hist(big.exp.draws.1.mat)  
#fewer histogram bar groups that are more inclusive

#e
mean(big.exp.draws.1.mat[,371])

#f
hist(mean(big.exp.draws.1.mat[,1:1000]))  
#It looks different because this is the histogram of the means of all of the values rather than the freq distribution of the values themselves.
