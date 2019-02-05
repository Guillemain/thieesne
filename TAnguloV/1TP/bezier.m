function y = bezier(beta_0,beta,beta_d,x)
%BEZIER Summary of this function goes here
%   Detailed explanation goes here
Beta = [beta_0 beta beta_d];
d = length(Beta)-1;
y = 0;
for i = 0:d
    B = nchoosek(d,i).*(x.^i).*(1-x).^(d-i);
    y = y + Beta(i+1).*B;
end

end

