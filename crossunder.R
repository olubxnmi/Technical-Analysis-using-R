# Crossunder function
# BDA400 Assignment 5

crossunder <- function(arr1, arr2) {
  if (length(arr1) != length(arr2)) {
    stop("Both arrays should have the same length")
  }

  crossunder_signals <- rep("False", length(arr1))

  if (length(arr1) >= 1) {
    crossunder_signals[1] <- "False"
  }

  if (length(arr1) < 2) {
    return(crossunder_signals)
  }

  for (i in 2:length(arr1)) {
    if (is.na(arr1[i]) || is.na(arr2[i]) || is.na(arr1[i - 1]) || is.na(arr2[i - 1])) {
      crossunder_signals[i] <- "False"
    } else if (arr1[i] < arr2[i] && arr1[i - 1] >= arr2[i - 1]) {
      crossunder_signals[i] <- "True"
    } else {
      crossunder_signals[i] <- "False"
    }
  }

  return(crossunder_signals)
}
