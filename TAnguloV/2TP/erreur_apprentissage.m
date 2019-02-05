function err = erreur_apprentissage(D_app,beta_0,beta_d,d)
%ERREUR_APPRENTISSAGE Summary of this function goes here
%   Detailed explanation goes here
beta_estime = moindres_carres( D_app,beta_0,beta_d,d );
y_estime = bezier(beta_0,beta_estime,beta_d,D_app(1,:)');

err = rms(D_app(2,:)-y_estime');


end

