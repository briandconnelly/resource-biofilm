#!/usr/bin/env Rscript

source("analysis/common.R")


# Plot of Cooperator Proportion -------------------------------------------

coopdata <- read_csv("data/cooperators.csv.bz2") %>%
    get_last_update %>%
    filter(Resource < 90)

coopplot <- ggplot(data = coopdata,
                   aes(x = Resource, y = Frac_Cooperators)) +
    stat_summary(fun.data = "mean_cl_boot") +
    scale_x_continuous(trans = "log2", breaks = 2^(1:7)) +
    scale_y_continuous(limits = c(0, 1), breaks = c(0, 0.25, 0.5, 0.75, 1),
                       labels = c("0", "", "0.5", "", "1.0")) +
    labs(x = label_resource, y = "Cooperator\nProportion") +
    theme(axis.title.x = element_blank(), axis.text.x = element_blank()) +
    theme(plot.margin = margin(2, 6, 2, 20))



# Plot of EPS Level -------------------------------------------------------

epsdata <- read_csv("data/eps.csv.bz2") %>%
    get_last_update %>%
    filter(Resource < 90)

epsplot <- ggplot(data = epsdata, aes(x = Resource, y = Level)) +
    geom_hline(yintercept = 3, linetype = "dotted", size = 0.5,
               color = "grey70") +
    stat_summary(fun.data = "mean_cl_boot") +
    scale_y_continuous(breaks = c(0, 3, 6, 9)) +
    scale_x_continuous(trans = "log2", breaks = 2^(1:7)) +
    labs(x = label_resource, y = label_public_good) +
    theme(axis.title.x = element_blank(), axis.text.x = element_blank()) +
    theme(plot.margin = margin(0, 6, 2, 20))


# Plot of Kill Survival ---------------------------------------------------

killdata <- read_csv("data/kills.csv.bz2") %>%
    filter(Resource < 90) %>%
    get_last_update %>%
    mutate(Frac_Survived = 1 - Frac_Killed)

killplot <- ggplot(data = killdata, aes(x = Resource, y = Frac_Survived)) +
    stat_summary(fun.data = "mean_cl_boot") +
    scale_x_continuous(trans = "log2", breaks = 2^(1:7)) +
    scale_y_continuous(limits = c(0, 1), breaks = c(0, 0.25, 0.5, 0.75, 1),
                       labels = c("0", "", "0.5", "", "1.0")) +
    labs(x = label_resource, y = "Fraction\nSurviving") +
    theme(axis.title.x = element_blank(), axis.text.x = element_blank()) +
    theme(plot.margin = margin(0, 6, 2, 20))



# Plot of Population Size -------------------------------------------------

data_eps <- read_csv("data/popsizes.csv.bz2")
data_eps$EPS <- TRUE
data_noEPS <- read_csv("data/popsizes_noEPS.csv.bz2")
data_noEPS$EPS <- FALSE

popsizedata <- bind_rows(data_eps, data_noEPS) %>%
    get_last_update %>%
    filter(Resource < 90)

# Populations are a 100x100 lattice, or 10000 cells
num_cells <- 10000

sizeplot <- ggplot(data = popsizedata,
                   aes(x = Resource, y = Organisms / num_cells, shape = EPS,
                       color = EPS)) +
    stat_summary(fun.data = "mean_cl_boot") +
    scale_x_continuous(trans = "log2", breaks = 2^(1:7)) +
    scale_y_continuous(limits = c(NA, 1)) +
    scale_shape_manual(breaks = c(TRUE, FALSE), values = eps_shapes,
                       labels = eps_labels, name = eps_name) +
    scale_color_manual(breaks = c(TRUE, FALSE), values = eps_colors,
                       labels = eps_labels, name = eps_name) +
    labs(x = label_resource, y = "Fraction of\nOccupied Cells") +
    theme(legend.position = c(0.02, 1.0)) +
    theme(legend.justification = c(0, 1.2)) +
    theme(plot.margin = margin(0, 6, 6, 20))

# Create Combined plot ----------------------------------------------------

pall <- plot_grid(coopplot, epsplot, killplot, sizeplot,
                  align = "v", nrow = 4,
                  rel_heights = c(1, 1, 1, 1.3), rel_widths = 3,
                  labels = c("(a)", "(b)", "(c)", "(d)"), label_size = 18,
                  hjust = 0.0)
ggsave(filename = "figures/avida_combined.pdf", plot = pall, width = 7.0)

#system("pdfcrop --margins 1 figures/avida_combined.pdf figures/avida_combined.pdf")
