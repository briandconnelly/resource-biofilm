#!/usr/bin/env Rscript

source("analysis/common.R")

vcepsdata <- read_csv(
    file = "data/vc_wt_7d_biofilm.csv",
    comment = "#",
    col_types = list(Strain = col_factor(levels = c("7d", "WT")))
)

vc_epsplot <- ggplot(data = vcepsdata,
                     aes(x = Media, y = Biofilm, shape = Strain,
                         color = Strain)) +
    stat_summary(fun.data = "mean_cl_boot") +
    scale_x_continuous(trans = "log2", breaks = c(0.25, 0.5, 1.0, 2.0)) +
    scale_shape_manual(values = strain_shapes, labels = strain_labels,
                       name = strain_name) +
    scale_color_manual(values = strain_colors,
                       labels = strain_labels, name = strain_name) +
    labs(x = label_lb_concentration, y = label_biofilm) +
    theme(aspect.ratio = 2 / (1 + sqrt(5)))

ggsave(filename = "figures/vc_biofilm_7dWT.pdf", plot = vc_epsplot)

#system("pdfcrop --margin 1 figures/vc_biofilm_7dWT.pdf figures/vc_biofilm_7dWT.pdf")
