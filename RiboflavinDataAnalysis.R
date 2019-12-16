# Load the riboflavin data
require(hdi) # this should install hdi package if you don't have it already; otherwise library(hdi)
data(riboflavin) # this puts list with name riboflavin into the R environment, y - outcome, x - gene erpression
dim(riboflavin$x) # n = 71 samples by p = 4088 predictors
?riboflavin # this gives you more information on the dataset

# Get matrix X and response vector Y
X = as.matrix(riboflavin$x)
Y = riboflavin$y

# [ToDo] Source your lasso functions
source('LassoFunctions.R')

# [ToDo] Use your fitLASSO function on the riboflavin data with 30 tuning parameters
lasso_fit = fitLASSO(X, Y, n_lambda = 30)

# [ToDo] Based on the above output, plot the number of non-zero elements in each beta versus the value of tuning parameter
plot(lasso_fit$lambda_seq, colSums(lasso_fit$beta_mat == 0))

# [ToDo] Use microbenchmark 10 times to check the timing of your fitLASSO function above with 30 tuning parameters
library(microbenchmark)
microbenchmark(fitLASSO(X, Y, n_lambda = 30), nrep = 10)

# [ToDo] Report your median timing in the comments here: 2.50 (~5.5 seconds for Irina on her laptop)

# [ToDo] Use cvLASSO function on the riboflavin data with 30 tuning parameters
lasso_cv = cvLASSO(X, Y, n_lambda = 30)

# [ToDo] Based on the above output, plot the value of CV(lambda) versus tuning parameter
plot(lasso_cv$lambda_seq , lasso_cv$cvm)
