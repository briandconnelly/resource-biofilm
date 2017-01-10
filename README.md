# Materials for *Resource Abundance and the Critical Transition to Cooperation*

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.236468.svg)](https://doi.org/10.5281/zenodo.236468)
[![DOI](https://img.shields.io/badge/Paper-10.1111%2Fjeb.13039-blue.svg)](https://dx.doi.org/10.1111/jeb.13039)

This repository contains data, configuration files, and analysis scripts related to *[Resource Abundance and the Critical Transition to Cooperation](https://dx.doi.org/10.1111/jeb.13039)*.
To ensure reproducibility, [Avida](http://avida.devosoft.org) version 2.12.4, which was used for this work, is also included.
Protocols used for the microbial experiments are described in the paper.


## Contents

* [analysis](analysis) - Scripts for analyzing and plotting result data
* [avida](avida) - Source code for Avida 2.12.4
* [configuration](configuration) - Configuration files for reported simulations
* [data](data) - Result data sets
* [figures](figures) - Figures


## Contents by Figure

| Figure  | Data File(s)   | Analysis      | 
|:--------|:---------------|:--------------|
| [1](figures/avida_diagram.tiff) | N/A            | N/A           |
| [2](figures/avida_combined.pdf) | (a) [data/cooperators.csv.bz2](data/cooperators.csv.bz2)<br>(b) [data/eps.csv.bz2](data/eps.csv.bz2)<br>(c) [data/kills.csv.bz2](data/kills.csv.bz2)<br>(d) [data/popsizes.csv.bz2](data/popsizes.csv.bz2), [data/popsizes_noEPS.csv.bz2](data/popsizes_noEPS.csv.bz2) | [analysis/plot_avida_combined.R](analysis/plot_avida_combined.R) |
| [3](figures/avida_population_stacks.pdf) | (a) [data/coop_cheats_r010_411.csv](data/coop_cheats_r010_411.csv)<br>(b) [data/coop_cheats_r030_411.csv](data/coop_cheats_r030_411.csv) | [analysis/plot_avida_popstacks.R](analysis/plot_avida_popstacks.R) |
| [4](figures/avida_fluctuation_cooppct.pdf) | [data/fluctuation_treatments.csv](data/fluctuation_treatments.csv), [data/fluctuation_cooppct.csv](data/fluctuation_cooppct.csv) | [analysis/plot_avida_fluctuation.R](analysis/plot_avida_fluctuation.R) |
| [5](figures/vc_biofilm_7dWT.pdf) | [data/vc_wt_7d_biofilm.csv](data/vc_wt_7d_biofilm.csv) | [analysis/plot_vc_biofilm.R](analysis/plot_vc_biofilm.R) |
| [6](figures/vc_frac_rugose.pdf) | [data/vc_frac_rugose.csv](data/vc_frac_rugose.csv) | [analysis/plot_vc_rugose.R](analysis/plot_vc_rugose.R) |
| [7](figures/vc_evolved_combined.pdf) | (a) [data/vc_evolved_absorbance.csv](data/vc_evolved_absorbance.csv)<br>(b) [data/vc_comp_initial.csv](data/vc_comp_initial.csv), [data/vc_comp_planktonic_24h.csv](data/vc_comp_planktonic_24h.csv), [data/vc_comp_biofilm_24h.csv](data/vc_comp_biofilm_24h.csv)<br>(c) [data/EvolvedVibrioCholeraeBiofilmYieldsCfu2_051716.csv](data/EvolvedVibrioCholeraeBiofilmYieldsCfu2_051716.csv) | [analysis/plot_vc_evolved_all.R](analysis/plot_vc_evolved_all.R) |
| [S1](figures/avida_population_r30_49685.pdf) | [data/data/population_spatial_r30.csv.bz2](data/data/population_spatial_r30.csv.bz2) | [analysis/plot_avida_population.R](analysis/plot_avida_population.R) |
| [S2](figures/avida_cooperators_trajectories.pdf) | [data/cooperators.csv.bz2](data/cooperators.csv.bz2) | [analysis/plot_avida_coop_trajectories.R](analysis/plot_avida_coop_trajectories.R) |
| [S3](figures/avida_reactions_ORN_EQU.pdf) | [data/reactions.csv.bz2](data/reactions.csv.bz2) | [analysis/plot_avida_EQU.R](analysis/plot_avida_EQU.R) |
| [S4](figures/vc_growth_WT.pdf) | [data/vc_WT_growth.csv](data/vc_WT_growth.csv) | [analysis/plot_vc_growth.R](analysis/plot_vc_growth.R) |
| [Video S1](figures/avida_population_r30.mp4) | [data/population_spatial_r30.csv.bz2](data/population_spatial_r30.csv.bz2) | [analysis/make_population_video.R](analysis/make_population_video.R) |


## Funding

This work was supported in part by [National Science Foundation](https://www.nsf.gov) grants [CNS-1059373](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1059373), [CNS-0915855](https://www.nsf.gov/awardsearch/showAward?AWD_ID=0915855), [DBI-0939454](https://www.nsf.gov/awardsearch/showAward?AWD_ID=0939454), [CCF-0820220](https://www.nsf.gov/awardsearch/showAward?AWD_ID=0820220), [CNS-0751155](https://www.nsf.gov/awardsearch/showAward?AWD_ID=0751155), [DBI-1309318](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1309318); and [National Institutes of Health](https://www.nih.gov) grants [R01-GM109259](https://projectreporter.nih.gov/project_info_description.cfm?aid=9102193) and R01-GM110444. 


## License

Data, configuration files, and figures are released under a [Creative Commons Attribution 4.0 International License (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).
Analysis code is released under the [MIT license](https://opensource.org/licenses/MIT).
Avida is released under the [GNU Lesser General Public License](https://www.gnu.org/licenses/lgpl.html).
