STOPPD Longitudinal Functional Connectivity
===============================================

This project examines longitudinal changes in functional connectivity in the STOP-PD dataset.

Created by Lindsay Oliver lindsay.oliver@camh.ca



Project Organization
-----------------------------------

    .
    ├── README.md          <- The top-level README
    ├── .gitignore         <- Files to not upload to github - by default includes /data
    ├── LICENSE            <- usage license if applicable
    |
    ├── data
    │   ├── processed      <- Processed data
    │   └── raw            <- Raw data
    │
    ├── notebooks          <- R notebooks for analysis workflow - to be run in order
    │
    ├── docs               <- Data dictionaries, manuals, and all other explanatory materials
    │
    ├── results            <- Generated results
    │
    ├── code               <- Source code for use in this project (virtual environments, bash scripts, etc.)
    
    

Processing and Analysis Scripts
-----------------------------------

Code
Cifti clean resting-state data, including 36p regression and 2 mm smoothing: cifti_clean_RS_2mm.sh

Done separately for CMH participants as they still need 4 TRs dropped but other sites do not: cifti_clean_RS_2mm_CMH.sh

Extract resting-state time series data from each glasser and tian scale II ROI: extract_time_series_RS_2mm_glasser_tian.sh
  
  
Notebooks
Generation of correlation matrices to calculate graph metrics: 01_STOPPD_Longitudinal_rsFC.Rmd

Generation of graph metrics using BCT (in matlab):
02_bct_graph_metrics_ses01_pos.m
02_bct_graph_metrics_ses02_pos.m

Analyses of graph metrics at 15% density only (following Voinekos et al., 2020): 03_STOPPD_GraphMetrics_pos.Rmd

Analyses of graph metrics across densities 5-35%: 04_STOPPD_GraphMetrics_pos_thresholds.Rmd

Analyses of within- and between-network connectivity: 05_STOPPD_Longitudinal_rsFC_WithBetConn.Rmd

