#### Preamble ####
# Purpose: Downloads the data from the opendatatoronto package (Gelfand 2022)
# Author: Qingyang Feng
# Date: 27 September 2024
# Contact: lingtianchenming@gmail.com
# License: MIT
# Pre-requisites: Install the opendatatoronto (Gelfand 2022) and
# tidyverse (Wickham et al. 2019) packages.



#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####
# Search for a specific package on OpenDataToronto by keyword
# ("Marriage Licence Statistics")
Motor_Collisions_packages <- search_packages(
    "Motor Vehicle Collisions involving Killed or Seriously Injured Persons")
Motor_Collisions_packages
# Retrieve a list of all resources (datasets) available within the found package
Motor_Collision_resources <- Motor_Collisions_packages %>%
  list_package_resources()
# Display the list of resources available in the "Marriage Licence Statistics"
# package
Motor_Collision_resources
Motor_Collision_statistics <- Motor_Collision_resources[2, ] %>% get_resource()
data <- Motor_Collision_statistics


#### Save data ####
write_csv(data, "inputs/data/Motor_data.csv")
