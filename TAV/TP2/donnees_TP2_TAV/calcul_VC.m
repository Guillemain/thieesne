function VC = calcul_VC(D_app,beta_0,beta_5,d)
%CALCUL_VC Summary of this function goes here
%   Detailed explanation goes here
n_app = length(D_app);
VC = 0;
A = [];
for i = 2:n_app-1
    D_app_temp = D_app(:,[1:n_app] ~=i);
    beta_app = moindres_carres(D_app_temp,beta_0,beta_5,d);
    % Test sur la seule valeur qui n'est pas de la base d'apprentissage.
    yi_estime = bezier(beta_0,beta_app,beta_5,  D_app(1,i));
    VC = VC + (yi_estime - D_app(2,i))^2;
    
end
VC = VC/n_app;
end

