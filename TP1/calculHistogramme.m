function [ddp,ci] = calculHistogramme(x,M)
% Traitements � effectuer :
% - si le nombre d�intervalles M n�est pas sp�cifi� :
% ? appliquer la r�gle empirique de calcul optimal de ?x (vue en TD)
% ? calculer le centre de chaque intervalle de l�histogramme correspondant � ce choix de ?x
% ? calculer l�histogramme correspondant
% - si le nombre d�intervalles M est sp�cifi� :
% ? d�terminer la largeur des intervalles ?x correspondant � ce choix de M
% ? calculer l�histogramme correspondant
% - d�duire de l�histogramme calcul� une estimation de la densit� de probabilit� de x
% - afficher dans la figure et le graphe courants la densit� de probabilit� estim�e
% - lab�liser les axes en indiquant la valeur de ?x utilis�e (et pr�ciser si celle-ci est optimale ou impos�e).
% Donner un titre pertinent (distinctif) au graphe.
% 
% Param�tres d�entr�e :
% - x : le vecteur des N �chantillons d�un signal al�atoire x(t)
% - param�tre optionnel : M le nombre d�intervalles impos�s pour le calcul de l�histogramme
% 
% Variables de sortie :
% - ddp : le vecteur des valeurs de la densit� de probabilit� estim�e
% - ci : le vecteur des centres d�intervalles calcul�s

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




