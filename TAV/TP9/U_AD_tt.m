function [U] = U_AD_tt(N,R,X,Y,I)
% Calcul la valeur de l'attache aux données de D(1:N)
U = [];
for k = 2:N
	U = [U; U_AD(R,X(k),Y(k),I)]; % la moyenne étant une opération de associative. On la calcule au fur et à mesure.
end
end

