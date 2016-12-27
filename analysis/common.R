library(cowplot)
library(tidyverse)
library(ggplot2bdc)

# TODO remove these
#library(cowplot)
#library(dplyr)
#library(magrittr)
#library(ggplot2)
#library(ggplot2bdc)
#library(scales)

source("analysis/formatting.R")

source("analysis/theme_rescoop.R")
theme_set(theme_rescoop(base_size = 17, pmargin = 20))

get_last_update <- . %>% filter(Update == max(.$Update))

