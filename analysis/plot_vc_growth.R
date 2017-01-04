#!/usr/bin/env Rscript

source("analysis/common.R")

growthdata <- read_csv(file = "data/vc_WT_growth.csv")

vc_growplot <- ggplot(data = growthdata, aes(x = Media, y = Growth)) +
    stat_summary(fun.data = "mean_cl_boot") +
    scale_x_continuous(trans = "log2", breaks = c(0.25, 0.5, 1.0, 2.0)) +
    labs(x = label_lb_concentration, y = label_yield) +
    theme(aspect.ratio = 2 / (1 + sqrt(5)))

ggsave(filename = "figures/vc_growth_WT.pdf", plot = vc_growplot)

#system("pdfcrop --margins 1 figures/vc_growth_WT.pdf figures/vc_growth_WT.pdf")
