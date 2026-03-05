# Cost-Effectiveness Utilities in R

# Function for Incremental Cost-Effectiveness Ratio (ICER)
icer_calculation <- function(cost_treatment1, cost_treatment2, effect_treatment1, effect_treatment2) {
  incremental_cost <- cost_treatment1 - cost_treatment2
  incremental_effect <- effect_treatment1 - effect_treatment2
  if (incremental_effect == 0) {
    return(NA)  # To handle division by zero
  } else {
    icer <- incremental_cost / incremental_effect
    return(icer)
  }
}

# Function for Sensitivity Analysis
sensitivity_analysis <- function(costs, effects, icers, variability) {
  # costs, effects, and icers are vectors of the same length
  results <- data.frame(
    Cost = costs,
    Effect = effects,
    ICER = icers
  )
  results <- results + variability * rnorm(nrow(results))
  return(results)
}

# Example usage
# cost_effectiveness_example <- icer_calculation(2000, 1500, 0.8, 0.5)

# Perform Sensitivity Analysis
# sensitivity_results <- sensitivity_analysis(c(2000, 1500), c(0.8, 0.5), c(icer_calculation(2000, 1500, 0.8, 0.5)), 0.1)