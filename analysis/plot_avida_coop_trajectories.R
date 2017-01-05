#!/usr/bin/env Rscript

source("analysis/common.R")

coopdata <- read_csv(
    file = "data/cooperators.csv.bz2",
    col_types = list(
         Replicate = col_factor(levels = 400:429)
    )
) %>%
    filter(Resource < 90)

ptraj <- ggplot(data = coopdata,
                aes(x = Update / 1000, y = Frac_Cooperators,
                    color = Replicate)) +
    facet_wrap(~ Resource, ncol = 3) +
    geom_line(size = 0.1) +
    stat_summary(fun.y = "mean", geom = "line", color = "blue") +
    scale_y_continuous(limits = c(0, 1), breaks = c(0, 0.5, 1)) +
    scale_color_grey(guide = FALSE) +
    labs(x = label_time, y = label_cooppct) +
    theme(axis.text.x = element_text(size = rel(0.7))) +
    theme(axis.text.y = element_text(size = rel(0.6))) +
    theme(axis.ticks.y = element_line(size = 0.1)) +
    theme(strip.text = element_text(size = rel(0.5))) +
    theme(strip.text.y = element_text(angle = 0))

ggsave(filename = "figures/avida_cooperators_trajectories.pdf", plot = ptraj)
trim_whitespace(filename = "figures/avida_cooperators_trajectories.pdf",
                margins = 1)
