# Avida plots -----------------------------------------------------------------
label_time <- "Time (Thousands of Updates)"
label_abundance <- "Abundance"
label_resource <- "Resource Level"
label_public_good <- "Public Good"
label_kills <- "Fraction of Organisms Killed"
label_survive <- "Fraction Surviving"
label_cooppct <- "Cooperator Proportion"
label_coop_react <- "Proportion of Cooperative Task"
label_react_count <- "Task Completions"
label_react_count_norm <- "Normalized Task Completions"
label_occupied_cells <- "Fraction of Occupied Cells"

struct_labels <- c("TRUE" = "Structured", "FALSE" = "Well Mixed")
struct_name <- "Population Structure"

eps_name <- "Public Good Produced"
eps_labels <- c("TRUE" = "Yes", "FALSE" = "No")
eps_colors <- c("TRUE" = "black", "FALSE" = "grey60")
eps_shapes <- c("TRUE" = 19, "FALSE" = 1)

type_name <- "Type"
type_colors <- c("Cooperator" = "black", "Cheater" = "grey60")
cell_colors <- c("Empty" = "white", "Cooperator" = "black", "Cheater" = "grey60")

# Cholera plots ---------------------------------------------------------------
label_loglb_concentration <- expression(paste(Log[2], " LB Concentration"))
label_lb_concentration <- "LB Concentration"
label_biofilm <- expression(paste("Biofilm Yield (", OD[595], ")"))
label_biofilm_cfu <- "Biofilm Yield (CFU/mL)"
label_yield <- expression(paste("Yield After 24 Hours (", OD[595], ")"))
label_rugosepct <- "Proportion of Biofilm Formers"
label_rugosepct_initial <- "Initial Proportion of Biofilm Formers"
label_rel_fitness <- "Relative Fitness of Biofilm Former"
label_growth_environment <- "Environment"
label_treatment <- "Population Composition"

strain_name <- "Strain"
strain_labels <- c("7d" = "Evolved", "WT" = "Ancestor (WT)")
strain_shapes <- c("7d" = 19, "WT" = 1)
strain_colors <- c("7d" = "black", "WT" = "grey60")
