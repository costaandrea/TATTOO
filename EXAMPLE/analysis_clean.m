close all
clear all
clc

cd C:\Users\andre\Desktop\TOOLBOX_graphtheory\ANAL

%%%
%%%define variables and load values
%%%

%%load all file
buba_5w = xlsread('STATSrmins_5_frac_clean.xls');
buba_4w = xlsread('STATSrmins_4_frac_clean.xls');
buba_3w = xlsread('STATSrmins_3_frac_clean.xls');
buba_2w = xlsread('STATSrmins_2_frac_clean.xls');
buba_1w = xlsread('STATSrmins_1_frac_clean.xls');

%%legend
[~,ff] = xlsread('STATSrmins_5_frac_clean.xls');
ff = ff(2:21,1);

%%number of significant correlations
snumb_5w = buba_5w(1:21,5);
snumb_4w = buba_4w(1:21,5);
snumb_3w = buba_3w(1:21,5);
snumb_2w = buba_2w(1:21,5);
snumb_1w = buba_1w(1:21,5);
snumbs = cat(2,snumb_1w,snumb_2w,snumb_3w,snumb_4w,snumb_5w);

%%correlation values
correlations_5w = buba_5w(1:21,2);
correlations_4w = buba_4w(1:21,2);
correlations_3w = buba_3w(1:21,2);
correlations_2w = buba_2w(1:21,2);
correlations_1w = buba_1w(1:21,2);
correlations = cat(2,correlations_1w,correlations_2w,correlations_3w,...
    correlations_4w,correlations_5w);

correlationsall=correlations;
correlations(snumbs<10)=NaN;

%%correlation standard deviation
corrstd_5w = buba_5w(1:21,3);
corrstd_4w = buba_4w(1:21,3);
corrstd_3w = buba_3w(1:21,3);
corrstd_2w = buba_2w(1:21,3);
corrstd_1w = buba_1w(1:21,3);
corrstd = cat(2,corrstd_1w,corrstd_2w,corrstd_3w,...
    corrstd_4w,corrstd_5w);

%%most important site for graph theory
mimpgt_5w = buba_5w(1:21,6);
mimpgt_4w = buba_4w(1:21,6);
mimpgt_3w = buba_3w(1:21,6);
mimpgt_2w = buba_2w(1:21,6);
mimpgt_1w = buba_1w(1:21,6);

%%most important site for metapop
mimpmm_5w = buba_5w(1:21,7);
mimpmm_4w = buba_4w(1:21,7);
mimpmm_3w = buba_3w(1:21,7);
mimpmm_2w = buba_2w(1:21,7);
mimpmm_1w = buba_1w(1:21,7);

%%10\% matching percentage
ctop_5w = buba_5w(1:21,9);
ctop_4w = buba_4w(1:21,9);
ctop_3w = buba_3w(1:21,9);
ctop_2w = buba_2w(1:21,9);
ctop_1w = buba_1w(1:21,9);
ctop = cat(2,ctop_1w,ctop_2w,ctop_3w,...
    ctop_4w,ctop_5w);

%%top site matching percentage
sctop_5w = buba_5w(1:21,8);
sctop_4w = buba_4w(1:21,8);
sctop_3w = buba_3w(1:21,8);
sctop_2w = buba_2w(1:21,8);
sctop_1w = buba_1w(1:21,8);
sctop = cat(2,sctop_1w,sctop_2w,sctop_3w,...
    sctop_4w,sctop_5w);


%%%plotting correlations
figure;hold on
%set(gcf, 'Position', [0 0 1600 600])

%define stuff 
SC = correlationsall/1 .* snumbs/20;

Q = floor(100000000*(1/size(SC,1))) /100000000; %for tuning color

Z =  alphabet(size(SC,1));
Y = {'p','h','p','h','p','h','h','d','d','o','o','o','^','^',...
    'x','^','x','x','s','s','*','*','*','*'};

%plot
for ii=1:size(SC,1)

    plot(1:5,SC(ii,:),...
         ['-',Y{ii}],'color', Z(ii,:),...
         'linewidth',2.5,'markersize',16);
    
end

set(gca,'fontsize',22)
xlabel('Weeks','fontsize',22)
ylabel('SC','fontsize',24)
axis([.9 5.1 -.11 .81])
set(gca,'xtick',1:5)
grid on

ll=legend(ff,'fontsize',26);
set(ll,'Location','eastoutside')

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 50 35]); %boh  boh  x_width[cm]  y_width

%printing
saveas(gcf,'fig2_clean.tif')
close all


%%%plotting top 10% mip matching percentage
figure;hold on
for ii=1:size(correlationsall,1)
   
    plot(1:5,ctop(ii,:),...
         ['-',Y{ii}],'color', Z(ii,:),...
         'linewidth',2.5,'markersize',16);
     
end
set(gca,'fontsize',16)
xlabel('Weeks','fontsize',14)
ylabel('Top$~10\%$ average matching','interpreter','latex','fontsize',20)
axis([.9 5.1 -.1 3.51])
set(gca,'xtick',1:5)
grid on

ll=legend(ff,'fontsize',16);
set(ll,'Location','eastoutside')

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 40 18]); %x_width=10cm y_width=15cm

%printing
saveas(gcf,'fig4_clean.tif')
close all


%%%plotting mips matching percentage
figure;hold on
for ii=1:size(correlationsall,1)
    
    plot(1:5,sctop(ii,:),...
         ['-',Y{ii}],'color', Z(ii,:),...
         'linewidth',2.5,'markersize',16);
     
end
set(gca,'fontsize',16)
xlabel('Weeks','fontsize',14)
ylabel('Top site matching $\%$','interpreter','latex','fontsize',20)
axis([.9 5.1 -.1 .71])
set(gca,'xtick',1:5)
grid on

ll=legend(ff,'fontsize',16);
set(ll,'Location','eastoutside')

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 40 18]); %x_width=10cm y_width=15cm

%printing
saveas(gcf,'fig5_clean.tif')
close all



%%%plotting correlation matrices   
for ii=1:5
    weeks=ii;
    cm = xlsread(['STATSrmins_',num2str(weeks),'_frac_clean.xls'],1,'A25:U45');
    
    cm=cm+eye(length(cm));
    
    figure
    set(gcf, 'Position', [0 0 1200 1200])
    b=imagesc(flipud(cm)); 
    set(b,'AlphaData',~isnan(flipud(cm)))
    cb=colorbar;
    title({[num2str(weeks),' weeks'],''},'fontsize',18)
    set(gca,'xtick',1:length(cm))
    %set(gca,'xticklabel',ff,'fontsize',14)
    set(gca,'xticklabel',[])
    set(gca,'ytick',1:length(cm))
    set(gca,'yticklabel',fliplr(ff),'fontsize',14)
  
    caxis([-1 1])
    
    colormap(jet(256))
    
    set(cb,'YTickLabel',{'-1.0','-0.8','-0.5','-0.3','-0.1',' 0.0',' 0.1',' 0.3',' 0.5',' 0.8',' 1.0'}, ...
           'YTick', [-1 -.8 -.5 -.3 -.1 0 .1 .3 .5 .8 1]);
    set(gca,'TickDir','out','TickLength',[0.005 0.005]);
    
    print(['cm',num2str(weeks),'_clean'], '-dpng','-r1200')
    %set(gcf, 'PaperUnits', 'centimeters');
    %set(gcf, 'PaperPosition', [0 0 30 30]); %x_width y_width
    %saveas(gcf,['cm',num2str(weeks),'.tif'])
    
    close all
    clear cmap
    
end
