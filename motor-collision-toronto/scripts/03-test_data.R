#### Preamble ####
# Purpose: Runs tests on the cleaned dataset and simulate dataset to check the
# validity
# Author: Qingyang Feng
# Date: 27 September 2024
# Contact: lingtianchenming@gmail.com
# License: MIT
# Pre-requisites: Run the files "00-simulate_data", "01-download_data.R" and
# "02-data_cleaning.R", and install lubridate package.


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(lubridate) # Load lubridate for date handling

#### Test data ####
# Load the cleaned data
cleaned_data <- read.csv("outputs/data/analysis_data.csv")
# Adjust the path to your cleaned data

# Assuming simulated_data is already created

# Convert DATE column to Date type for both datasets
simulated_data$DATE <- as.Date(simulated_data$DATE)
cleaned_data$DATE <- as.Date(cleaned_data$DATE)

# Check conditions for simulated data
simulated_conditions_met <- all(
  year(simulated_data$DATE) >= 2005 &
    year(simulated_data$DATE) <= 2023 &
    simulated_data$ACCNUM > 0
)

# Check conditions for cleaned data
cleaned_conditions_met <- all(
  year(cleaned_data$DATE) >= 2005 &
    year(cleaned_data$DATE) <= 2023 &
    cleaned_data$ACCNUM > 0
)

# Check if IMPACTYPE, RDSFCOND, INJURY are character in both datasets
simulated_check_character <- all(sapply(
  simulated_data[c("IMPACTYPE", "RDSFCOND", "INJURY")], class
) == "character")
cleaned_check_character <- all(sapply(
  cleaned_data[c("IMPACTYPE", "RDSFCOND", "INJURY")], class
) == "character")

# Final output
simulated_output <- simulated_conditions_met && simulated_check_character
cleaned_output <- cleaned_conditions_met && cleaned_check_character

# Print results directly
simulated_output
cleaned_output
