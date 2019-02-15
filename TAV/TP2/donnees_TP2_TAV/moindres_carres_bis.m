function beta = moindres_carres_bis(d,y,x1,beta_0,x2,gamma_0)
%retourne la solution approchée β de l’équation,
% A*β = D_app(2,:) avec A = cf. code. ;)
% au sens des moindres carrés ordinaires

x_app = x1 - beta_0*(1-y).^d;
x_app = [x_app (x2 - gamma_0*(1-y).^d)] ;

A = [];
for j = 1:d
    A = [A , nchoosek(d,j)*(x_app').^(j).*((1-(x_app')).^(d-j))];
end
Grand_A = [A zeros(size(A)) ; zeros(size(A)) A];
size(Grand_A)
size(x_app)

beta = Grand_A\x_app';
end

