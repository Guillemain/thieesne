function beta = moindres_carres(D_app,beta_0,beta_fin,d);
%retourne la solution approchée β de l’équation,
% A*β = D_app(2,:) avec A = cf. code. ;)
% au sens des moindres carrés ordinaires

x_app = D_app(1,:);
y_app = D_app(2,:) - beta_0*(1-x_app).^d - beta_fin*x_app.^d  ;
A = [];
for j = 1:d-1
    A = [A , nchoosek(d,j)*(x_app').^(j).*((1-(x_app')).^(d-j))];
end
beta = A\y_app';
end

