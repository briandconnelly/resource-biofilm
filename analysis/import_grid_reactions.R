# This script demonstrates how to parse grid_reactions.T.dat files, which
# were used to determine cooperator frequencies

library(tidyverse)
library(stringr)

task_mask <- 2^3    # See if the organism completed the 4th task (OR NOT)

# read_grid_reactions parses a grid_reactions.T.dat file, producing a data frame
# with columns Update, Row, Col, Code, and Type (one of Empty, Cooperator,
# Cheater). Code represents an organism's phenotype, with the ith bit
# indicating whether or not that organism has completed the ith task (0-based).
read_grid_reactions <- function(file, coop_mask = 8) {
    is_cooperator <- function(x, coop_mask) {
        vapply(x, function(x) bitwAnd(x, coop_mask) == coop_mask, NA)
    }
    
    read_delim(file = file , delim = " ", col_names = FALSE) %>%
        select(-X101) %>%
        mutate(Row = 1:100) %>%
        gather(key = Col, value = Code, -Row) %>%
        mutate(Col = as.integer(substr(Col, 2, 5))) %>%
        mutate(
            Type = parse_factor(
                case_when(
                    .$Code == -1 ~ "Empty",
                    is_cooperator(.$Code, task_mask) ~ "Cooperator",
                    TRUE ~ "Cheater"
                ),
                levels = c("Empty", "Cooperator", "Cheater")
            ),
            Update = as.integer(str_match(file, pattern = "grid_reactions.(\\d+).dat")[,2])
        ) %>%
        select(Update, Row, Col, Code, Type)
}


# ------------------------------------------------------------------------------

# Read grid_reactions files for updates 47000-49999 from the current directory
gridfiles <- dir(path = ".", pattern = "^grid_reactions.[4][7-9][0-9]{3}.dat$",
                 full.names = TRUE)

griddata <- lapply(gridfiles, function(f) read_grid_reactions(f)) %>%
    reduce(bind_rows) %>%
    arrange(Update, Row, Col)


# Plot cooperator proportion over time -----------------------------------------

# Look at the abundances of each type over time.
popdata <- griddata %>%
    group_by(Update) %>%
    count(Type) %>%
    spread(key = Type, value = n) %>%
    mutate(PropCooperators = Cooperator / (Cooperator + Cheater))
