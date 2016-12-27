#!/usr/bin/env Rscript

source("analysis/common.R")

r10data <- read_csv("data/coop_cheats_r010_411.csv")
r10data$Resource <- 10
r30data <- read_csv("data/coop_cheats_r030_411.csv")
r30data$Resource <- 30

alldata <- bind_rows(r10data, r30data)
alldata$Type <- factor(alldata$Type, levels = c("Cooperator", "Cheater"))

res_labels <- c("10" = "(a) Resource Level 10", "30" = "(b) Resource Level 30")

p_stack <- ggplot(data = alldata,
                  aes(x = Update / 1000, y = Abundance, color = Type,
                      fill = Type)) +
    geom_area(position = "stack") +
    facet_grid(~ Resource, labeller = labeller(Resource = res_labels)) +
    scale_y_continuous(lim = c(0, 10000)) +
    scale_color_manual(values = type_colors, name = type_name) +
    scale_fill_manual(values = type_colors, name = type_name) +
    labs(x = label_time, y = label_abundance)

ggsave(filename = "figures/avida_population_stacks.pdf",
       plot = gg_rescale_golden(plot = p_stack))
