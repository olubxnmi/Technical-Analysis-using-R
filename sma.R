# Simple Moving Average function
# BDA400 Assignment 5

sma <- function(data, period) {
  if (!is.numeric(data)) {
    stop("data must be numeric")
  }

  if (period <= 0) {
    stop("period must be greater than 0")
  }

  if (length(data) < period) {
    stop("Data length should be greater than or equal to the period")
  }

  sma_values <- rep(NA, length(data))

  for (i in period:length(data)) {
    current_window <- data[(i - period + 1):i]
    sma_values[i] <- sum(current_window) / period
  }

  return(sma_values)
}
