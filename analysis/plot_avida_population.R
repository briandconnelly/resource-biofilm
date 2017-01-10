#!/usr/bin/env Rscript

source("analysis/common.R")

dspatialpop <- read_csv(
    file = "data/population_spatial_r30.csv.bz2",
    col_types = list(
        Update = col_integer(),
        Row = col_integer(),
        Col = col_integer(),
        Code = col_integer(),
        Type = col_factor(levels = c("Empty", "Cooperator", "Cheater"))
    )
) %>%
    filter(Update == 49685)

pspatialpop <- ggplot(data = dspatialpop,
                   aes(x = Col, y = Row, color = Type, fill = Type)) +
    geom_point(shape = 15, size = 1) +
    scale_x_continuous(expand = c(0.01, 0.01)) +
    scale_y_continuous(expand = c(0.01, 0.01)) +
    scale_color_manual(values = cell_colors, guide = FALSE) +
    scale_fill_manual(values = cell_colors, guide = FALSE) +
    theme_bdc_lattice_population() +
    theme(aspect.ratio = 1) +
    theme(panel.border = element_rect(fill = NA, color = "grey30"))

ggsave(filename = "figures/avida_population_r30_49685.pdf", plot = pspatialpop)
trim_whitespace(filename = "figures/avida_population_r30_49685.pdf",
                margins = 1)
