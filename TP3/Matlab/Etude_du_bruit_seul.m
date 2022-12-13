clear variables;
clear all;

%Synthèse du bruit B(t)

Fs = 500;
sigma = sqrt(5);
B = 160;
vo = 100;
ordre = 6;

T = 100;

Xp = struct('sigma',sigma,'Fs',Fs,'B',B,'T',T) ;
[X,Xp] = CGN(Xp);

moy_X = mean(X.data)
var_X = std(X.data)^2

%Etude du filtre passe-bande F1
F0 = vo;
d_nu = 16;

Fp = struct('Fs',Fs,'F0',F0,'Dnu',d_nu,'order',ordre,'class','BP filter') ;  
figure(2);
[Y,Fp] = BPF(X,Fp);

moy_Y = mean(Y.data)
var_Y = std(Y.data)^2

%Elévation au carré et Filtrage RC passe-bas
produit = [2,20,100];
Z = SquareSig(Y);
for i=1:length(produit)
    
   produit1 = produit(i);
   RC= produit1 / d_nu;
   
   RCFp = struct('Fs',Fs,'RC',RC) ;
   figure(3-1+i);
   [W,RCFp] = RCF(Z,RCFp);

   
   W.data = W.data(Fs*10*RC:length(W.data));
   W.time = W.time(Fs*10*RC:length(W.time));
   
   moy_W = mean(W.data)
   var_W = std(W.data)^2
   kurtosis_W = kurtosis(W.data)
  
end

