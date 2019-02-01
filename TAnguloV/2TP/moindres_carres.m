function  beta = moindres_carres( D_app,beta_0,beta_d,d )

B = D_app(2,:)';
x = D_app(1,:);
n = length(x);
A = zeros(n,d-1);

for i = 1:n
    b0 = (1-x(i))^d;
    bd = x(i)^d;
    B(i) = B(i) - beta_0*b0 - beta_d*bd;
    for j = 1:d-1
        A(i,j) = nchoosek(d,j)*(x(i)^j)*(1-x(i))^(d-j);
    end
end

beta = (A\B)';

end

