function [d,sigma] = estimation_1_d_sigma(liste_d,liste_erreurs_generalisation)
%ESTIMATION_1_D_SIGMA Summary of this function goes here
%   Detailed explanation goes here
[val,id] = min(liste_erreurs_generalisation);
d = liste_d(id);
sigma = sqrt(val);


