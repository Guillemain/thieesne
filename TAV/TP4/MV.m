function param = MV(D_app,parametres_test);
erreur = [];
for i = [1:size(parametres_test,1)]
    r = calcul_r(D_app, parametres_test(i,:));
    erreur = [erreur; sum(r.^2)];
end
[~,indice] = min(erreur);
param = parametres_test(indice,:);

end

