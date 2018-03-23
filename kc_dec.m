function groups = kc_dec(conn,kc)
%kc_dec performs a k-core decomposition of a graph
%
%   Inputs: CONN is a connectivity matrix
%           KC is the step
%           
%   Output: GROUPS is the k score of the nodes
%
%This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 
%3.0 Unported License. See notes at the end of this file for more information.

%Author: Andrea Costa version 2017.10.31
%andrea.costa@pusan.ac.kr

N=length(conn);
I=200; %steps


kc_group=zeros(I,N);


%kc=10e-4;
for n=1:I %modify threshold 
    
    %kc=10e-4 *n;
    kc=kc *1.1*n;
    
      kc_v(n) = 10e-4 *n;
    
    for i =1:32
        
        if sum(conn(i,:))+sum(conn(:,i))<kc
            
            conn(i,:)=0; 
            conn(:,i)=0;
            
        end

        %c((sum(c,2)+sum(c,1)')<kc)=0;
        
        for ii=1:32
           
            d(ii) = sum(conn(ii,:))+ sum(conn(:,ii));
            
        end
    end  
    
      if  numel(find(d))>0 
      
          kc_group(n,1:numel(find(d))) = find(d); 
      
      end           
      clear d
        
    notn(n)=numel(find(kc_group(n,:)));
end
kc_v100=kc_v;


node=zeros(1,32);

for ii=1:size(kc_group,1)
    
  for jj=1:size(kc_group,2)
      
      if kc_group(ii,jj)>0
          
          node(kc_group(ii,jj))=node(kc_group(ii,jj))+1;
      end
  end
end

groups(1:numel(node))=node;


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
