function E=efficiency_w(conn,loc)
%efficiency_w Calculates global or local efficiency of a weigthed graph.
% A connectivity matrix is here transformed in a distance according to
% log(1/c_ij)
%
%   Inputs:     CONN is a weighted undirected/directed connectivity matrix
%                               (all weights in CONN must be between 0 and 1)
%               LOC, loc=0 for global efficiency
%                    loc=1 for local efficiency
%
%   Output:     E is either the global efficiency (scalar)
%                        or the local efficiency (vector)
%
%   Notes:
%   The local efficiency is the global efficiency computed on the
%   neighborhood of the node, and is related to the clustering coefficient.
%   The global efficiency is the average of inverse shortest path length,
%   and is inversely related to the characteristic path length.
%       The  efficiency is computed using an auxiliary connection-length
%   matrix L, defined as L_ij = 1/W_ij for all nonzero L_ij; This has an
%   intuitive interpretation, as higher connection weights intuitively
%   correspond to shorter lengths.
%       The weighted local efficiency broadly parallels the weighted
%   clustering coefficient of Onnela et al. (2005) and distinguishes the
%   influence of different paths based on connection weights of the
%   corresponding neighbors to the node in question. In other words, a path
%   between two neighbors with strong connections to the node in question
%   contributes more to the local efficiency than a path between two weakly
%   connected neighbors. Note that this weighted variant of the local
%   efficiency is hence not a strict generalization of the binary variant.
%
%   References: Latora and Marchiori (2001) Phys Rev Lett 87:198701.
%               Onnela et al. (2005) Phys Rev E 71:065103
%               Fagiolo (2007) Phys Rev E 76:026107.
%               Rubinov M, Sporns O (2010) NeuroImage 52:1059-69
%
%This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 
%3.0 Unported License. See notes at the end of this file for more information.

%Author: Mika Rubinov
%Modified by Andrea Costa vesrion 2017.10.31
%andrea.costa@pusan.ac.kr


N=length(conn);  %number of nodes

L = conn;
A = conn~=0;
ind = L~=0;
L(ind) = log(1./L(ind));%1./L(ind);      %connection-length matrix

if exist('local','var') && loc  %local efficiency
    E=zeros(N,1);
    for u=1:N
        V=find(A(u,:)|A(:,u).');                %neighbors
        sw=conn(u,V).^(1/3)+conn(V,u).^(1/3).';       %symmetrized weights vector
        e=distance_inv_w(L(V,V));             %inverse distance matrix
        se=e.^(1/3)+e.'.^(1/3);                 %symmetrized inverse distance matrix
        numer=(sum(sum((sw.'*sw).*se)))/2;      %numerator
        if numer~=0
            sa=A(u,V)+A(V,u).';                 %symmetrized adjacency vector
            denom=sum(sa).^2 - sum(sa.^2);      %denominator
            E(u)=numer/denom;                   %local efficiency
        end
    end
else
    e=distance_inv_w(L);
    E=sum(e(:))./(N^2-N);                       %global efficiency
end


function D=distance_inv_w(W_)

n_=length(W_);
D=inf(n_);                                      %distance matrix
D(1:n_+1:end)=0;

for u=1:n_
    S=true(1,n_);                               %distance permanence (true is temporary)
    W1_=W_;
    V=u;
    while 1
        S(V)=0;                                 %distance u->V is now permanent
        W1_(:,V)=0;                             %no in-edges as already shortest
        for v=V
            T=find(W1_(v,:));                   %neighbours of shortest nodes
            D(u,T)=min([D(u,T);D(u,v)+W1_(v,T)]);%smallest of old/new path lengths
        end
        
        minD=min(D(u,S));
        if isempty(minD)||isinf(minD),          %isempty: all nodes reached;
            break,                              %isinf: some nodes cannot be reached
        end;
        
        V=find(D(u,:)==minD);
    end
end


D=log(1./D);%1./D;                       %invert distance
D(1:n_+1:end)=0;


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
