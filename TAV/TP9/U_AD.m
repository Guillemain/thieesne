function [U] = U_AD(R,X,Y,I)
% Calcul la valeur de l'attache aux données d'un cercle.
gamma = 5.0;
S = 130;
U = sum(1-2/(1+exp(-gamma *((nvg_moyen(x,y,R,I))/(S) - 1))));
end

