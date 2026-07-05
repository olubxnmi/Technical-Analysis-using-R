# Standard Deviation function
# BDA400 Assignment 5
# This implementation uses the population standard deviation formula
# shown in the assignment, dividing by n.

stdev <- function(data) {
  if (!is.numeric(data)) {
    stop("data must be numeric")
  }

  if (length(data) == 0) {
    stop("data must contain at least one value")
  }

  mean_value <- sum(data) / length(data)

  diff_values <- data - mean_value

  squared_diff <- diff_values * diff_values

  variance <- sum(squared_diff) / length(squared_diff)

  standard_deviation <- sqrt(variance)

  return(standard_deviation)
}
