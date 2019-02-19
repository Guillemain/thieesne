function X =  MC_ponderes(D,probas);
%MC Summary of this function goes here
%   Detailed explanation goes here
% Création de la matrice A :
phi = ones(size(D,2),1);
A = [(D(1,:).^2)'.*probas' (D(1,:).*D(2,:))'.*probas' (D(2,:).^2)'.*probas' (D(1,:))'.*probas' (D(2,:))'.*probas' phi.*probas']; % Equation Homogène
A;
A = [A ; 1 0 0 0 0 1]; 
b = zeros(size(D,2),1); % Second membre
b = [b ; 1];
X = (A\b)';

end

