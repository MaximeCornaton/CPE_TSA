clear variables;
clear all;

%%Variables

signal = genbrfil;

N_echan = 4096; 
M = 1500;
NFFT = 2^12;

[DSP,f] = Estimateur_spectral_moyenne(signal,N_echan,M,NFFT);
[Gth,Gbiais,f2]=sptheo(N_echan,'moyenne');

%%Affichage
plot(f,10*log10(DSP),'b',f2,Gth,'r',f2,Gbiais,'g');axis([0 0.5 -50 10]);
title(['Etude du biais et de la variance pour un nombre N=',num2str(N_echan)]);
legend('Densité spectrale de puissance moyenne estimée','Densité spectrale de puissance moyenne vraie','Biais theorique');


