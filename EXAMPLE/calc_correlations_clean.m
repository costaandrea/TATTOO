clear all
close all
clc

cosa = 'RMINS';
flag = 1;  %1 for rmin %0 for eigs
for sganga=1:5
    
weeks=num2str(sganga);
fprintf(['WEEKS = ',weeks,'\n\n'])

cd 'C:\Users\andre\Desktop\TOOLBOX_graphtheory\ANAL'
load(['stuff_',weeks,'w',cosa,'_clean'])


nn=4; %number of top sites

filename = ['STATS',cosa,'_',weeks,'_frac_clean'];
A = {[weeks,' weeks'],'Corr Value', 'std', 'p-value','Signif cases','most imp gt','most imp mm','prcnt correct', 'common sites'};
sheet = 1; %sganga;
xlRange = 'A1:I1';
xlswrite(filename,A,sheet,xlRange)



display('IN STRENGTH')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(ins,norma,4,flag);

A = {'In Strength', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A2:I2';
xlswrite(filename,A,sheet,xlRange)


display('IN STRENGTH w/ ret')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(ins_ret,norma,4,flag);

A = {'In Strength w/ ret', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A3:I3';
xlswrite(filename,A,sheet,xlRange)


display('OUT STRENGTH')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(outs,norma,4,flag);

A = {'Out Strength', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A4:I4';
xlswrite(filename,A,sheet,xlRange)


display('OUT STRENGTH w/ ret')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(outs_ret,norma,4,flag);

A = {'Out Strength w/ ret', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A5:I5';
xlswrite(filename,A,sheet,xlRange)


display('TOT STRENGTH')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(tots,norma,4,flag);

A = {'Tot Strength', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A6:I6';
xlswrite(filename,A,sheet,xlRange)


display('TOT STRENGTH w/ ret')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(tots_ret,norma,4,flag);

A = {'Tot Strength w/ ret', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A7:I7';
xlswrite(filename,A,sheet,xlRange)


display('Self Influx')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(rets,norma,4,flag);

A = {'Self Influx', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A8:I8';
xlswrite(filename,A,sheet,xlRange)


display('Self Influx ov. Influx')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(SI_I,norma,4,flag);

A = {'Self Influx / Influx', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A9:I9';
xlswrite(filename,A,sheet,xlRange)


display('Self Influx ov. Outflux')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(SI_O,norma,4,flag);

A = {'Self Influx / Outflux', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A10:I10';
xlswrite(filename,A,sheet,xlRange)


display('In-degree')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(din,norma,4,flag);

A = {'In-degree', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A11:I11';
xlswrite(filename,A,sheet,xlRange)


display('Out-degree')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(dout,norma,4,flag);

A = {'Out-degree', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A12:I12';
xlswrite(filename,A,sheet,xlRange)


display('Total degree')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(dtot,norma,4,flag);

A = {'Total degree', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A13:I13';
xlswrite(filename,A,sheet,xlRange)


display('Clustering Coefficient')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(cluscoeff,norma,4,flag);

A = {'Clustering Coefficient', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A14:I14';
xlswrite(filename,A,sheet,xlRange)


display('Eigenvalues')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(eigc,norma,4,flag);

A = {'Eigenvalues', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A15:I15';
xlswrite(filename,A,sheet,xlRange)


display('Cores')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(cores,norma,4,flag);

A = {'k-score', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A16:I16';
xlswrite(filename,A,sheet,xlRange)


display('BETWEENNESS')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(betw,norma,4,flag);

A = {'Betweenness', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A17:I17';
xlswrite(filename,A,sheet,xlRange)


display('Closeness binary')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(closen_b,norma,4,flag);

A = {'Closeness', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A18:I18';
xlswrite(filename,A,sheet,xlRange)


% display('Closeness weighted')
% [c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(closen_w,norma,4,flag);
% 
% A = {'Closeness weighted', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
% sheet = 1;
% xlRange = 'A19:I19';
% xlswrite(filename,A,sheet,xlRange)


display('Cycles') 
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(cyc,norma,4,~flag);

A = {'Shortest cycles', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A19:I19';
xlswrite(filename,A,sheet,xlRange)


display('Z score')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(Z,norma,4,flag);

A = {'Z score', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A20:I20';
xlswrite(filename,A,sheet,xlRange)


display('Participation out')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(PCout,norma,4,flag);

A = {'Participation out', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A21:I21';
xlswrite(filename,A,sheet,xlRange)


display('Participation in')
[c,sc,pv,nv,mimpgt,mimpmm,mimpgt_prcnt_eq_mm,swc] = correlamelo(PCin,norma,4,flag);

A = {'Participation in', c,sc, pv, nv, mimpgt, mimpmm,mimpgt_prcnt_eq_mm, swc};
sheet = 1;
xlRange = 'A22:I22';
xlswrite(filename,A,sheet,xlRange)



fprintf('Correlation matrix now... \n\n')

Ms = cat(3, ins, ins_ret, outs, outs_ret, tots, tots_ret, rets, din, dout, dtot,...
    SI_I, SI_O, cluscoeff, eigc, cores, betw, closen_b, cyc,...%closen_w, 
    Z, PCout, PCin);


combos = nchoosek(1:size(Ms,3),2);

CM=zeros(size(Ms,3));
for ii=1:size(combos,1) 
    
   for jj=1:size(Ms,1)

     [cc(jj),pp(jj)]=corr(Ms(jj,:,combos(ii,1))',Ms(jj,:,combos(ii,2))','type','Spearman');
                        
   end
   
   CM(combos(ii,1),combos(ii,2)) = mean(cc( pp<.05 ));
   clear pp cc

end
CM = (CM+CM.')/2;

figure
imagesc(CM)
colorbar

sheet = 1;
xlRange = 'A25:U45';
xlswrite(filename,CM,sheet,xlRange)

fprintf('\n======================\n\n')
end
