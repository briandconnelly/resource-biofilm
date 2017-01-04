#!/usr/bin/env Rscript

source("analysis/common.R")

# Get Reaction counts at the end of simulations ---------------------------

react_all <- read_csv(
    file = "data/reactions.csv.bz2",
    col_types = list(
        Replicate = col_factor(levels = 400:429)
    )
) %>%
    filter(Resource < 90)

react_end <- react_all %>%
    get_last_update

# Which replicates made it to the end?
end_reps <- react_end %>%
    group_by(Resource) %>%
    select(Resource, Replicate)

# Plot time of first ORN and EPS completion ----------------------------------

# Note: since data are written every 100 updates, completion times are rounded
#       up to the nearest 100 updates.

firstorn <- react_all %>%
    filter(EPS > 0) %>%
    group_by(Resource, Replicate) %>%
    summarize(FirstTime = min(Update)) %>%
    mutate(Task = "ORN")

firstequ <- react_all %>%
    filter(EQU > 0) %>%
    group_by(Resource, Replicate) %>%
    summarize(FirstTime = min(Update)) %>%
    mutate(Task = "EQU")

firsttimes_raw <- bind_rows(firstorn, firstequ)
firsttimes_raw$Task <- factor(firsttimes_raw$Task, levels = c("ORN", "EQU"),
                              labels = c("Cooperative Task (OR NOT)",
                                         "Most Complex Task (EQU)"))


# Get the first times for the replicates that made it through to the end
first_times <- inner_join(firsttimes_raw, end_reps,
                          by = c("Resource", "Replicate"))

# Plot the first times for the replicates that made it through to the end
pfirst <- ggplot(data = first_times,
                 aes(x = Resource, y = FirstTime, color = Task)) +
    stat_summary(fun.data = "mean_cl_boot") +
    scale_x_continuous(trans = "log2", breaks = 2^(1:6)) +
    scale_y_log10() +
    scale_color_manual(values = c("black", "grey60")) +
    labs(x = label_resource, y = "Time to First Completion") +
    theme(aspect.ratio = 0.45)


# How many replicate populations EVER got ORN/EQU? ---------------------------

# And how many reps made it to the end for each resource level?
num_reps_end <- end_reps %>%
    group_by(Resource) %>%
    summarise(NumRepsEnd = n())

# Of the replicates that made it to the end, how many of them did the task at least once?
pop_did_task <- first_times %>%
    group_by(Task, Resource) %>%
    summarise(NumRepsTask = n()) %>%
    inner_join(num_reps_end, by = "Resource")

pprop <- ggplot(data = pop_did_task, aes(x = Resource,
                                         y = NumRepsTask / NumRepsEnd,
                                         color = Task)) +
    geom_line(alpha = 0.9) +
    geom_point(size = 2.5) +
    scale_x_continuous(trans = "log2", breaks = 2^(1:6)) +
    scale_y_continuous(limits = c(0, 1)) +
    scale_color_manual(values = c("black", "grey60")) +
    labs(x = label_resource, y = "Proportion of Populations") +
    theme(aspect.ratio = 0.45)


# Plot both -------------------------------------

ppropY <- pprop +
    theme(axis.title.x = element_blank()) +
    theme(plot.margin = margin(-30, 6, -40, 32))
pfirstY <- pfirst +
    scale_color_manual(values = c("black", "grey60"), guide = FALSE) +
    theme(axis.title.y = element_text(size = rel(0.9))) +
    theme(plot.margin = margin(0, 6, 0, 20))

pboth <- plot_grid(ppropY, pfirstY, nrow = 2, ncol = 1,
                    rel_widths = 1, rel_heights = c(1, 1.02),
                    labels = c("(a)", "(b)"), label_size = 18)

ggsave(filename = "figures/avida_reactions_ORN_EQU.pdf", plot = pboth,
       width = 7)

#system("pdfcrop --margins 1 figures/avida_reactions_ORN_EQU.pdf figures/avida_reactions_ORN_EQU.pdf")
