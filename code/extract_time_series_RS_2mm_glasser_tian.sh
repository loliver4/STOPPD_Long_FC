#!/bin/bash

#SBATCH --job-name RS_time_series_STOPPD
#SBATCH --cpus-per-task=4
#SBATCH --output=/projects/loliver/STOPPD_Long_FC/data/processed/RS_2mm_time_series_glasser_tian.txt
#SBATCH --error=/projects/loliver/STOPPD_Long_FC/data/processed/RS_2mm_time_series_glasser_tian.err

module load ciftify

# extract resting-state time series data from each glasser and tian scale II ROI
sub_dir=$(ls -d -- /projects/loliver/STOPPD_Long_FC/data/processed/sub*/) # lists subject directories
#sub_dir=$(ls -d -- /projects/loliver/STOPPD_Long_FC/data/processed/sub-CMH420018)

for dir in ${sub_dir}; do
    subj=$(basename ${dir})
    session=$(ls -d -- /archive/data/STOPPD/pipelines/bids_apps/ciftify/${subj}/MNINonLinear/Results/ses*)
    
    for sesdir in ${session}; do
      ses=$(basename ${sesdir})
      sesnum=$(echo $ses| cut -c 1-6)
      runnum=$(echo $ses| cut -d '_' -f 4)
      if [ ! -f ${dir}/${subj}_${sesnum}_${runnum}_RS_2mm_glasser_tian_meants.csv ]; then
      ciftify_meants --outputcsv ${dir}/${subj}_${sesnum}_${runnum}_RS_2mm_glasser_tian_meants.csv ${dir}/${subj}_${sesnum}_${runnum}_Atlas_s2_clean.dtseries.nii /projects/loliver/STOPPD_Long_FC/data/raw/Q1-Q6_RelatedValidation210.CorticalAreas_dil_Final_Final_Areas_Group_Colors.32k_fs_LR_Tian_Subcortex_S2.dlabel.nii
      fi
    done
done

