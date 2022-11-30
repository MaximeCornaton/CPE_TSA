function [ddp,ci] = calculHistogramme(x,M)
% Traitements à effectuer :
% - si le nombre d’intervalles M n’est pas spécifié :
% ? appliquer la règle empirique de calcul optimal de ?x (vue en TD)
% ? calculer le centre de chaque intervalle de l’histogramme correspondant à ce choix de ?x
% ? calculer l’histogramme correspondant
% - si le nombre d’intervalles M est spécifié :
% ? déterminer la largeur des intervalles ?x correspondant à ce choix de M
% ? calculer l’histogramme correspondant
% - déduire de l’histogramme calculé une estimation de la densité de probabilité de x
% - afficher dans la figure et le graphe courants la densité de probabilité estimée
% - labéliser les axes en indiquant la valeur de ?x utilisée (et préciser si celle-ci est optimale ou imposée).
% Donner un titre pertinent (distinctif) au graphe.
% 
% Paramètres d’entrée :
% - x : le vecteur des N échantillons d’un signal aléatoire x(t)
% - paramètre optionnel : M le nombre d’intervalles imposés pour le calcul de l’histogramme
% 
% Variables de sortie :
% - ddp : le vecteur des valeurs de la densité de probabilité estimée
% - ci : le vecteur des centres d’intervalles calculés

minimum = min(x);
maximum = max(x);
if(exist('M','var'))
    deltax=(maximum-minimum)/M;
else
    deltax=3.49.*std(x)*length(x) ^(-1/3);
    M=(maximum-minimum)/deltax;
    
end
[N,ci]=hist(x,M);
ddp = N/length(x)/deltax;
%bar(ci,ddp,'r');
%xlabel('signal aleatoire');
%ylabel('densite de probabilite');
%title("densite de probabilite d'un signal aleatoire avec delta_x");
end




