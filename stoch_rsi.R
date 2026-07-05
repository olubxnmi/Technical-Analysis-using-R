# Stochastic RSI function
# BDA400 Assignment 5

source("scripts/sma.R")
source("scripts/rsi.R")

stoch_rsi <- function(data, period, k_period, d_period) {
  if (!is.numeric(data)) {
    stop("data must be numeric")
  }

  if (period <= 0 || k_period <= 0 || d_period <= 0) {
    stop("all periods must be greater than 0")
  }

  rsi_values <- rsi(data, period)

  stoch_values <- rep(NA, length(rsi_values))

  for (i in 1:length(rsi_values)) {
    start_index <- max(1, i - k_period + 1)
    rsi_window <- rsi_values[start_index:i]
    rsi_window <- rsi_window[!is.na(rsi_window)]

    if (length(rsi_window) >= k_period) {
      min_rsi <- min(rsi_window)
      max_rsi <- max(rsi_window)

      if (max_rsi == min_rsi) {
        stoch_values[i] <- 0
      } else {
        stoch_values[i] <- (rsi_values[i] - min_rsi) / (max_rsi - min_rsi)
      }
    }
  }

  k_line <- sma(stoch_values, k_period)
  d_line <- sma(k_line, d_period)

  result <- list(
    k_line = k_line,
    d_line = d_line
  )

  return(result)
}
