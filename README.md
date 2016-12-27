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

| Figure  | Data File(s)   | Analysis      | 
|:--------|:---------------|:--------------|
| [1](figures/avida_diagram.png) | N/A            | N/A           |
| [2](figures/avida_combined.pdf) | (a) [data/cooperators.csv.bz2](data/cooperators.csv.bz2); (b) [data/eps.csv.bz2](data/eps.csv.bz2); (c) [data/kills.csv.bz2](data/kills.csv.bz2); (d) [data/popsizes.csv.bz2](data/popsizes.csv.bz2), [data/popsizes_noEPS.csv.bz2](data/popsizes_noEPS.csv.bz2) | [analysis/plot_avida_combined.R](analysis/plot_avida_combined.R) |
| [3](figures/avida_population_stacks.pdf) | (a) [data/coop_cheats_r010_411.csv](data/coop_cheats_r010_411.csv); (b) [data/coop_cheats_r030_411.csv](data/coop_cheats_r030_411.csv) | [analysis/plot_avida_popstacks.R](analysis/plot_avida_popstacks.R) |
| [4](figures/avida_fluctuation_cooppct.pdf) | [data/fluctuation_treatments.csv](data/fluctuation_treatments.csv), [data/fluctuation_cooppct.csv](data/fluctuation_cooppct.csv) | [analysis/plot_avida_fluctuation.R](analysis/plot_avida_fluctuation.R) |
| [5](figures/vc_biofilm_7dWT.pdf) | [data/vc_wt_7d_biofilm.csv](data/vc_wt_7d_biofilm.csv) | [analysis/plot_vc_biofilm.R](analysis/plot_vc_biofilm.R) |
| [6](figures/vc_frac_rugose.pdf) | [data/vc_frac_rugose.csv](data/vc_frac_rugose.csv) | [analysis/plot_vc_rugose.R](analysis/plot_vc_rugose.R) |
| [7](figures/vc_evolved_combined.pdf) | (a) [data/vc_evolved_absorbance.csv](data/vc_evolved_absorbance.csv); (b) [data/vc_comp_initial.csv](data/vc_comp_initial.csv), [data/vc_comp_planktonic_24h.csv](data/vc_comp_planktonic_24h.csv), [data/vc_comp_biofilm_24h.csv](data/vc_comp_biofilm_24h.csv); (c) [data/EvolvedVibrioCholeraeBiofilmYieldsCfu2_051716.csv](data/EvolvedVibrioCholeraeBiofilmYieldsCfu2_051716.csv) | [analysis/plot_vc_evolved_all.R](analysis/plot_vc_evolved_all.R) |
| [S1](figures/population-0092900.pdf) | TODO           | TODO          |
| [S2](figures/avida_cooperators_trajectories.pdf) | [data/cooperators.csv.bz2](data/cooperators.csv.bz2) | [analysis/plot_avida_coop_trajectories.R](analysis/plot_avida_coop_trajectories.R) |
| [S3](figures/avida_reactions_ORN_EQU.pdf) | TODO           | TODO          |
| [S4](figures/vc_growth_WT.pdf) | [data/vc_WT_growth.csv](data/vc_WT_growth.csv) | [analysis/plot_vc_growth.R](analysis/plot_vc_growth.R) |


## License

Data: [Creative Commons Attribution License (CC-BY)](https://creativecommons.org/licenses/by/4.0/)
Code: [MIT](https://opensource.org/licenses/MIT)
Avida: [GNU Lesser General Public License](https://www.gnu.org/licenses/lgpl.html)
