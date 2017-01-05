library(cowplot)
library(tidyverse)
library(ggplot2bdc)

source("analysis/formatting.R")

theme_set(theme_bdc_grey(base_size = 17, pmargin = 20))

get_last_update <- . %>% filter(Update == max(.$Update))

