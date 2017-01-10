#!/usr/bin/env Rscript

source("analysis/common.R")
library(gganimate)

viddata <- read_csv(
    file = "data/population_spatial_r30.csv.bz2",
    col_types = list(
        Update = col_integer(),
        Row = col_integer(),
        Col = col_integer(),
        Code = col_integer(),
        Type = col_factor(levels = c("Empty", "Cooperator", "Cheater"))
    )
)

pVideoS1 <- ggplot(data = viddata,
                   aes(x = Col, y = Row, color = Type, fill = Type,
                       frame = Update)) +
    geom_point(shape = 15, size = 2) +
    scale_x_continuous(expand = c(0.01, 0.01)) +
    scale_y_continuous(expand = c(0.01, 0.01)) +
    scale_color_manual(values = cell_colors, name = NULL) +
    scale_fill_manual(values = cell_colors, name = NULL) +
    labs(title = "Update") +
    theme_bdc_lattice_population() +
    theme(aspect.ratio = 1) +
    theme(panel.border = element_rect(fill = NA, color = "grey30")) +
    theme(plot.title = element_text(color = "grey30", hjust = 0.95))

gg_animate(
    plot = pVideoS1,
    filename = "figures/avida_population_r30.mp4",
    interval = 1 / 50,
    ani.width = 640,
    ani.height = 640
)
