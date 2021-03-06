function [color,name] = alphabet(num_or_str,pie_chart)
% alphabet  a colormap with the alphabet of colors
%   
%   alphabet provides a colormap with 26 clearly distinguishable
%   colors corresponding to the letters of the alphabet, see
%   http://en.wikipedia.org/wiki/Help:Distinguishable_colors.
%
%   alphabet complies with standard syntax for colormaps. In addition,
%   [color,name] = alphabet(num_or_str,pie_chart) works as follows:
%
%   num_or_str is either the wanted number of colors or a string 
%   whose characters are the initials of the colors to be selected. If
%   pie_chart is nonzero, a pie chart with colors and names is drawn. 
%   The default values are num_or_str = 26 and pie_chart = 0.
%   color is a matrix of rgb colors, and name is a cell array of names.
%
% See also: colormap, alphabetdemo
%
%This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 
%3.0 Unported License. See notes at the end of this file for more information.

% Author: Ulrich Reif
% March 23, 2015

if nargin==0
  num_or_str = 26;
end

if ischar(num_or_str)
  I = lower(num_or_str) - 'a' + 1;
else
  I = mod(0:num_or_str-1,26) + 1;
end

C = [...
240,163,255;0,117,220;153,63,0;76,0,92;25,25,25;0,92,49;43,206,72;...
255,204,153;128,128,128;148,255,181;143,124,0;157,204,0;194,0,136;...
0,51,128;255,164,5;255,168,187;66,102,0;255,0,16;94,241,242;0,153,143;...
224,255,102;116,10,255;153,0,0;255,255,128;255,255,0;255,80,5]/255;
N = {...
'Amethyst','Blue','Caramel','Damson','Ebony','Forest','Green',...
'Honeydew','Iron','Jade','Khaki','Lime','Mallow',...
'Navy','Orpiment','Pink','Quagmire','Red','Sky','Turquoise',...
'Uranium','Violet','Wine','Xanthin','Yellow','Zinnia'};

color = C(I,:);
name  = N(I);

if nargin==2 && any(pie_chart(:))
  figure
  pie(0*I+1,name(end:-1:1))
  colormap(color(end:-1:1,:))
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
