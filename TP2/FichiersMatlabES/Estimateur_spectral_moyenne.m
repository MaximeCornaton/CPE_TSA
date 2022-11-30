function [DSP,f] = Estimateur_spectral_moyenne(x,N,M,NFFT)
% On élaborera une fonction qui a comme paramètres d’entrée:
% • le nom de la variable contenant les données à analyser,
% • le nombre N d’échantillons total à analyser,
% • le nombre M d’échantillons par segment,
% • le nombre de points de transformée de Fourier NFFT
% effectue les opérations suivantes :
% • selection de la séquence à analyser
% • calcul grâce à la fonction pwelch.m, de l’estimation , pour la séquence de N
% échantillons considérée pour f allant de 0 à 1-Df
% et fournira comme paramètres de sortie :
% • l’estimation calculée
% • le vecteur de fréquence allant de 0 à 1-Df correspondant

seq = x(1:N);
window = rectwin(M);
noverlap = 0;
[Pxx,w] = pwelch(seq,window,noverlap,NFFT,1,'twosided');
DSP = Pxx;
f=w;
end 
