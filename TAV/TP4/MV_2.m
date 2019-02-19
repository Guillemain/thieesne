function param = MV_2(D_app,parametres_test,sigma);

erreur = [];
for i = [1:size(parametres_test,1)]
    r1 = calcul_r(D_app, parametres_test(i,1,:));
    r2 = calcul_r(D_app, parametres_test(i,2,:));
    err = sum(log(0.5*exp(-0.5*r1.^2/(sigma)^2) + 0.5*exp(-0.5*r2.^2/(sigma)^2)));
    erreur = [erreur; err];
end
[~,indice] = max(erreur);
param = parametres_test(indice,:,:);

end

