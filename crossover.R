# Crossover function
# BDA400 Assignment 5

crossover <- function(arr1, arr2) {
  if (length(arr1) != length(arr2)) {
    stop("Both arrays should have the same length")
  }

  crossover_signals <- rep("None", length(arr1))

  if (length(arr1) < 2) {
    return(crossover_signals)
  }

  for (i in 2:length(arr1)) {
    if (is.na(arr1[i]) || is.na(arr2[i]) || is.na(arr1[i - 1]) || is.na(arr2[i - 1])) {
      crossover_signals[i] <- "None"
    } else if (arr1[i] > arr2[i] && arr1[i - 1] <= arr2[i - 1]) {
      crossover_signals[i] <- "Up"
    } else if (arr1[i] < arr2[i] && arr1[i - 1] >= arr2[i - 1]) {
      crossover_signals[i] <- "Down"
    } else {
      crossover_signals[i] <- "None"
    }
  }

  return(crossover_signals)
}
