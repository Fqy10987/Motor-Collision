#### Preamble ####
# Purpose: Cleans the raw Toronto healthcare outbreaks dataset obtained in
# "01-download_data.R".
# Author: Qingyang Feng
# Date: 27 September 2024
# Contact: lingtianchenming@gmail.com
# License: MIT
# Pre-requisites: Run the file "01-download_data.R" and install tidyverse
# (Wickham et al. 2019) package.


#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Clean data ####
# Load the dataset
data <- read.csv("inputs/data/Motor_data.csv") # Adjust the path to your file

# Select relevant columns
cleaned_data <- data %>%
  select(IMPACTYPE, INJURY, ACCNUM, DATE, TIME, RDSFCOND) %>%
  filter(
    !is.na(IMPACTYPE), !is.na(INJURY), !is.na(ACCNUM),
    !is.na(DATE), !is.na(TIME), !is.na(RDSFCOND)
  )
# Remove rows with missing values

# Optionally, convert DATE to Date format and TIME to appropriate format
cleaned_data <- cleaned_data %>%
  mutate(
    DATE = as.Date(DATE, format = "%Y-%m-%d"), # Adjust the format if necessary
    TIME = as.POSIXct(TIME, format = "%H:%M") # Ensure TIME is in proper format
  )

# View the first few rows of the cleaned data
head(cleaned_data)


#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
