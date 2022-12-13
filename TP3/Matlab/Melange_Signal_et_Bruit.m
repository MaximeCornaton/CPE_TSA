clear variables;
clear all;

%Synthèse du signal S(t)

Fs = 500;
vo = 100;
ordre = 6;

Fc =100;

T = 100;

Sp = struct('Fs',Fs,'A',1,'Fc',Fc,'FM',0,'Phi',0,'T',T,'W',[]);
figure(1);
[S,Sp,M] = OOK(Sp);

%Synthèse du bruit B(t)

sigma = sqrt(5);
B = 160;

Xp = struct('sigma',sigma,'Fs',Fs,'B',B,'T',T) ;
figure(9);
[Bruit,Xp] = CGN(Xp);

moy_X = mean(Bruit.data);
var_X = std(Bruit.data)^2;


%Etude du filtre passe-bande F1
X=AddSig(S,Bruit);

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
