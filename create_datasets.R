# create_datasets.R
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
library(zipcode)
library(writexl)

# ------------------------------------------------------------------------\
#     Split pizza dataset from kaggle into two pieces. 
# ------------------------------------------------------------------------\

# read file
data_pizza <- read_csv(file.path("data", "pizza", "raw", "8358_1.csv"))

# prepare restaurants dataset
restaurants <- data_pizza %>% 
  select(-starts_with("menu"), menuPageURL, -keys, -province) %>% 
  distinct() %>% 
  separate(postalCode,
           into = c("zipcode", "zipcode_junk")) %>% 
  select(-zipcode_junk) %>% 
  mutate(zipcode = str_pad(zipcode, width = 5, pad = "0")) %>% 
  left_join(select(zipcode, zip, state), by=c("zipcode"="zip"))

restaurants[c(1:4, length(restaurants), 5:(length(restaurants)-1))]

# prepare menus dataset
menus <- data_pizza %>% 
  select(id, starts_with("menu"), -menuPageURL) %>% 
  mutate(menus.dateSeen = substr(menus.dateSeen, 1, 20)) %>% 
  mutate(menus.dateSeen = format(as.POSIXct(menus.dateSeen), format="%Y,%d+%b"))

# write files
restaurants %>% write_csv(file.path("data", "pizza", "restaurants.csv"))
restaurants %>% write_xlsx(file.path("data", "pizza", "restaurants.xlsx"))

menus %>% write_csv(file.path("data", "pizza", "menus.csv"))
menus %>% write_xlsx(file.path("data", "pizza", "menus.xlsx"))
