function deg = opsahl_deg(conn,alpha,type)
%opsahal_deg calculatd the Opsahl degree of the nodes in a graph
%
%   Input: CONN is a connectivity matrix
%          ALPHA is the exponent in the Opsahl degree formula
%          TYPE is a string that specifies if the degree is total ('tot'), 
%               in-degree ('in') or out-degree ('out')
%
%   Output: DEG is the array of Opsahl degrees
%
% Note that by default the diagonal terms are ignored.
%
%This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 
%3.0 Unported License. See notes at the end of this file for more information.

% Opshal degree is defined as:
%           opsahl_deg = degree*(strength/degree)^alpha
%
% Reference: Opsahl T., Agneessens F., Skvoretz J. (2010). Node centrality 
%             in weighted networks: Generalizing degree and shortest paths. 
%             Social Networks 32, 245-251.

%Author Andrea Costa version 2017.10.31
%andrea.costa@pusan.ac.kr


%calculate the degrees
[din,dout,dtot] = degrees_dir(conn); %this should work also with undirected
                                     % graphs

%calculate the stregths
[ins,outs,tots] = strengths(conn,0);
 

%calculate the Opsahl degree
if strcmp(type,'tot')
    
    deg = dtot.*(tots./dtot).^alpha;
    
elseif strcmp(type,'in')
    
    deg = din.*(ins./din).^alpha;
    
elseif strcmp(type,'out')
    
    deg = dout.*(outs./dout).^alpha; 
    
end

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
