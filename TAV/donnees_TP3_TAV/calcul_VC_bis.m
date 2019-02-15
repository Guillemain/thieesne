function VC = calcul_VC_bis(D_app,beta_0,beta_5,d,lambda)
%CALCUL_VC Summary of this function goes here
%   Detailed explanation goes here
n_app = length(D_app);
VC = 0;
A = [];
for i = 2:n_app-1
    D_app_temp = D_app(:,[1:n_app] ~=i);
    beta_app = moindres_carres_ecretes(D_app_temp,beta_0,beta_5,d,lambda);
    % Test sur la seule valeur qui n'est pas de la base d'apprentissage.
    yi_estime = bezier(beta_0,beta_app,beta_5,  D_app(1,i));
    VC = VC + (yi_estime - D_app(2,i))^2;
    
end

