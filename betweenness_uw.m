function BC=betweenness_uw(G)
%BETWEENNESS_BIN    Node betweenness centrality
%
%   BC = betweenness_bin(A);
%
%   Node betweenness centrality is the fraction of all shortest paths in 
%   the network that contain a given node. Nodes with high values of 
%   betweenness centrality participate in a large number of shortest paths.
%
%   Input:      A,      binary (directed/undirected) connection matrix.
%
%   Output:     BC,     node betweenness centrality vector.
%
%   Note: Betweenness centrality may be normalised to the range [0,1] as
%   BC/[(N-1)(N-2)], where N is the number of nodes in the network.
%
%   Reference: Kintali (2008) arXiv:0809.1906v2 [cs.DS]
%              (generalization to directed and disconnected graphs)
%
%This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 
%3.0 Unported License. See notes at the end of this file for more information.

%   Mika Rubinov, UNSW/U Cambridge, 2007-2012


n=length(G);                %number of nodes
I=eye(n)~=0;                %logical identity matrix
d=1;                     	%path length
NPd=G;                      %number of paths of length |d|
NSPd=NPd;                  	%number of shortest paths of length |d|
NSP=NSPd; NSP(I)=1;        	%number of shortest paths of any length
L=NSPd; L(I)=1;           	%length of shortest paths

%calculate NSP and L
while find(NSPd,1);
    d=d+1;
    NPd=NPd*G;
    NSPd=NPd.*(L==0);
    NSP=NSP+NSPd;
    L=L+d.*(NSPd~=0);
end
L(~L)=inf; L(I)=0;          %L for disconnected vertices is inf
NSP(~NSP)=1;                %NSP for disconnected vertices is 1

Gt=G.';
DP=zeros(n);            	%vertex on vertex dependency
diam=d-1;                  	%graph diameter

%calculate DP
for d=diam:-1:2
    DPd1=(((L==d).*(1+DP)./NSP)*Gt).*((L==(d-1)).*NSP);
    DP=DP + DPd1;           %DPd1: dependencies on vertices |d-1| from source
end

BC=sum(DP,1);               %compute betweenness

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
