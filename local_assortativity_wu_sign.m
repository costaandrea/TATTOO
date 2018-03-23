function [loc_assort_pos,loc_assort_neg] = local_assortativity_wu_sign(conn)
%LOCAL_ASSORTATIVITY_WU_SIGN     Local Assortativity
%
%   [loc_assort_pos,loc_assort_neg] = local_assortativity_wu_sign(CONN);
%
%   Local Assortativity measures the extent to which nodes are connected to
%   nodes of similar strength (vs. higher or lower strength). Adapted from
%   Thedchanamoorthy et al. (2014)'s formula to allow weighted/signed 
%   networks (node degree replaced with node strength). Note, output values 
%   sum to total assortativity. 
%
%   Inputs:     CONN,        undirected connection matrix with positive and
%                         negative weights
%
%   Output:     loc_assort_pos, local assortativity from positive weights
%
%               loc_assort_neg, local assortativity from negative weights
%
%   Reference: Thedchanamoorthy G, Piraveenan M, Kasthuriratna D, 
%              Senanayake U. Proc Comp Sci (2014) 29:2449-2461.
%
%This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 
%3.0 Unported License. See notes at the end of this file for more information.

%Author: Jeff Spielberg, Boston University
%Modified by Andrea Costa
%andrea.costa@pusan.ac.kr

conn(1:(size(conn,1)+1):end) = 0;
r_pos = assortativity_w(conn.*(conn>0),0,0);
r_neg = assortativity_w(-conn.*(conn<0),0,0);
[str_pos,str_neg] = strengths_und_sign(conn);
loc_assort_pos = nan(size(conn,1),1);
loc_assort_neg = nan(size(conn,1),1);

for curr_node = 1:size(conn,1)
    [~,j_pos] = find(conn(curr_node,:)>0);
    loc_assort_pos(curr_node,1) = sum(abs(str_pos(j_pos)-str_pos(curr_node)))/str_pos(curr_node);
    
    [~,j_neg] = find(conn(curr_node,:)<0);
    loc_assort_neg(curr_node,1) = sum(abs(str_neg(j_neg)-str_neg(curr_node)))/str_neg(curr_node);
end

loc_assort_pos = ((r_pos+1)/size(conn,1))-(loc_assort_pos/sum(loc_assort_pos));
loc_assort_neg = ((r_neg+1)/size(conn,1))-(loc_assort_neg/sum(loc_assort_neg));


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
