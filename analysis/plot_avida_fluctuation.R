#!/usr/bin/env Rscript

source("analysis/common.R")

# Transitions at 30k and 60k
treatments <- read_csv(
    file = "data/fluctuation_treatments.csv",
    col_types = list(
        Treatment = col_factor(
            levels = c("10-40-10", "18-20-18", "20-18-20", "40-10-40")
        ),
        Resource = col_factor(levels = c(10, 18, 20, 40))
    )
) %>%
    mutate(Update = 0, Frac_Cooperators = 0) %>%
    filter(Treatment %in% c("10-40-10", "40-10-40"))

d <- read_csv(
    file = "data/fluctuation_cooppct.csv",
    col_types = list(
        Treatment = col_factor(
            levels = c("10-40-10", "18-20-18", "20-18-20", "40-10-40")
        ),
        Replicate = col_factor(levels = 0:50)
    )
) %>%
    mutate(Frac_Cooperators = Cooperators / Organisms) %>%
    filter(Treatment %in% c("10-40-10", "40-10-40"))


pFCoopPct <- ggplot(data = d, aes(x = Update / 1000, y = Frac_Cooperators)) +
    facet_grid(Treatment ~ .) +
    geom_rect(data = treatments,
              aes(xmin = Start / 1000, xmax = End / 1000,
                  ymin = -Inf, ymax = Inf,
                  fill = Resource),
              color = NA, alpha = 0.5) +
    stat_summary(fun.data = "mean_cl_boot", geom = "ribbon", color = NA,
                 alpha = 0.2) +
    stat_summary(fun.y = "mean", geom = "line") +
    geom_text(data = treatments,
              aes(label = Resource, x = (Start + ((End - Start) / 2)) / 1000),
              y = 1.0, hjust = 0.5, vjust = 1, size = 3, fontface = "italic") +
    scale_y_continuous(limits = c(0, 1), breaks = seq(0, 1, 0.25),
                       labels = c("0.0", "", "0.5", "", "1.0")) +
    scale_fill_manual(values = c("10" = "grey90", "40" = "grey60"),
                      guide = FALSE) +
    labs(x = label_time, y = label_cooppct) +
    theme(aspect.ratio = 1/4) +
    theme(strip.text = element_blank()) +
    theme(axis.text = element_text(size = rel(0.8)))

ggsave(filename = "figures/avida_fluctuation_cooppct.pdf", plot = pFCoopPct)

#system("pdfcrop --margin 1 figures/avida_fluctuation_cooppct.pdf figures/avida_fluctuation_cooppct.pdf")
