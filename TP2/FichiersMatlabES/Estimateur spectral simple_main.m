clear variables;
clear all;

%%Variables

signal = genbrfil;

N_echan = 8191;
nd = 1;
nf = nd+N_echan;
NFFT = 2^15;

[DSP,f,N] = Estimateur_spectral_simple(signal,nd,nf,NFFT);
[Gth,Gbiais,f2]=sptheo(N,'simple');

%%Affichage
plot(f,10*log10(DSP),'b',f2,Gth,'r',f2,Gbiais,'g');axis([0 0.5 -50 10]);
title(['Etude du biais et de la variance pour un nombre N=',num2str(N_echan+1),' d’échantillons de bruit (debut nd=',num2str(nd),')']);
legend('Densité spectrale de puissance moyenne estimée','Densité spectrale de puissance moyenne vraie','Biais theorique');


