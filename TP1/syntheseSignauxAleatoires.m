function [x1,x2,x3,A,B] = syntheseSignauxAleatoires(N,Bande,m3,sigma3)
% Traitements à effectuer dans la fonction :
% - génération d’une séquence x1(t) de bruit gaussien échantillonné (à la fréquence Fs), centré et d’écart-
% type ?1 = 1
% - synthèse d’un filtre de Butterworth de type passe-bas, de fréquence de coupure fc correspondant à la
% largeur de bande B et d’ordre m = 8
% - filtrage du bruit x1(t) par le filtre passe-bas pour obtenir le bruit filtré x2(t)
% - transformation de x2(t) pour obtenir x3(t) de valeur moyenne m3 et d’écart-type ?3
%
% Paramètres d’entrée :
% - le nombre N d’échantillons à générer
% - la largeur de bande B du filtre passe-bas
% - la moyenne m3 et l’écart-type ?3 du bruit x3(t).
% 
% Variables de sortie :
% - les vecteurs des échantillons de x1, x2 et x3
% - les coefficients de la fonction de transfert du filtre passe-bas (coefficients des polynômes A(z) et B(z))

x1 = randn(1,N);
m = 8; %ordre du filtre
Fs = 1000; %frequence d'echantillonnage
Wn = 2*Bande/Fs; % frequence de coupure normalisee
[B,A] = butter(m, Wn); %coef du filtre
x2 = filter(B,A,x1); %filtrage
sigma2 = std(x2);
m2 = mean(x2);
x3 = (x2-m2)/sigma2*sigma3+m3; 

end

