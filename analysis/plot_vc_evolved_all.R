#!/usr/bin/env Rscript

source("analysis/common.R")


# Plot biofilm formation --------------------------------------------------

absorbance <- read_csv(
    file = "data/vc_evolved_absorbance.csv",
    col_types = list(
        Treatment = col_factor(levels = c("Smooth", "Rugose", "Mixed"))
    )
)

pbiofilm <- ggplot(data = absorbance, aes(x = Treatment, y = A595)) +
    stat_summary(fun.data = "mean_cl_boot") +
    labs(x = label_treatment, y = label_biofilm) +
    theme(plot.margin = margin(6, 18, 6, 6))


# Plot relative fitness of rugose type ------------------------------------

initial <- read_csv(
    file = "data/vc_comp_initial.csv",
    col_types = list(Replicate = col_factor(levels = LETTERS[1:6]))
) %>%
    mutate(
        SmoothCFUmL = SmoothCFU / (DilutionFactor * mLPlated),
        RugoseCFUmL = RugoseCFU / (DilutionFactor * mLPlated),
        PropRugose = RugoseCFUmL / (RugoseCFUmL + SmoothCFUmL)
    )

planktonic24 <- read_csv(
    file = "data/vc_comp_planktonic_24h.csv",
    col_types = list(Replicate = col_factor(levels = LETTERS[1:6]))
) %>%
    mutate(Treatment = "Planktonic")

biofilm24 <- read_csv(
    file = "data/vc_comp_biofilm_24h.csv",
    col_types = list(Replicate = col_factor(levels = LETTERS[1:6]))
) %>%
    mutate(Treatment = "Biofilm")

all24 <- bind_rows(planktonic24, biofilm24) %>%
    mutate(
        SmoothCFUmL = SmoothCFU / (DilutionFactor * mLPlated),
        RugoseCFUmL = RugoseCFU / (DilutionFactor * mLPlated),
        PropRugose = RugoseCFUmL / (RugoseCFUmL + SmoothCFUmL)
    )

all24$Treatment <- factor(all24$Treatment, levels = c("Planktonic", "Biofilm"))


# Calculate relative fitness of the Rugose type. Here, we estimate relative
# fitness using the increase in the proportion of Rugose CFUs.
comp <- inner_join(x = initial, y = all24, by = "Replicate") %>%
    mutate(
        RelativeFitness = (PropRugose.y * (1 - PropRugose.x)) / (PropRugose.x * (1 - PropRugose.y))
    )


# Make the plot of relative fitness in the two environments -------------------

pcomp <- ggplot(data = comp, aes(x = Treatment, y = RelativeFitness)) +
    geom_hline(yintercept = 1, linetype = "dotted", color = "grey70",
               size = 0.5) +
    stat_summary(fun.data = "mean_cl_boot") +
    scale_y_log10() +
    labs(x = label_growth_environment, y = label_rel_fitness) +
    theme(plot.margin = margin(6, 18, 6, 6))


# Plot CFU/mL of Types in Biofilms -------------------------------------

biofilm_cfu <- read_csv(
    file = "data/EvolvedVibrioCholeraeBiofilmYieldsCfu2_051716.csv",
    col_types = list(
        Treatment = col_factor(levels = c("Rugose", "Smooth", "Mix")),
        Type = col_factor(levels = c("Rugose", "Smooth", "Total"))
    )
) %>%
    select(-TreatNum, -SampleNumber) %>%
    filter(Type != "Total", CfuMl > 0) %>%
    mutate(
        PopComp = (Treatment != "Mix"),
        CFUmL = 10^CfuMl
    ) %>%
    select(-CfuMl)

biofilm_cfu$PopComp <- factor(biofilm_cfu$PopComp, levels = c("TRUE", "FALSE"),
                              labels = c("Alone", "Mixed"))

pBCFU <- ggplot(data = biofilm_cfu,
                aes(x = PopComp, y = CFUmL, group = Type, color = Type,
                    shape = Type)) +
    stat_summary(fun.data = "mean_cl_boot") +
    stat_summary(fun.y = "mean", geom = "line") +
    scale_y_continuous(trans = "log10",  breaks = c(1e3, 1e4, 1e5, 1e6, 1e7),
                       labels = scales::trans_format("log10", scales::math_format(10^.x))) +
    scale_color_manual(values = c("Rugose" = "black", "Smooth" = "grey60")) +
    scale_shape_manual(values = c("Rugose" = 19, "Smooth" = 1)) +
    labs(x = label_treatment, y = label_biofilm_cfu) +
    theme(plot.margin = margin(6, 6, 6, 6))

# Plot everything together ------------------------------------------------

pall <- plot_grid(pbiofilm, pcomp, pBCFU, align = "h", nrow = 1, ncol = 3,
                  rel_widths = 1, rel_heights = 1,
                  labels = c("(a)", "(b)", "(c)"), label_size = 18, hjust = 0.0)

ggsave(filename = "figures/vc_evolved_combined.pdf", plot = pall,
       width = 10, height = 6)
trim_whitespace(filename = "figures/vc_evolved_combined.pdf", margins = 1)
