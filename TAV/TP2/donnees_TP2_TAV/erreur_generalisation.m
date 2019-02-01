function err = erreur_generalisation(D_test,D_app,beta_0,beta_5,d)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
beta_app = moindres_carres(D_app,beta_0,beta_5,d);
y_estime = bezier(beta_0,beta_app,beta_5,D_test(1,:));
err = sum((y_estime - D_test(2,:)).^2)/length(D_test);
end

