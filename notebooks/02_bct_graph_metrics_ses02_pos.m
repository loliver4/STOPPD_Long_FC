% add BCT to path

%% Network Measures

% read in individual conn matrices Fisher z-transformed, unthresholded
% cortical and subcortical ROIs

cd /projects/loliver/STOPPD_Long_FC/data/processed/conn_matrices/full/ses-02

files_sub = dir('*whole.csv');
num_files_sub = length(files_sub);
results_sub = cell(length(files_sub), 1);
for i = 1:num_files_sub
  results_sub{i} = csvread(files_sub(i).name);
end

% normalize to get values between 0-1 (retains sign)
% generate thresholded matrices from 0.05-0.35, and unthr
% not using absolute thresholding (neg values eliminated) 
% as most functions do not accept signed values

results_thr_sub = cell(58, 8);
for i=1:58
    W = weight_conversion(results_sub{i,1}, 'normalize');
    W_5 = threshold_proportional(W, 0.05);
    W_10 = threshold_proportional(W, 0.10);
    W_15 = threshold_proportional(W, 0.15);
    W_20 = threshold_proportional(W, 0.20);
    W_25 = threshold_proportional(W, 0.25);
    W_30 = threshold_proportional(W, 0.30);
    W_35 = threshold_proportional(W, 0.35);
    W_100 = threshold_proportional(W, 1);
    results_thr_sub{i,1} = [W_5];
    results_thr_sub{i,2} = [W_10];
    results_thr_sub{i,3} = [W_15];
    results_thr_sub{i,4} = [W_20];
    results_thr_sub{i,5} = [W_25];
    results_thr_sub{i,6} = [W_30];
    results_thr_sub{i,7} = [W_35];
    results_thr_sub{i,8} = [W_100];
end 

% each cell contains columns with mean clustering coefficient,
% global efficiency, transitivity, characteristic path length, and
% modularity

% skipping 100 as it contains neg values

graph_mets_sub_5 = cell(58,6);
for i=1:58
graph_mets_sub_5{i,1} = str2num(strtok(files_sub(i).name,'_'));
graph_mets_sub_5{i,2} = mean(clustering_coef_wu(results_thr_sub{i,1}));
graph_mets_sub_5{i,3} = efficiency_wei(results_thr_sub{i,1});
graph_mets_sub_5{i,4} = transitivity_wu(results_thr_sub{i,1});
graph_mets_sub_5{i,5} = charpath(results_thr_sub{i,1});
[~,Q] = modularity_und(results_thr_sub{i,1});
graph_mets_sub_5{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_whole_5.csv'],graph_mets_sub_5)


graph_mets_sub_10 = cell(58,6);
for i=1:58
graph_mets_sub_10{i,1} = str2num(strtok(files_sub(i).name,'_'));
graph_mets_sub_10{i,2} = mean(clustering_coef_wu(results_thr_sub{i,2}));
graph_mets_sub_10{i,3} = efficiency_wei(results_thr_sub{i,2});
graph_mets_sub_10{i,4} = transitivity_wu(results_thr_sub{i,2});
graph_mets_sub_10{i,5} = charpath(results_thr_sub{i,2});
[~,Q] = modularity_und(results_thr_sub{i,2});
graph_mets_sub_10{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_whole_10.csv'],graph_mets_sub_10)


graph_mets_sub_15 = cell(58,6);
for i=1:58
graph_mets_sub_15{i,1} = str2num(strtok(files_sub(i).name,'_'));
graph_mets_sub_15{i,2} = mean(clustering_coef_wu(results_thr_sub{i,3}));
graph_mets_sub_15{i,3} = efficiency_wei(results_thr_sub{i,3});
graph_mets_sub_15{i,4} = transitivity_wu(results_thr_sub{i,3});
graph_mets_sub_15{i,5} = charpath(results_thr_sub{i,3});
[~,Q] = modularity_und(results_thr_sub{i,3});
graph_mets_sub_15{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_whole_15.csv'],graph_mets_sub_15)


graph_mets_sub_20 = cell(58,6);
for i=1:58
graph_mets_sub_20{i,1} = str2num(strtok(files_sub(i).name,'_'));
graph_mets_sub_20{i,2} = mean(clustering_coef_wu(results_thr_sub{i,4}));
graph_mets_sub_20{i,3} = efficiency_wei(results_thr_sub{i,4});
graph_mets_sub_20{i,4} = transitivity_wu(results_thr_sub{i,4});
graph_mets_sub_20{i,5} = charpath(results_thr_sub{i,4});
[~,Q] = modularity_und(results_thr_sub{i,4});
graph_mets_sub_20{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_whole_20.csv'],graph_mets_sub_20)


graph_mets_sub_25 = cell(58,6);
for i=1:58
graph_mets_sub_25{i,1} = str2num(strtok(files_sub(i).name,'_'));
graph_mets_sub_25{i,2} = mean(clustering_coef_wu(results_thr_sub{i,5}));
graph_mets_sub_25{i,3} = efficiency_wei(results_thr_sub{i,5});
graph_mets_sub_25{i,4} = transitivity_wu(results_thr_sub{i,5});
graph_mets_sub_25{i,5} = charpath(results_thr_sub{i,5});
[~,Q] = modularity_und(results_thr_sub{i,5});
graph_mets_sub_25{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_whole_25.csv'],graph_mets_sub_25)


graph_mets_sub_30 = cell(58,6);
for i=1:58
graph_mets_sub_30{i,1} = str2num(strtok(files_sub(i).name,'_'));
graph_mets_sub_30{i,2} = mean(clustering_coef_wu(results_thr_sub{i,6}));
graph_mets_sub_30{i,3} = efficiency_wei(results_thr_sub{i,6});
graph_mets_sub_30{i,4} = transitivity_wu(results_thr_sub{i,6});
graph_mets_sub_30{i,5} = charpath(results_thr_sub{i,6});
[~,Q] = modularity_und(results_thr_sub{i,6});
graph_mets_sub_30{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_whole_30.csv'],graph_mets_sub_30)


graph_mets_sub_35 = cell(58,6);
for i=1:58
graph_mets_sub_35{i,1} = str2num(strtok(files_sub(i).name,'_'));
graph_mets_sub_35{i,2} = mean(clustering_coef_wu(results_thr_sub{i,7}));
graph_mets_sub_35{i,3} = efficiency_wei(results_thr_sub{i,7});
graph_mets_sub_35{i,4} = transitivity_wu(results_thr_sub{i,7});
graph_mets_sub_35{i,5} = charpath(results_thr_sub{i,7});
[~,Q] = modularity_und(results_thr_sub{i,7});
graph_mets_sub_35{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_whole_35.csv'],graph_mets_sub_35)




% same for cortical ROIs only
% read in individual conn matrices Fisher z-transformed, unthresholded

cd /projects/loliver/STOPPD_Long_FC/data/processed/conn_matrices/full/ses-02

files_cor = dir('*_cortical.csv');
num_files_cor = length(files_cor);
results_cor = cell(length(files_cor), 1);
for i = 1:num_files_cor
  results_cor{i} = csvread(files_cor(i).name);
end

% normalize to get values between 0-1 (retains sign)
% generate thresholded matrices from 0.05-0.35, and unthr
% not using absolute thresholding (neg values will be eliminated) 
% as most functions do not accept signed values

results_thr_cor = cell(58, 8);
for i=1:58
    W = weight_conversion(results_cor{i,1}, 'normalize');
    W_5 = threshold_proportional(W, 0.05);
    W_10 = threshold_proportional(W, 0.10);
    W_15 = threshold_proportional(W, 0.15);
    W_20 = threshold_proportional(W, 0.20);
    W_25 = threshold_proportional(W, 0.25);
    W_30 = threshold_proportional(W, 0.30);
    W_35 = threshold_proportional(W, 0.35);
    W_100 = threshold_proportional(W, 1);
    results_thr_cor{i,1} = [W_5];
    results_thr_cor{i,2} = [W_10];
    results_thr_cor{i,3} = [W_15];
    results_thr_cor{i,4} = [W_20];
    results_thr_cor{i,5} = [W_25];
    results_thr_cor{i,6} = [W_30];
    results_thr_cor{i,7} = [W_35];
    results_thr_cor{i,8} = [W_100];
end

% each cell contains columns with mean clustering coefficient,
% global efficiency, transitivity, characteristic path length

% skipping 100 as it contains neg values

graph_mets_cor_5 = cell(58,6);
for i=1:58
graph_mets_cor_5{i,1} = str2num(strtok(files_cor(i).name,'_'));
graph_mets_cor_5{i,2} = mean(clustering_coef_wu(results_thr_cor{i,1}));
graph_mets_cor_5{i,3} = efficiency_wei(results_thr_cor{i,1});
graph_mets_cor_5{i,4} = transitivity_wu(results_thr_cor{i,1});
graph_mets_cor_5{i,5} = charpath(results_thr_cor{i,1});
[~,Q] = modularity_und(results_thr_cor{i,1});
graph_mets_cor_5{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_cor_5.csv'],graph_mets_cor_5)


graph_mets_cor_10 = cell(58,6);
for i=1:58
graph_mets_cor_10{i,1} = str2num(strtok(files_cor(i).name,'_'));
graph_mets_cor_10{i,2} = mean(clustering_coef_wu(results_thr_cor{i,2}));
graph_mets_cor_10{i,3} = efficiency_wei(results_thr_cor{i,2});
graph_mets_cor_10{i,4} = transitivity_wu(results_thr_cor{i,2});
graph_mets_cor_10{i,5} = charpath(results_thr_cor{i,2});
[~,Q] = modularity_und(results_thr_cor{i,2});
graph_mets_cor_10{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_cor_10.csv'],graph_mets_cor_10)


graph_mets_cor_15 = cell(58,6);
for i=1:58
graph_mets_cor_15{i,1} = str2num(strtok(files_cor(i).name,'_'));
graph_mets_cor_15{i,2} = mean(clustering_coef_wu(results_thr_cor{i,3}));
graph_mets_cor_15{i,3} = efficiency_wei(results_thr_cor{i,3});
graph_mets_cor_15{i,4} = transitivity_wu(results_thr_cor{i,3});
graph_mets_cor_15{i,5} = charpath(results_thr_cor{i,3});
[~,Q] = modularity_und(results_thr_cor{i,3});
graph_mets_cor_15{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_cor_15.csv'],graph_mets_cor_15)


graph_mets_cor_20 = cell(58,6);
for i=1:58
graph_mets_cor_20{i,1} = str2num(strtok(files_cor(i).name,'_'));
graph_mets_cor_20{i,2} = mean(clustering_coef_wu(results_thr_cor{i,4}));
graph_mets_cor_20{i,3} = efficiency_wei(results_thr_cor{i,4});
graph_mets_cor_20{i,4} = transitivity_wu(results_thr_cor{i,4});
graph_mets_cor_20{i,5} = charpath(results_thr_cor{i,4});
[~,Q] = modularity_und(results_thr_cor{i,4});
graph_mets_cor_20{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_cor_20.csv'],graph_mets_cor_20)


graph_mets_cor_25 = cell(58,6);
for i=1:58
graph_mets_cor_25{i,1} = str2num(strtok(files_cor(i).name,'_'));
graph_mets_cor_25{i,2} = mean(clustering_coef_wu(results_thr_cor{i,5}));
graph_mets_cor_25{i,3} = efficiency_wei(results_thr_cor{i,5});
graph_mets_cor_25{i,4} = transitivity_wu(results_thr_cor{i,5});
graph_mets_cor_25{i,5} = charpath(results_thr_cor{i,5});
[~,Q] = modularity_und(results_thr_cor{i,5});
graph_mets_cor_25{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_cor_25.csv'],graph_mets_cor_25)


graph_mets_cor_30 = cell(58,6);
for i=1:58
graph_mets_cor_30{i,1} = str2num(strtok(files_cor(i).name,'_'));
graph_mets_cor_30{i,2} = mean(clustering_coef_wu(results_thr_cor{i,6}));
graph_mets_cor_30{i,3} = efficiency_wei(results_thr_cor{i,6});
graph_mets_cor_30{i,4} = transitivity_wu(results_thr_cor{i,6});
graph_mets_cor_30{i,5} = charpath(results_thr_cor{i,6});
[~,Q] = modularity_und(results_thr_cor{i,6});
graph_mets_cor_30{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_cor_30.csv'],graph_mets_cor_30)


graph_mets_cor_35 = cell(58,6);
for i=1:58
graph_mets_cor_35{i,1} = str2num(strtok(files_cor(i).name,'_'));
graph_mets_cor_35{i,2} = mean(clustering_coef_wu(results_thr_cor{i,7}));
graph_mets_cor_35{i,3} = efficiency_wei(results_thr_cor{i,7});
graph_mets_cor_35{i,4} = transitivity_wu(results_thr_cor{i,7});
graph_mets_cor_35{i,5} = charpath(results_thr_cor{i,7});
[~,Q] = modularity_und(results_thr_cor{i,7});
graph_mets_cor_35{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_cor_35.csv'],graph_mets_cor_35)




% same for subcortical ROIs only
% read in individual conn matrices Fisher z-transformed, unthresholded

cd /projects/loliver/STOPPD_Long_FC/data/processed/conn_matrices/full/ses-02

files_sub = dir('*subcortical.csv');
num_files_sub = length(files_sub);
results_sub = cell(length(files_sub), 1);
for i = 1:num_files_sub
  results_sub{i} = csvread(files_sub(i).name);
end

% normalize to get values between 0-1 (retains sign)
% generate thresholded matrices from 0.05-0.35, and unthr
% not using absolute thresholding (neg values eliminated) 
% as most functions do not accept signed values

results_thr_sub = cell(58, 8);
for i=1:58
    W = weight_conversion(results_sub{i,1}, 'normalize');
    W_5 = threshold_proportional(W, 0.05);
    W_10 = threshold_proportional(W, 0.10);
    W_15 = threshold_proportional(W, 0.15);
    W_20 = threshold_proportional(W, 0.20);
    W_25 = threshold_proportional(W, 0.25);
    W_30 = threshold_proportional(W, 0.30);
    W_35 = threshold_proportional(W, 0.35);
    W_100 = threshold_proportional(W, 1);
    results_thr_sub{i,1} = [W_5];
    results_thr_sub{i,2} = [W_10];
    results_thr_sub{i,3} = [W_15];
    results_thr_sub{i,4} = [W_20];
    results_thr_sub{i,5} = [W_25];
    results_thr_sub{i,6} = [W_30];
    results_thr_sub{i,7} = [W_35];
    results_thr_sub{i,8} = [W_100];
end 

% each cell contains columns with mean clustering coefficient,
% global efficiency, transitivity, characteristic path length, and
% modularity

% skipping 100 as it contains neg values

graph_mets_sub_5 = cell(58,6);
for i=1:58
graph_mets_sub_5{i,1} = str2num(strtok(files_sub(i).name,'_'));
graph_mets_sub_5{i,2} = mean(clustering_coef_wu(results_thr_sub{i,1}));
graph_mets_sub_5{i,3} = efficiency_wei(results_thr_sub{i,1});
graph_mets_sub_5{i,4} = transitivity_wu(results_thr_sub{i,1});
graph_mets_sub_5{i,5} = charpath(results_thr_sub{i,1});
[~,Q] = modularity_und(results_thr_sub{i,1});
graph_mets_sub_5{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_sub_5.csv'],graph_mets_sub_5)


graph_mets_sub_10 = cell(58,6);
for i=1:58
graph_mets_sub_10{i,1} = str2num(strtok(files_sub(i).name,'_'));
graph_mets_sub_10{i,2} = mean(clustering_coef_wu(results_thr_sub{i,2}));
graph_mets_sub_10{i,3} = efficiency_wei(results_thr_sub{i,2});
graph_mets_sub_10{i,4} = transitivity_wu(results_thr_sub{i,2});
graph_mets_sub_10{i,5} = charpath(results_thr_sub{i,2});
[~,Q] = modularity_und(results_thr_sub{i,2});
graph_mets_sub_10{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_sub_10.csv'],graph_mets_sub_10)


graph_mets_sub_15 = cell(58,6);
for i=1:58
graph_mets_sub_15{i,1} = str2num(strtok(files_sub(i).name,'_'));
graph_mets_sub_15{i,2} = mean(clustering_coef_wu(results_thr_sub{i,3}));
graph_mets_sub_15{i,3} = efficiency_wei(results_thr_sub{i,3});
graph_mets_sub_15{i,4} = transitivity_wu(results_thr_sub{i,3});
graph_mets_sub_15{i,5} = charpath(results_thr_sub{i,3});
[~,Q] = modularity_und(results_thr_sub{i,3});
graph_mets_sub_15{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_sub_15.csv'],graph_mets_sub_15)


graph_mets_sub_20 = cell(58,6);
for i=1:58
graph_mets_sub_20{i,1} = str2num(strtok(files_sub(i).name,'_'));
graph_mets_sub_20{i,2} = mean(clustering_coef_wu(results_thr_sub{i,4}));
graph_mets_sub_20{i,3} = efficiency_wei(results_thr_sub{i,4});
graph_mets_sub_20{i,4} = transitivity_wu(results_thr_sub{i,4});
graph_mets_sub_20{i,5} = charpath(results_thr_sub{i,4});
[~,Q] = modularity_und(results_thr_sub{i,4});
graph_mets_sub_20{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_sub_20.csv'],graph_mets_sub_20)


graph_mets_sub_25 = cell(58,6);
for i=1:58
graph_mets_sub_25{i,1} = str2num(strtok(files_sub(i).name,'_'));
graph_mets_sub_25{i,2} = mean(clustering_coef_wu(results_thr_sub{i,5}));
graph_mets_sub_25{i,3} = efficiency_wei(results_thr_sub{i,5});
graph_mets_sub_25{i,4} = transitivity_wu(results_thr_sub{i,5});
graph_mets_sub_25{i,5} = charpath(results_thr_sub{i,5});
[~,Q] = modularity_und(results_thr_sub{i,5});
graph_mets_sub_25{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_sub_25.csv'],graph_mets_sub_25)


graph_mets_sub_30 = cell(58,6);
for i=1:58
graph_mets_sub_30{i,1} = str2num(strtok(files_sub(i).name,'_'));
graph_mets_sub_30{i,2} = mean(clustering_coef_wu(results_thr_sub{i,6}));
graph_mets_sub_30{i,3} = efficiency_wei(results_thr_sub{i,6});
graph_mets_sub_30{i,4} = transitivity_wu(results_thr_sub{i,6});
graph_mets_sub_30{i,5} = charpath(results_thr_sub{i,6});
[~,Q] = modularity_und(results_thr_sub{i,6});
graph_mets_sub_30{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_sub_30.csv'],graph_mets_sub_30)


graph_mets_sub_35 = cell(58,6);
for i=1:58
graph_mets_sub_35{i,1} = str2num(strtok(files_sub(i).name,'_'));
graph_mets_sub_35{i,2} = mean(clustering_coef_wu(results_thr_sub{i,7}));
graph_mets_sub_35{i,3} = efficiency_wei(results_thr_sub{i,7});
graph_mets_sub_35{i,4} = transitivity_wu(results_thr_sub{i,7});
graph_mets_sub_35{i,5} = charpath(results_thr_sub{i,7});
[~,Q] = modularity_und(results_thr_sub{i,7});
graph_mets_sub_35{i,6} = Q;
end

csvwrite(['/projects/loliver/STOPPD_Long_FC/data/processed/graph_metrics/ses-02/pos_sub_35.csv'],graph_mets_sub_35)





