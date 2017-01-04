#!/usr/bin/env Rscript

source("analysis/common.R")

library(png)
library(grid)

rugosedata <- read_csv(file = "data/vc_frac_rugose.csv")

img <- readPNG("figures/rugose_smooth.png")
g <- rasterGrob(img, interpolate = TRUE, width = 0.3)

vc_rugoseplot <- ggplot(data = rugosedata, aes(x = Media, y = Frac_Rugose)) +
    stat_summary(fun.data = "mean_cl_boot") +
    scale_y_continuous(limits = c(0, 1)) +
    scale_x_continuous(trans = "log2", breaks = c(0.25, 0.5, 1.0, 2.0)) +
    labs(x = label_lb_concentration, y = label_rugosepct) +
    annotation_custom(grob = g, xmin = -3, xmax = 0, ymin = 0.5, ymax = 1.2) +
    theme(aspect.ratio = 2 / (1 + sqrt(5)))

ggsave(filename = "figures/vc_frac_rugose.pdf", plot = vc_rugoseplot)

#system("pdfcrop --margin 1 figures/vc_frac_rugose.pdf figures/vc_frac_rugose.pdf")
