function [DSP,f,N] = Estimateur_spectral_simple(x,nd,nf,NFFT)
% On �laborera une fonction dont les param�tres d�entr�e seront :
% � le nom de la variable contenant le bruit filtr� � analyser,
% � le num�ro du premier �chantillon de la s�quence � prendre en compte nd,
% � le num�ro du dernier �chantillon de la s�quence � prendre en compte nf,
% � le nombre de points de transform�e de Fourier NFFT (choisir une puissance de 2).
% Et qui executera les op�rations suivantes
% � selection de la s�quence � analyser
% � calcul du nombre d��chantillons r�sultant N � analyser
% � calcul de l�estimation pour la s�quence consid�r�e et pour f allant de 0 � 1-Df .
% Cette fonction fournira en param�tres de sortie :
% � l�estimation calcul�e
% � le vecteur de fr�quence allant de 0 � 1-Df correspondant
% � le nombre N d��chantillons de bruit analys�s

  %s�quence � analyser
  seq = x(nd:nf);
  
  %nombre d��chantillons N � analyser
  N = nf-nd+1;
  
  %estimation pour la s�quence � analyser
  SEQ = fft(seq,NFFT);
  f = 0:1/NFFT:1-1/NFFT;
  DSP = 1/N*abs(SEQ).^2;
  %%plot(f,DSP);
end

