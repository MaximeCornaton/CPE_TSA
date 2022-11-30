function [DSP,f,N] = Estimateur_spectral_simple(x,nd,nf,NFFT)
% On élaborera une fonction dont les paramètres d’entrée seront :
% • le nom de la variable contenant le bruit filtré à analyser,
% • le numéro du premier échantillon de la séquence à prendre en compte nd,
% • le numéro du dernier échantillon de la séquence à prendre en compte nf,
% • le nombre de points de transformée de Fourier NFFT (choisir une puissance de 2).
% Et qui executera les opérations suivantes
% • selection de la séquence à analyser
% • calcul du nombre d’échantillons résultant N à analyser
% • calcul de l’estimation pour la séquence considérée et pour f allant de 0 à 1-Df .
% Cette fonction fournira en paramètres de sortie :
% • l’estimation calculée
% • le vecteur de fréquence allant de 0 à 1-Df correspondant
% • le nombre N d’échantillons de bruit analysés

  %séquence à analyser
  seq = x(nd:nf);
  
  %nombre d’échantillons N à analyser
  N = nf-nd+1;
  
  %estimation pour la séquence à analyser
  SEQ = fft(seq,NFFT);
  f = 0:1/NFFT:1-1/NFFT;
  DSP = 1/N*abs(SEQ).^2;
  %%plot(f,DSP);
end

