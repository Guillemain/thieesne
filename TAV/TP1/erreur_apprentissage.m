function err = erreur_apprentissage(D_app,beta_0,beta_5,d)
%ERREUR_APPRENTISSAGE Summary of this function goes here
%   Detailed explanation goes here
beta_estime = moindres_carres(D_app,beta_0,beta_5,d);
y_estime = bezier(beta_0,beta_estime,beta_5,D_app(1,:));
err = sum((y_estime - D_app(2,:)).^2)/length(y_estime);
end

