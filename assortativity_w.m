function   ass = assortativity_w(conn,flag,fac)
%assortativity calculates tehe assortativity coefficient of a graph
%
%   r = assortativity_w(conn,flag);
%
%   Inputs:     CONN,    weighted directed/undirected connection matrix
%               FLAG,   0, undirected graph: strength/strength correlation
%                       1, directed graph: out-strength/in-strength correlation
%                       2, directed graph: in-strength/out-strength correlation
%                       3, directed graph: out-strength/out-strength correlation
%                       4, directed graph: in-strength/in-strength correlation
%               FAC is the factor multiplying the diagonal of conn (set =0 to
%               erase the self-loops) NB fac=0 is often raccomended
%
%   Outputs:    ass,      assortativity coefficient
%
%   Notes: For flag 1 the function computes 
%   the directed assortativity described in Rubinov and Sporns (2010) NeuroImage.
%
%   The assortativity coefficient is a correlation coefficient between the
%   strengths (weighted degrees) of all nodes on two opposite ends of a link.
%   A positive assortativity coefficient indicates that nodes tend to link to
%   other nodes with the same or similar strength.
%
%   Reference:  Newman (2002) Phys Rev Lett 89:208701
%               Foster et al. (2010) PNAS 107:10815-10820
%
%This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 
%3.0 Unported License. See notes at the end of this file for more information.

%Author: Mika Rubinov, University of Cambridge, 2012
%Modified by Andrea Costa version 2017.10.31
%andrea.costa@pusan.ac.kr


% modify the self-loops values
if fac~=1  %if needed
    conn(1:length(conn)+1:length(conn)^2) = ...
        conn(1:length(conn)+1:length(conn)^2) * fac; 
    
else %otherwise
    %do not modify the diagonal
end

if (flag==0)                        % undirected version
    str = sum(conn);
    [i,j] = find(triu(conn,1)>0);
    K = length(i);
    stri = str(i);
    strj = str(j);

else                                % directed versions
    [ins,outs] = strengths(conn,1); %to modif rtention terms modify the input
                                    %do not touch this line
    [i,j] = find(conn>0);
    K = length(i);

    switch flag
        case 1
            stri = outs(i);
            strj = ins(j);
        case 2
            stri = ins(i);
            strj = outs(j);
        case 3
            stri = outs(i);
            strj = outs(j);
        case 4
            stri = ins(i);
            strj = ins(j);
    end
end

% compute assortativity
ass = ( sum(stri.*strj)/K - (sum(0.5*(stri+strj))/K)^2 ) / ...
    ( sum(0.5*(stri.^2+strj.^2))/K - (sum(0.5*(stri+strj))/K)^2 );



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
