clc

clear all
close all


addpath('C:\Users\andre\Desktop\TOOLBOX_graphtheory')
addpath('C:\Users\andre\Desktop\TOOLBOX_graphtheory\ANAL')

%set(0,'DefaultFigureVisible','off')

PLD={'one','two','three','four','five'};
PLDn=1:5;

cosa = 'rmins'; %eigs

for iii=1:numel(PLDn)   
    
%%Load connectivity matrix
week=PLD{iii};   fprintf(week)
weeks=num2str(PLDn(iii));


CM = loadmatrices(week); %load connectvity matrices: all or three or four or five

cd('C:\Users\andre\Desktop\figsGT\')

if strcmp(cosa,'eigs')
    filename = ['stuff_',weeks,'EIGS','_clean'];
    
fidi = fopen(['Max_eig_PLD_',weeks,'wk.dat']);
d = textscan(fidi, '%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64',...
    'HeaderLines',0, 'Delimiter','\n', 'CollectOutput',1);
fclose(fidi);

modeldata = cell2mat(d);
norma = modeldata'; %already normalized by Katell

elseif strcmp(cosa,'rmins')
    
    filename = ['stuff_',weeks,'w',cosa,'_clean'];%'stuff_5wRMIN';
%%%load Recruitment_success_min_PLD3.
fidi = fopen(['Recruitment_success_min_PLD_',weeks,'wk.dat']);
%%fidi = fopen('Recruitment_success_min_PLD5_cycles.dat');

d = textscan(fidi, '%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64%f64',...
    'HeaderLines',0, 'Delimiter','\n', 'CollectOutput',1);
fclose(fidi);

modeldata = cell2mat(d);

norma=modeldata(:,2:end)./repmat(modeldata(:,1),1,32); %normalized r_mins 
end


N=length(CM(:,:,1)); %number of nodes


%new metric
for kk=1:size(CM,3)
  DM(:,:,kk)=newproba(CM(:,:,kk));
end


%% Calculate stuff

%+++++++% network scale

%%density
for ii=1:size(CM,3)
    rho(ii) = density(CM(:,:,ii));
end
av_rho = mean(rho)


%%charpath    
for ii=1:size(CM,3)
  mpath(ii) = meanpath(CM(:,:,ii));
end
media = mean(mpath) 
mediana = median(mpath) 
devstd = std(mpath) 
mass = max(mpath) 


%%clustering
[true_clusters, frequest, m] = clusteralo(CM,100);
frequest
mean(m)

%+++++++% node scale


%%node strenghts
for ii=1:size(CM,3)
  [ins(ii,:),outs(ii,:),tots(ii,:)] = strengths(CM(:,:,ii), 0);
end
    

%%node strenghts with retention 
for ii=1:size(CM,3)
  [ins_ret(ii,:),outs_ret(ii,:),tots_ret(ii,:)] = strengths(CM(:,:,ii), 1);
end
    
    
%%retention (i.e. SELF INFLUX)
for ii=1:size(CM,3)
  rets(ii,:) = retention(CM(:,:,ii));
end


%%degrees
for ii=1:size(CM,3)
  [din(ii,:),dout(ii,:),dtot(ii,:)] = degrees_dir(CM(:,:,ii));
end 


%%self in-flux/in-flux ratio
for ii=1:size(CM,3)
  SI_I(ii,:) = rets(ii,:)./ins_ret(ii,:);
end 


%%self in-flux/out-flux ratio
for ii=1:size(CM,3)
  SI_O(ii,:) = rets(ii,:)./outs_ret(ii,:);
end 

    
%%clustering coefficient
for ii=1:size(CM,3)
  cluscoeff(ii,:) = clustering_coef_wd(CM(:,:,ii));
end    
  

%%eigenvector centrality
for ii=1:size(CM,3)
  eigc(ii,:)   = eig_centr(CM(:,:,ii));
end


%%core degree
for ii=1:size(CM,3)
   cores(ii,:) = kc_dec(CM(:,:,ii),1e-4); %not using the new metric
end


%%betweenness
for ii=1:size(DM,3)
  betw(ii,:) = betweenness_w(DM(:,:,ii)); 
end


%%closeness bin
for ii=1:size(CM,3)
  closen_b(ii,:) = closeness_bin(CM(:,:,ii));
end


% %%closeness weighted
% for ii=1:size(CM,3)
%   closen_w(ii,:) = closeness_w(CM(:,:,ii));
% end


%%shortest cycles
cyc = squeeze(...
               struct2array(...
                 load(['C:\Users\andre\Desktop\figsGT\cycles\cycles_',weeks,'w.mat'])...
               )...
              )';


%%Z-score
for ii=1:20
   Z(ii,:) = module_degree_zscore(CM(:,:,ii),true_clusters(ii,:),3);
end


%%participation out
for ii=1:20
    PCout(ii,:)=participation_coef(CM(:,:,ii),true_clusters(ii,:),1);
end

   
%%participation in
for ii=1:20
    PCin(ii,:)=participation_coef(CM(:,:,ii),true_clusters(ii,:),2);
end



%%%save stufffff
cd 'C:\Users\andre\Desktop\TOOLBOX_graphtheory\ANAL'
save(filename)  
    
end%for on PLD
%set(0,'DefaultFigureVisible','on')