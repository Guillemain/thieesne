function probas = calcul_probas( D_app,parametres_estim,sigma )
%CALCUL_PROBAS Summary of this function goes here
%   Detailed explanation goes here
    pi1 = 0.5;
    pi2 = 0.5;
    
    r1 = calcul_r(D_app,parametres_estim(1,:));
    r2 = calcul_r(D_app,parametres_estim(2,:));
    p1 = (pi1/sigma)*exp((-1/(2*sigma^2))*(r1.^2));
    p2 = (pi2/sigma)*exp((-1/(2*sigma^2))*(r2.^2));
    
    probas = [p1;p2];

end

