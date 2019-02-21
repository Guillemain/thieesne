function M = raideur_loc(p1,p2,p3)
%RAIDEUR_LOC Calcule la matrice de raideur locale au triangle de
%coordonnées (p1,p2,p3)
%   
det_sys = (p2(1) - p1(1))*(p3(2) - p1(2)) - (p3(1) - p1(1))*(p2(2) - p1(2)); % Calcul de alpha

M = zeros(3,3);

Points = [p1(:)';p2(:)';p3(:)']; % On concatène les points pour les calculs 
g_h1 = grad_heta(Points,1);
g_h2 = grad_heta(Points,2);
g_h3 = grad_heta(Points,3);

grad_heta = [g_h1 g_h2 g_h3];

for i = 1:3
   for j = i:3
       M(i,j) = 1/(2 * det_sys) * grad_heta(:,i)'*grad_heta(:,j); 
       M(j,i) = M(i,j); % Comme c'est symétrique, on en profite.
   end
end

end

function g = grad_heta(Points,k)
% Calcul le gradient de heta_k * determinant_systeme

g = [(Points(mod(k,3)+1,2) - Points(mod(k+1,3)+1,2));
    (Points(mod(k+1,3)+1,1) - Points(mod(k,3)+1,1))];
end