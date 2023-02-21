STOPPD Longitudinal Functional Connectivity
===============================================

This project examines longitudinal changes in resting state functional connectivity as a function of antipsychotic medication randomization in the STOP-PD dataset.

Created by Lindsay Oliver lindsay.oliver@camh.ca



Project Organization
-----------------------------------

    .
    ├── README.md          <- The top-level README
    ├── .gitignore         <- Files to not upload to github
    |
    ├── data
    │   ├── processed      <- Processed data
    │   └── raw            <- Raw data
    │
    ├── notebooks          <- R notebooks for analysis workflow - to be run in order
    │
    ├── docs               <- Relevant documents
    │
    ├── results            <- Generated results
    │   └── Figures        <- Manuscript figures
    │
    ├── code               <- Source code for use in this project
    
    

Processing and Analysis Scripts
-----------------------------------

Code

cifti_clean_RS_2mm.sh: Cifti clean resting-state data, including 36 parameter nuisance regression and 2 mm smoothing (specifications in confounds_config.json)

cifti_clean_RS_2mm_CMH.sh: Cleaning done separately for CMH participants as they still need 4 TRs dropped but other sites do not (specifications in confounds_config_CMH.json)

extract_time_series_RS_2mm_glasser_tian.sh: Extract resting-state time series data from each Glasser (2016) and Tian (2020) scale II ROI

  
Notebooks

01_STOPPD_Longitudinal_rsFC.Rmd: Generation of correlation matrices to calculate graph metrics

02_bct_graph_metrics_pos.m: Generation of graph metrics using the Brain Connectivity Toolbox (in matlab)

03_STOPPD_GraphMetrics_pos.Rmd: Analyses of graph metrics at 15% density

04_STOPPD_GraphMetrics_pos_thresholds.Rmd: Analyses of graph metrics across densities

05_STOPPD_Longitudinal_rsFC_WithBetConn.Rmd: Analyses of within- and between-network connectivity

06_STOPPD_Longitudinal_rsFC_FullBetConn.Rmd: Analyses of between-network connectivity (secondary visual network with each of the other networks)

