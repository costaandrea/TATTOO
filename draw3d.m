function draw3d(CONN,xyz)
%draw3D draws a graph in a 3D space
%
%   Input: CONN is a connectivity matrix
%          xyz is (N,3) matrix of coordinates where N is the number of ndoes
%
%This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 
%3.0 Unported License. See notes at the end of this file for more information.

%Author: Andrea Costa version 2017.10.31
%andrea.costa@pusan.ac.kr

    figure; hold on

    for jj=1:size(CONN,1) %cycle on nodes

        conn=find(CONN(jj,:)); %find connections for each node

        if numel(conn>0) %if there are non null connections
         for kk=1:numel(conn) %plot them
            a=conn(kk);           
            
            line([xyz(a,1) xyz(jj,1)],[xyz(a,2) xyz(jj,2)],[xyz(a,3) xyz(jj,3)],...
                'color',[1 0 0],'linewidth',3)
            lh=quiver3(xyz(jj,1),xyz(jj,2),xyz(jj,3),...
                       xyz(a,1)-xyz(jj,1),xyz(a,2)-xyz(jj,2),xyz(a,3)-xyz(jj,3),...
                      0.75,'maxheadsize',0.5);

            set(lh,'linewidth',4);
            set(lh,'color',[1,0,0]);     
       
         end
        end
    end
    scatter3(xyz(:,1),xyz(:,2),xyz(:,3),800,'b','.') %plot nodes


   %number the nodes 
   for ii=1:size(xyz,1)
       text(xyz(ii,1),xyz(ii,2),xyz(ii,3),num2str(ii),'Color','k','FontWeight','bold',...
  'FontSize',14, 'HorizontalAlignment','right', 'VerticalAlignment','bottom')
   end


   xlabel('x')
   ylabel('y')
   zlabel('z')

   %view(-15,18)
   grid on
   
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
