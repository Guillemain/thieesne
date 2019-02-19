function X = MC(D)
%MC Summary of this function goes here
%   Detailed explanation goes here
% Création de la matrice A :
phi = ones(size(D,2),1);
A = [(D(1,:).^2)' (D(1,:).*D(2,:))' (D(2,:).^2)' (D(1,:))' (D(2,:))' phi]; % Equation Homogène
A = [A ; 1 0 0 0 0 1]; 
b = zeros(size(D,2),1); % Second membre
b = [b ; 1];
X = (A\b)';

end

