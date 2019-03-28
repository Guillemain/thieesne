function  beta_hat = moindres_carres_ecretes( D_app,beta_0,beta_d,d,lbd )

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

beta_barre = linspace(beta_0,beta_d,d+1);
beta_barre = beta_barre(2:end-1);
C = B-A*beta_barre';

delta_hat = ((A'*A+lbd*eye(d-1))^-1)*A'*C;

beta_hat = (delta_hat + beta_barre');
beta_hat = beta_hat';

end

