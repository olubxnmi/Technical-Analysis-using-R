# Exponential Moving Average function
# BDA400 Assignment 5

ema <- function(data, period) {
  if (!is.numeric(data)) {
    stop("data must be numeric")
  }

  if (period <= 0) {
    stop("period must be greater than 0")
  }

  if (length(data) < 1) {
    stop("data must contain at least one value")
  }

  multiplier <- 2 / (period + 1)

  ema_values <- rep(NA, length(data))
  ema_values[1] <- data[1]

  for (i in 2:length(data)) {
    ema_values[i] <- (data[i] - ema_values[i - 1]) * multiplier + ema_values[i - 1]
  }

  return(ema_values)
}
