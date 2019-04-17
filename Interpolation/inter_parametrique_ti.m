function Coordonnees = inter_parametrique_ti(XY,nb_points,type_ti)
%INTER_PARAMATRIQUE, interpole de manière paramétrique une courbe passant par tout les points [xi,yi].
% type_ti : 1 : Tchebytchev
%           2 : norme2
%           3 : norme1
%           autes : [0,1]
%
n = size(XY,2);


%%Definition des ti
switch type_ti
    case 1 %% Tchebytchev
        Ti = [];
        for k = 0:n-1
            Ti = [Ti cos((2*k+1)*pi/(2*n))]; 
        end
    case 2
        Ti = [norm(XY(:,1)-XY(:,2))];
        for k = 2:n
            Ti = [Ti (Ti(k-1) + norm(XY(:,k)-XY(:,k-1)))];
        end
    case 3
        Ti = [norm(XY(:,1)-XY(:,2),1)];
        for k = 2:n
            Ti = [Ti (Ti(k-1) + norm(XY(:,k)-XY(:,k-1)))];
        end
    otherwise
        Ti = linspace(0,1,n); % Pas de 'e'
end

nb_interpoles = nb_points;

t = linspace(min(Ti),max(Ti),nb_interpoles);
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