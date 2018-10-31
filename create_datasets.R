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


# ------------------------------------------------------------------------\
#     Split pizza dataset from kaggle into two pieces. 
# ------------------------------------------------------------------------\

data_pizza <- read_csv(file.path("data", "pizza", "raw", "8358_1.csv"))

restaurants <- data_pizza %>% 
  select(-starts_with("menu"), menuPageURL) %>% 
  distinct()

menus <- data_pizza %>% select(starts_with("menu"), -menuPageURL)

restaurants %>% write_csv(file.path("data", "pizza", "restaurants.csv"))
menus %>% write_delim(file.path("data", "pizza", "menus.csv"), delim='\t')
