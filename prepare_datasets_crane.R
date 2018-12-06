# create_datasets_crane.R
# 
# Author: Jonathan de Bruin
# Project: Create datasets for workshop
# Creation date: 2018-10-31
# Modification date: 2018-10-31
# 
# Description: This file is used to prepare datasets for the 
# workshop. 
#

library(tidyverse)
library(stringr)
library(writexl)

set.seed(0)

data <- read_csv('data/crane/raw/Huji_JNF_Crane_israel_GPRS.csv',
                 col_types = cols(
                   .default = col_character(),
                   `tag-local-identifier` = col_skip(),
                   `eobs:start-timestamp` = col_datetime()
                 ))

problems(data)
spec(data)

colnames(data) <- str_replace_all(colnames(data), '[^0-9A-Za-z]+', '_')
data <- data %>% 
  mutate(eobs_start_timestamp = format(
    as.POSIXct(eobs_start_timestamp), format="%Y,%d+%b"
  )
)

write_csv(data, 'data/crane/Huji_Crane_israel_GPRS.csv', na="")

# minor test
data_new <- read_csv('data/crane/Huji_Crane_israel_GPRS.csv')
spec(data_new)



library(writexl)

data_additional <- select(data, `event_id`)

data_additional$meas_1 <- rgamma(nrow(data), 2, rate=3)
data_additional$meas_2 <- rgamma(nrow(data), 1, rate=0.5)
data_additional$meas_3 <- rgamma(nrow(data), 1.5, rate=2)

write_xlsx(data_additional, 'data/crane/Huji_additional_observations.xlsx')
