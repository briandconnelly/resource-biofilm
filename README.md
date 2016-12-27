# Materials for Resource Abundance and the Critical Transition to Cooperation

[![Project Status: Inactive - The project has reached a stable, usable state but is no longer being actively developed; support/maintenance will be provided as time allows.](http://www.repostatus.org/badges/latest/inactive.svg)](http://www.repostatus.org/#inactive)


## Contents

These subdirectories may contain additional information:

* [analysis](analysis) - Scripts for analyzing and plotting [result data](data)
* [avida](avida) - Source code for Avida 2.12.4
* [configuration](configuration) - Configuration files for reported simulations
* [data](data) - Result data sets
* [figures](figures) - Figures


## Contents by Figure

| Figure  | Data File(s)   | Analysis      | Image       |
|:--------|:---------------|:--------------|:------------|
| 1       | N/A            | N/A           | [figures/avida_diagram.png](figures/avida_diagram.png) |
| 2       | (a) [data/cooperators.csv.bz2](data/cooperators.csv.bz2); (b) [data/eps.csv.bz2](data/eps.csv.bz2); (c) [data/kills.csv.bz2](data/kills.csv.bz2); (d) [data/popsizes.csv.bz2](data/popsizes.csv.bz2), [data/popsizes_noEPS.csv.bz2](data/popsizes_noEPS.csv.bz2) | [analysis/plot_avida_combined.R](analysis/plot_avida_combined.R) | [figures/avida_combined.pdf](figures/avida_combined.pdf) |
| 3       | (a) [data/coop_cheats_r010_411.csv](data/coop_cheats_r010_411.csv); (b) [data/coop_cheats_r030_411.csv](data/coop_cheats_r030_411.csv) | [analysis/plot_avida_popstacks.R](analysis/plot_avida_popstacks.R) | [figures/avida_population_stacks.pdf](figures/avida_population_stacks.pdf) |
| 4       | [data/fluctuation_treatments.csv](data/fluctuation_treatments.csv), [data/fluctuation_cooppct.csv](data/fluctuation_cooppct.csv) | [analysis/plot_avida_fluctuation.R](analysis/plot_avida_fluctuation.R) | [figures/avida_fluctuation_cooppct.pdf](figures/avida_fluctuation_cooppct.pdf) |
| 5       | [data/vc_wt_7d_biofilm.csv](data/vc_wt_7d_biofilm.csv) | [analysis/plot_vc_biofilm.R](analysis/plot_vc_biofilm.R) | [figures/vc_biofilm_7dWT.pdf](figures/vc_biofilm_7dWT.pdf) |
| 6       | [data/vc_frac_rugose.csv](data/vc_frac_rugose.csv) | [analysis/plot_vc_rugose.R](analysis/plot_vc_rugose.R) | [figures/vc_frac_rugose.pdf](figures/vc_frac_rugose.pdf), inset: [figures/rugose_smooth.png](figures/rugose_smooth.png) |
| 7       | (a) [data/vc_evolved_absorbance.csv](data/vc_evolved_absorbance.csv); (b) [data/vc_comp_initial.csv](data/vc_comp_initial.csv), [data/vc_comp_planktonic_24h.csv](data/vc_comp_planktonic_24h.csv), [data/vc_comp_biofilm_24h.csv](data/vc_comp_biofilm_24h.csv); (c) [data/EvolvedVibrioCholeraeBiofilmYieldsCfu2_051716.csv](data/EvolvedVibrioCholeraeBiofilmYieldsCfu2_051716.csv) | [analysis/plot_vc_evolved_all.R](analysis/plot_vc_evolved_all.R) | [figures/vc_evolved_combined.pdf](figures/vc_evolved_combined.pdf) |
| S1      | TODO           | TODO          | [figures/population-0092900.pdf](figures/population-0092900.pdf) |
| S2      | TODO           | TODO          | [figures/avida_cooperators_trajectories.pdf](figures/avida_cooperators_trajectories.pdf) |
| S3      | TODO           | TODO          | [figures/avida_reactions_ORN_EQU.pdf](figures/avida_reactions_ORN_EQU.pdf) |
| S4      | TODO           | TODO          | [figures/vc_growth_WT.pdf](figures/vc_growth_WT.pdf) |


## License

Data: [Creative Commons Attribution License (CC-BY)](https://creativecommons.org/licenses/by/4.0/)
Code: [MIT](https://opensource.org/licenses/MIT)
Avida: [GNU Lesser General Public License](https://www.gnu.org/licenses/lgpl.html)
