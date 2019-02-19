function k = calcul_probas(D_app,param,sigma);
k = [];
k = 0.5/sigma * exp(-calcul_r(D_app,param(1,:)).^2/(2*sigma^2));
k = [k ; 0.5/sigma * exp(-calcul_r(D_app,param(2,:)).^2/(2*sigma^2))];

end

