function y = bezier_bruitee(beta_0,beta,beta_d,x,sigma)
%BEZIER_BRUITE Summary of this function goes here
%   Detailed explanation goes here
y = bezier(beta_0,beta,beta_d,x) + (sigma*randn(1,length(x)));

