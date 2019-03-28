function VC = calcul_VC_bis(D_app,beta_0,beta_d,d,lambda)
%CALCUL_VC Summary of this function goes here
%   Detailed explanation goes here

VC = 0;
n_app = length(D_app);
for j = 1:n_app
    D_appLOO = D_app;
    D_appLOO(:,j) = [];
    beta_estime = moindres_carres_ecretes( D_appLOO,beta_0,beta_d,d,lambda);
    y_estime = bezier(beta_0,beta_estime,beta_d,D_app(1,j));
    VC = VC + (D_app(2,j)-y_estime)^2;
end

VC = VC/n_app;

end

