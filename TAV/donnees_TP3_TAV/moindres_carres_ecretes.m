function beta = moindres_carres_ecretes(D_app,beta_0,beta_fin,d,lambda);
%retourne la solution approchée β de l’équation,
% A*β = D_app(2,:) avec A = cf. code. ;)
% au sens des moindres carrés ordinaires

x_app = D_app(1,:);
y_app = D_app(2,:) - beta_0*(1-x_app).^d - beta_fin*x_app.^d  ;

% Creation de A :
A = [];
for j = 1:d-1
    A = [A , nchoosek(d,j)*(x_app').^(j).*((1-(x_app')).^(d-j))];
end

% Creation beta_tilde :
alpha = [1:d-1]/d;
beta_tilde = beta_0+(beta_fin-beta_0)*alpha; 
C = y_app' - (A * beta_tilde');
delta = ((A'*A + lambda * eye(d-1) )^(-1) * A'*C);
beta = delta + beta_tilde';
end

