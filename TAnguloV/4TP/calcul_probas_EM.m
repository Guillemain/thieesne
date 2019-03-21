function probas = calcul_probas_EM( D_app,parametres_estim,prop_1,prop_2,sigma )
%CALCUL_PROBAS Summary of this function goes here
%   Detailed explanation goes here

    
    r1 = calcul_r(D_app,parametres_estim(1,:));
    r2 = calcul_r(D_app,parametres_estim(2,:));
    p1 = (prop_1/sigma)*exp((-1/(2*sigma^2))*(r1.^2));
    p2 = (prop_2/sigma)*exp((-1/(2*sigma^2))*(r2.^2));
    
    P1 = p1./(p1+p2);
    
    probas = [p1;p2];

end

