function VC = calcul_VC_ter(D_app,beta_0,beta_d,d,lambda,A)
%CALCUL_VC Summary of this function goes here
%   Detailed explanation goes here

VC = 0;
n_app = length(D_app);
beta_estime = moindres_carres_ecretes( D_app,beta_0,beta_d,d,lambda);
y_estime = bezier(beta_0,beta_estime,beta_d,D_app(1,:));

S = A*inv(A'*A + lambda*eye(d-1))*A';

for j = 1:n_app
    VC = VC + ((D_app(2,j)-y_estime(j))/(1-S(j,j)))^2;
end

VC = VC/n_app;

end

