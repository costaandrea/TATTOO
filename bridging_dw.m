function brfact = bridging_dw(conn)
%bridging_dw calculates the bridging centrlity values for a directed
%weigthed graph.
%
% Inputs: CONN is a directed weigthed connectivity matrix
% Output: BRFACT is an array with the bridg. centr. values
%
% Bridging centrality can be normalized as: brfact = brfact./N^2; 
%
%This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 
%3.0 Unported License. See notes at the end of this file for more information.

%See Hwang et al (2008) for a definition of undirected weigthed bridging
%centrality.
%See " " by Andrea Costa (thesis dissertation) for the derivation of the
%directed weigthed case

%Author Andrea Costa version 2017.10.31
%andrea.costa@pusan.ac.kr


N = length(conn); %number of nodes

A = conn - eye(N).*conn; %remove diagonal as self-loops are ininfluent


for ii=1:N
    
    fact= 1/( sum(A(ii,:))+sum(A(:,ii)) ); %1/total degree
    
    neigh = union( find(A(ii,:)), find(A(:,ii)) ); %find neighbors
    
   if numel(neigh)>0
    for jj=1:numel(neigh) %for each neighbor jj
        
        k=neigh(jj); 
        
        degtot = sum(A(k,:))+sum(A(:,k))-A(k,ii)-A(ii,k); %total degree of the neighbor - links with ii
        
        
        A(k,neigh)=0; %erase links to negihborhood of ii
        A(neigh,k)=0;
        
        degout = sum(A(k,:))-A(k,ii); %outdegree - link going back to ii
        
            summo(jj) = degout/degtot;    
            
    clear degout
    clear degtot  
    end
   else
       summo=0;
   end
    
    brfact(ii) = fact*nansum(summo);
    if isnan(brfact(ii)) %isolated nodes
       
        brfact(ii)=0;
    end
    
    clear summo
    clear neigh
      
    
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
