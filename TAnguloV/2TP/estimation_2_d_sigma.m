function [d_estime,sigma_estime] = estimation_2_d_sigma( liste_d,liste_VC )
%ESTIMATION_2_D_SIGMA Summary of this function goes here
%   Detailed explanation goes here
[m,ind] = min(liste_VC);
d_estime = liste_d(ind);
sigma_estime = sqrt(m);

end

