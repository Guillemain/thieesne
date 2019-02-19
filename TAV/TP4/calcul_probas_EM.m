function k = calcul_probas_EM(D_app,param,prop_1,prop_2,sigma)
terme1 = prop_1/sigma * exp(- calcul_r(D_app,param(1,:)).^2/(2*sigma^2));
terme2 = prop_2/sigma * exp(- calcul_r(D_app,param(2,:)).^2/(2*sigma^2));
k = [];
k = terme1./(terme1+terme2);
k = [k ; terme2./(terme1+terme2)];


end

