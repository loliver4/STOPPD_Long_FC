#!/bin/bash

#SBATCH --job-name cifti_clean_RS_2mm_CMH
#SBATCH --cpus-per-task=4
#SBATCH --output=/projects/loliver/STOPPD_Long_FC/data/processed/cifti_clean_RS_2mm_CMH.txt
#SBATCH --error=/projects/loliver/STOPPD_Long_FC/data/processed/cifti_clean_RS_2mm_CMH.err

module load ciftify
module load connectome-workbench/1.4.1

# cifti clean resting-state data, including 36p regression and 2 mm smoothing
# done separately for CMH participants as they still need 4 TRs dropped but other sites don't
sub_dir=$(ls -d -- /projects/loliver/STOPPD_Long_FC/data/processed/sub-C*/) # lists CMH subject directories

#sub_dir=$(ls -d -- /projects/loliver/STOPPD_Long_FC/data/processed/sub-CMH420018)

for dir in ${sub_dir}; do
    subj=$(basename ${dir})
    #in_dir="/archive/data/STOPPD/pipelines/bids_apps/ciftify/${subj}/MNINonLinear/"
    session=$(ls -d -- /archive/data/STOPPD/pipelines/bids_apps/ciftify/${subj}/MNINonLinear/Results/ses*)
    
    for sesdir in ${session}; do
      ses=$(basename ${sesdir})
      sesnum=$(echo $ses| cut -c 1-6)
      runnum=$(echo $ses| cut -d '_' -f 4)
      if [ ! -f ${dir}/${subj}_${sesnum}_${runnum}_Atlas_s2_clean.dtseries.nii ]; then
      ciftify_clean_img  \
      --output-file=${dir}/${subj}_${sesnum}_${runnum}_Atlas_s2_clean.dtseries.nii \
      --clean-config=/projects/loliver/STOPPD_Long_FC/code/confounds_config_CMH.json \
      --confounds-tsv=/archive/data/STOPPD/pipelines/bids_apps/confounds/${subj}_${sesnum}_task-rest_acq-sprlcombined_${runnum}_desc-confounds_regressors.tsv  \
      --left-surface=/archive/data/STOPPD/pipelines/bids_apps/ciftify/${subj}/MNINonLinear/fsaverage_LR32k/${subj}.L.midthickness.32k_fs_LR.surf.gii \
      --right-surface=/archive/data/STOPPD/pipelines/bids_apps/ciftify/${subj}/MNINonLinear/fsaverage_LR32k/${subj}.R.midthickness.32k_fs_LR.surf.gii \
      ${sesdir}/${sesnum}_task-rest_acq-*_${runnum}_desc-preproc_Atlas_s0.dtseries.nii
      fi 
    done
done

