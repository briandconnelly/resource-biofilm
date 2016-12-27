library(cowplot)
library(tidyverse)
library(ggplot2bdc)

source("analysis/formatting.R")

source("analysis/theme_rescoop.R")
theme_set(theme_rescoop(base_size = 17, pmargin = 20))

get_last_update <- . %>% filter(Update == max(.$Update))

