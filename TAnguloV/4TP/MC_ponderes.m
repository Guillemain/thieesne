function X = MC_ponderes( D_app,probas )
%MC Summary of this function goes here
%   Detailed explanation goes here

n_app = length(D_app);
A = zeros(n_app+1,6);

for i = 1:n_app
    xi = D_app(1,i);
    yi = D_app(2,i);
    A(i,:) = [xi^2 xi*yi yi^2 xi yi 1];
end

A(n_app+1,:) = [1 0 1 0 0 0];
presque_zeros = zeros(n_app+1,1);
presque_zeros(n_app+1) = 1;
X = A\presque_zeros;

end

