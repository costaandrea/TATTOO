function W = weight_conversion(W, wcm)
% WEIGHT_CONVERSION    Conversion of weights in input matrix
%
%   W_bin = weight_conversion(W, 'binarize');
%   W_nrm = weight_conversion(W, 'normalize');
%   L = weight_conversion(W, 'lengths');
%   W_fix = weight_conversion(W, 'autofix');
%
%   This function may either binarize an input weighted connection matrix,
%   normalize an input weighted connection matrix, convert an input
%   weighted connection matrix to a weighted connection-length matrix, or
%   fix common connection problems in binary or weighted connection matrices.
%
%       Binarization converts all present connection weights to 1.
%
%       Normalization rescales all weight magnitudes to the range [0,1] and
%   should be done prior to computing some weighted measures, such as the
%   weighted clustering coefficient.
%
%       Conversion of connection weights to connection lengths is needed
%   prior to computation of weighted distance-based measures, such as
%   distance and betweenness centrality. In a weighted connection network,
%   higher weights are naturally interpreted as shorter lengths. The
%   connection-lengths matrix here is defined as the inverse of the
%   connection-weights matrix. 
%
%       Autofix removes all Inf and NaN values, remove all self connections 
%   (sets all weights on the main diagonal to 0), ensures that symmetric matrices 
%   are exactly symmetric (by correcting for round-off error), and ensures that 
%   binary matrices are exactly binary (by correcting for round-off error).
%
%   Inputs: W           binary or weighted connectivity matrix
%           wcm         weight-conversion command - possible values:
%                           'binarize'      binarize weights
%                           'normalize'     normalize weights
%                           'lengths'       convert weights to lengths
%                           'autofix'       fixes common weights problems
%
%   Output: W_          output connectivity matrix
%
%This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 
%3.0 Unported License. See notes at the end of this file for more information.

%   Mika Rubinov, U Cambridge, 2012

%   Modification History:
%   Sep 2012: Original
%   Jan 2015: Added autofix feature.

switch wcm
    case 'binarize'
        W=double(W~=0);         % binarize
    case 'normalize'
        W=W./max(abs(W(:)));    % scale by maximal weight
    case 'lengths'
        E=find(W); 
        W(E)=1./W(E);           % invert weights
    case 'autofix'
        % clear diagonal
        n = length(W);
        W(1:n+1:end)=0;

        % remove Infs and NaNs
        idx = isnan(W) | isinf(W);
        if any(any(idx));
            W(idx)=0;
        end

        % ensure exact binariness
        U = unique(W);
        if numel(U)>1
            idx_0 = abs(U)<1e-10;
            idx_1 = abs(U-1)<1e-10;
            if all(idx_0 | idx_1)
                W(idx_0)=0;
                W(idx_1)=1;
            end
        end

        % ensure exact symmetry
        if ~isequal(W,W.');
            if max(max(abs(W-W.'))) < 1e-10;            
                W=(W+W).'/2;
            end
        end
    otherwise
        error('Unknown weight-conversion command.')
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
