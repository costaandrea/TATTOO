function [true_clusters, frequest, modval] = clusteralo(conn,runs)
%clusteralo finds the graph partitions with the maximum modularity method
%
%   Inputs: CONN is a connectivity matrix
%           RUNS is the number of times to run the modularity algorithm 
%
%   Output: TRUE_CLUSTERS  is the list of equivalent clusters
%           FREQUEST       is the most commonly found cluster
%           MODVAL         is the avergae modularity value

%Author: Andrea Costa version 2017.10.31
%andrea.costa@pusan.ac.kr

N  = size(conn,1);             % number of nodes

    for kk=1:runs %number of sims
      M  = 1:N;                   % initial community affiliations 
      Q0 = -1; Q1 = 0;            % initialize modularity values
      
      while Q1-Q0>1e-5;           % while modularity increases
          Q0 = Q1;                % perform community detection
          [M, Q1] = community_louvain(conn,1,M);
      end
      
      clus(kk,:)=M;
      mods(kk)=Q1;
    end
[true_clusters, frequest, m]= trueclusters(clus);
   
 modval=mean(mods);
      


%This script belongs to the toolbox
%
%       ,d                 ,d      ,d                            
%       88                 88      88                            
%     MM88MMM ,adPPYYba, MM88MMM MM88MMM ,adPPYba,   ,adPPYba,   
%       88    ""     `Y8   88      88   a8"     "8a a8"     "8a  
%       88    ,adPPPPP88   88      88   8b       d8 8b       d8  
%       88,   88,    ,88   88,     88,  "8a,   ,a8" "8a,   ,a8"  
%       "Y888 `"8bbdP"Y8   "Y888   "Y888 `"YbbdP"'   `"YbbdP"'   
%________________________________________________________________________                                                     
%      =====  connecTivity grAph Theory TOOlbox vs_0.1   =====
%________________________________________________________________________
%
% Author: Andrea Costa  vs_2017.12.18
%         https://www.researchgate.net/profile/Andrea_Costa10
%         andrea.costa@pusan.ac.kr
%
% References:
% 1) Costa A., Petrenko A.A., Guizien K., Doglioli A.M.
%    On the calculation of betweenness centrality in marine connectivity 
%    studies using transfer probabilities.
%    2017, PLoS ONE 12(12):1-10
%    DOI10.2371/journal.pone.01890.2
%
% 2) Rubinov M., Sporns O.
%    Complex network measures of brain connectivity: Uses and 
%    interpretations.
%    2010, NeuroImage 52:1059-69C
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Copyright(C) 2017 Andrea Costa                                       %
%  Licensed under the Creative Commons Attribution-NonCommercial-       %
%  ShareAlike 3.0 Unported License. To view an integral copy of this    %
%  license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/     %
%                                                                       %
%  You are free to:					                                    %
%  Share — copy and redistribute the material in any medium or format   %
%  Adapt — remix, transform, and build upon the material	           	%
%  The licensor cannot revoke these freedoms as long as you follow the  %
%  license terms.							                            %
% 									                                    %
%  Under the following terms:		                     				%
%  Attribution — You must give appropriate credit, provide a link to the%
%  license, and indicate if changes were made. You may do so in any     %
%  reasonable manner, but not in any way that suggests the licensor     %
%  endorses you or your use.				                    		%
%  NonCommercial — You may not use the material for commercial purposes.%
%  ShareAlike — If you remix, transform, or build upon the material, you%
%  must distribute your contributions under the same license as the     %
%  original.								                            %
%									                                    %
%  Notices:								                                %
%  No warranties are given. The license may not give you all of the     %
%  permissions necessary for your intended use. For example, other      %
%  rights such as publicity, privacy, or moral rights may limit how you %
%  use the material.							                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
