function [DSP,f] = Estimateur_spectral_moyenne(x,N,M,NFFT)
% On �laborera une fonction qui a comme param�tres d�entr�e:
% � le nom de la variable contenant les donn�es � analyser,
% � le nombre N d��chantillons total � analyser,
% � le nombre M d��chantillons par segment,
% � le nombre de points de transform�e de Fourier NFFT
% effectue les op�rations suivantes :
% � selection de la s�quence � analyser
% � calcul gr�ce � la fonction pwelch.m, de l�estimation , pour la s�quence de N
% �chantillons consid�r�e pour f allant de 0 � 1-Df
% et fournira comme param�tres de sortie :
% � l�estimation calcul�e
% � le vecteur de fr�quence allant de 0 � 1-Df correspondant

seq = x(1:N);
window = rectwin(M);
noverlap = 0;
[Pxx,w] = pwelch(seq,window,noverlap,NFFT,1,'twosided');
DSP = Pxx;
f=w;
end 
