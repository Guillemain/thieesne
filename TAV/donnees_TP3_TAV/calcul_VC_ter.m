function VC = calcul_VC_ter(D_app,beta_0,beta_5,d,lambda,A);
%CALCUL_VC Summary of this function goes here
%   Detailed explanation goes here
n_app = length(D_app);
VC = 0;
% Calcul de S.
S = A*(A'*A+lambda*eye(d-1))^(-1)*A';
beta_app = moindres_carres_ecretes(D_app,beta_0,beta_5,d,lambda);
for j = 1:n_app
   yi_estime = bezier(beta_0,beta_app,beta_5,  D_app(1,j));
   VC = VC + ((yi_estime - D_app(2,j))^2)/(1 - S(j,j));
end
end

