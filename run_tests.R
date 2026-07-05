# BDA400 Assignment 5 Test Runner
# Run this file from the assignment root folder.

source("scripts/sma.R")
source("scripts/ema.R")
source("scripts/macd.R")
source("scripts/stdev.R")
source("scripts/linreg.R")
source("scripts/rsi.R")
source("scripts/stoch_rsi.R")
source("scripts/crossover.R")
source("scripts/crossunder.R")

sample_data <- c(10, 12, 15, 20, 18, 22, 25, 24, 21, 23, 27, 30, 28, 32, 35, 34, 36, 38, 40, 39)

cat("SMA Result:\n")
print(sma(sample_data, period = 3))

cat("\nEMA Result:\n")
print(ema(sample_data, period = 3))

cat("\nMACD Result:\n")
print(macd(sample_data, short_period = 3, long_period = 5, signal_period = 2))

cat("\nStandard Deviation Result:\n")
print(stdev(sample_data))

cat("\nLinear Regression Result:\n")
print(linreg(sample_data, regressionLength = 10, regressionOffset = 0))

cat("\nRSI Result:\n")
print(rsi(sample_data, period = 5))

cat("\nStochastic RSI Result:\n")
print(stoch_rsi(sample_data, period = 5, k_period = 3, d_period = 3))

arr1 <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
arr2 <- c(18, 20, 22, 18, 15, 12, 10, 11, 13)

cat("\nCrossover Result:\n")
print(crossover(arr1, arr2))

cat("\nCrossunder Result:\n")
print(crossunder(arr1, arr2))
