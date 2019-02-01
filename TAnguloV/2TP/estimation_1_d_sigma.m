function [ d_estime,sigma_estime ] = estimation_1_d_sigma( liste_d,liste_erreurs_generalisation )
%ESTIMATION_1_D_SIGMA Summary of this function goes here
%   Detailed explanation goes here
[m,ind] = min(liste_erreurs_generalisation);
d_estime = liste_d(ind);
sigma_estime = sqrt(m);

end

