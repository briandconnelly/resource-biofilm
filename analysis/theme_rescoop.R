theme_rescoop <- function(base_size = 12, base_family = "",
                              grid.x = FALSE, grid.y = FALSE,
                              gridmin.x = grid.x, gridmin.y = grid.y,
                              ticks.x = TRUE, ticks.y = TRUE,
                              pmargin = base_size / 2) {
        half_line <- base_size / 2
        quarter_line <- base_size / 4
        line_size <- 0.5
        linegrey <- "grey70"
        medgrey <- "grey50"
        
        theme(
            line = element_line(colour = linegrey, size = line_size,
                                linetype = 1, lineend = "square"),
            rect = element_rect(fill = "white", colour = linegrey,
                                size = line_size, linetype = 1),
            text = element_text(family = base_family, face = "plain",
                                colour = "black", size = base_size,
                                lineheight = 0.9, hjust = 0.5, vjust = 0.5,
                                angle = 0, margin = margin(), debug = FALSE),
            
            axis.line = element_blank(),
            axis.text = element_text(size = rel(0.8), colour = medgrey),
            axis.text.x = element_text(
                margin = margin(t = 0.8 * quarter_line),
                vjust = 1
            ),
            axis.text.y = element_text(
                margin = margin(r = 0.8 * quarter_line),
                hjust = 1
            ),
            axis.ticks = element_line(size = line_size / 2),
            axis.ticks.x = element_line(
                size = ifelse(ticks.x, line_size / 2, 0)
            ),
            axis.ticks.y = element_line(
                size = ifelse(ticks.y, line_size / 2, 0)
            ),
            axis.ticks.length = unit(quarter_line, units = "pt"),
            axis.title.x = element_text(
                margin = margin(t = 0.8 * half_line, b = 0.8 * quarter_line)
            ),
            axis.title.y = element_text(
                angle = 90,
                margin = margin(r = 0.8 * half_line, l = 0.8 * quarter_line),
            ),
            
            legend.background = element_rect(fill = "transparent", colour = NA),
            legend.margin = unit(0, units = "cm"),
            legend.key = element_rect(fill = "transparent", colour = NA),
            legend.key.size = unit(0.5, units = "lines"),
            legend.key.height = unit(0.5, units = "lines"),
            legend.key.width = unit(1.0, units = "lines"),
            legend.text = element_text(size = rel(0.7), hjust = 0, vjust = 0.5,
                                       color = medgrey),
            legend.text.align = NULL,
            legend.title = element_text(size = rel(0.7), face = "bold",
                                        vjust = 0.5),
            legend.title.align = 1,
            legend.position = "top",
            #legend.position = c(0.5, 1.0),
            legend.direction = "horizontal",
            legend.justification = "center",
            #legend.justification = c(0.5, 1.2),
            legend.box = "vertical",
            
            panel.background = element_rect(fill = "white", colour = linegrey),
            panel.border = element_blank(),
            panel.grid.major = element_line(colour = NA, size = line_size / 5),
            panel.grid.major.x = element_line(
                colour = ifelse(grid.x, linegrey, NA)
            ),
            panel.grid.major.y = element_line(
                colour = ifelse(grid.y, linegrey, NA)
            ),
            panel.grid.minor = element_line(colour = NA, size = line_size / 10),
            panel.grid.minor.x = element_line(
                colour = ifelse(gridmin.x, linegrey, NA)
            ),
            panel.grid.minor.y = element_line(
                colour = ifelse(gridmin.y, linegrey, NA)
            ),
            panel.margin = unit(quarter_line, units = "pt"),
            panel.margin.x = NULL,
            panel.margin.y = NULL,
            panel.ontop = FALSE,
            
            strip.background = element_blank(),
            strip.text = element_text(size = rel(0.6)),
            strip.text.x = element_text(
                margin = margin(t = quarter_line, b = quarter_line)
            ),
            strip.text.y = element_text(
                angle = -90,
                margin = margin(l = quarter_line, r = quarter_line)
            ),
            strip.switch.pad.grid = unit(0.1, units = "cm"),
            strip.switch.pad.wrap = unit(0.1, units = "cm"),
            
            plot.background = element_rect(colour = "transparent"),
            plot.title = element_text(
                size = rel(1.2),
                face = "bold",
                margin = margin(b = half_line * 1.2)
            ),
            plot.margin = margin(pmargin, pmargin, pmargin, pmargin),
            
            complete = TRUE
        )
}

