function [d,sigma] = estimation_1_d_sigma(liste_lambda,liste_VC)
%ESTIMATION_1_D_SIGMA Summary of this function goes here
%   Detailed explanation goes here

[val,id] = min(liste_VC);
d = liste_lambda(id);
sigma = sqrt(val);


