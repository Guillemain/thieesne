function err = erreur_generalisation( D_test,D_app,beta_0,beta_d,d )
%ERREUR_GENERALISATION Summary of this function goes here
%   Detailed explanation goes here

beta_estime = moindres_carres( D_app,beta_0,beta_d,d );
y_estime = bezier(beta_0,beta_estime,beta_d,D_test(1,:)');

err = rms(D_test(2,:)-y_estime');

end

