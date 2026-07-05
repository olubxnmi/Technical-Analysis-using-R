# Relative Strength Index function
# BDA400 Assignment 5

rsi <- function(data, period) {
  if (!is.numeric(data)) {
    stop("data must be numeric")
  }

  if (period <= 0) {
    stop("period must be greater than 0")
  }

  if (length(data) <= period) {
    stop("data length must be greater than period")
  }

  diff_values <- diff(data)

  gains <- rep(0, length(diff_values))
  losses <- rep(0, length(diff_values))

  for (i in 1:length(diff_values)) {
    if (diff_values[i] > 0) {
      gains[i] <- diff_values[i]
      losses[i] <- 0
    } else {
      gains[i] <- 0
      losses[i] <- abs(diff_values[i])
    }
  }

  avg_gain <- sum(gains[1:period]) / period
  avg_loss <- sum(losses[1:period]) / period

  rsi_values <- rep(NA, length(data))

  if (avg_loss == 0) {
    rsi_values[period + 1] <- 100
  } else {
    rs <- avg_gain / avg_loss
    rsi_values[period + 1] <- 100 - (100 / (1 + rs))
  }

  if ((period + 2) <= length(data)) {
    for (i in (period + 2):length(data)) {
      gain_index <- i - 1

      avg_gain <- ((avg_gain * (period - 1)) + gains[gain_index]) / period
      avg_loss <- ((avg_loss * (period - 1)) + losses[gain_index]) / period

      if (avg_loss == 0) {
        rsi_values[i] <- 100
      } else {
        rs <- avg_gain / avg_loss
        rsi_values[i] <- 100 - (100 / (1 + rs))
      }
    }
  }

  return(rsi_values)
}
