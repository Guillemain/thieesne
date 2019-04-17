function Coordonnees = inter_parametrique(XY,t)
%INTER_PARAMATRIQUE, interpole de manière paramétrique une courbe passant
%par tout les points [xi,yi].
n = size(XY,2);
nb_interpoles = length(t);

Ti = linspace(0,1,n); % Pas de 'e'

Coordonnees = zeros(2,nb_interpoles);
for i = 1:n
Coordonnees = Coordonnees + XY(:,i).*ones(2,nb_interpoles).*Lagrange_coef(Ti,i,t);
end
end

function Li = Lagrange_coef(T,i,x)
    Li = [1];
    A = 1:length(T);
    A(i) =[];
    for k = A
        Li = Li.*(x-T(k))/(T(i)-T(k));
    end
end