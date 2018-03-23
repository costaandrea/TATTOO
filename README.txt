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
%  You are free to:							%
%  Share — copy and redistribute the material in any medium or format   %
%  Adapt — remix, transform, and build upon the material		%
%  The licensor cannot revoke these freedoms as long as you follow the  %
%  license terms.							%
% 									%
%  Under the following terms:						%
%  Attribution — You must give appropriate credit, provide a link to the%
%  license, and indicate if changes were made. You may do so in any     %
%  reasonable manner, but not in any way that suggests the licensor     %
%  endorses you or your use.						%
%  NonCommercial — You may not use the material for commercial purposes.%
%  ShareAlike — If you remix, transform, or build upon the material, you%
%  must distribute your contributions under the same license as the     %
%  original.								%
%									%
%  Notices:								%
%  No warranties are given. The license may not give you all of the     %
%  permissions necessary for your intended use. For example, other      %
%  rights such as publicity, privacy, or moral rights may limit how you %
%  use the material.							%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Scripts:

newproba.m	::	reverses the probability values in a connectivity matrix

bridging_dw.m	::	calculates the bridging centrality in the directed weighted case

bridging_uu.m 	::	calculates the bridging centrality in the undirected unweighted case

bridging_uw.m	:: 	calculates the bridging centrality in the undirected weighed case

strengths.m	::	calculates the in, out and total strength of the nodes in a graph
			NB It permits to modify the values of the self-loops

transitivity_wd.m  ::	calculates the transitivity of the nodes in a graph 

weigth_conversion.m ::	various weight conversions (e.g., binarize a connectivity matrix). It may be
			used before transitivity_wd.m. This code is from the BCT Toolbox.

efficiency_w.m	::	Calculates global and local efficiency of a weigthed graph.
			NB It takes as input A, the applies newroba(A) and then normalizes it

assortativity_w.m ::	Calculates the assortativity value of a graph
			NB It permits to modify the values of the self-loops

local_assortativity_wu_sign :: Calculates local assortativity. This code is from the BCT Toolbox.

strengths_und_sign.m 	::  Calculates nodal strength of positive/negative weights and total 
			    positive/negative weigh. This code is from the BCT Toolbox.

kc_dec.m	::  k-core decomposition.

distance_w.m	::  Calculates distance matrix for a weighted network. This code is from the BCT Toolbox.

distance_bin.m	::  Calculates distance matrix for a binary network. This code is from the BCT Toolbox.

eig_centr.m	::  Calculated the eigenvalue centrality 

meanpath.m	:: Calculates the mean path of graph. 

clustering_coeff_wd :: Calculates the clustering coefficient of a directed weighted graph. This code is from the BCT Toolbox.

community_luvain:: Calculates the optimal community structure. This code is from the BCT Toolbox.

trueclusters	:: Finds the most frequent cluster from the list of clusters issued from the modularity algorithm.

clusteralo	:: Finds the graph partitions with the maximum modularity method.

module_degree_zscore :: Calculates the Z score. This code is from the BCT Toolbox.

participation_coef :: Calculates the participation coefficients. This code is from the BCT Toolbox.

MIN_CYCLES_disp	:: 

CALC_minCyls	::

analyze_cycles	::

drunkgraph	:: Simulates a random walk on a graph.

conncomp.m	:: Calculates the largest connected component of a graph.

drwa3d.m	:: Draws a graph in 3D space.

density		:: Calculates the density of a matrix.

opsahl stuff	:: Calculates Opsahl degrees.

self influx or retention :: Calculate the influx (retention) of the sites.

fluxes		:: Calculates the tot/in/out fluxes.

closeness_bin	:: Calculates the closeness disregarding edge weight.

closeness_w	:: Calculates the closeness taking into account edge weight.

symmetry	:: Calculates the simmetry of the connections of a node.
