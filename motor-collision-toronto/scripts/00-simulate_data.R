#### Preamble ####
# Purpose: Generate a simulated version of the motor vehicle collision in 
# Toronto
# Author: Qingyang Feng
# Date: 27 September 2024
# Contact: lingtianchenming@gmail.com
# License: MIT
# Pre-requisites: install tidyverse(Wickham et al. 2019) package


#### LOADING PACKAGE ####
library(tidyverse)
library(dplyr)

# Set seed for reproducibility
set.seed(100)

# Define parameters for simulation
num_rows <- 1000  # Adjust the number of rows as needed

# Create simulated data
simulated_data <- data.frame(
  IMPACTYPE = sample(c("Minor", "Moderate", "Severe"), num_rows, 
                     replace = TRUE),
  INJURY = sample(c("Yes", "No"), num_rows, replace = TRUE),
  ACCNUM = sample(100000:999999, num_rows, replace = TRUE),
  DATE = as.Date("2006-01-01") + sample(0:5000, num_rows, replace = TRUE),  
  # Random dates within a range
  TIME = sprintf("%02d:%02d", sample(0:23, num_rows, replace = TRUE), 
                 sample(0:59, num_rows, replace = TRUE)),
  RDSFCOND = sample(c("Dry", "Wet", "Icy", "Snowy"), num_rows, replace = TRUE)
)

# View the first few rows of the simulated data
head(simulated_data)



