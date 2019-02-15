function [d_estime,sigma_estime] = estimation_2_d_sigma(liste_d,liste_VC)
%ESTIMATION_2_D_SIGMA Summary of this function goes here
%   Detailed explanation goes here
[sigma_2,indice] = min(liste_VC);
sigma_estime = sqrt(sigma_2);
d_estime = liste_d(indice);
end

