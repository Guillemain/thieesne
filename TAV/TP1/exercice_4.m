%% Script de l'exercice 4 :
%
%
%

nb_tirage = 100;
d = 5;
beta_0 = 115;
beta_5 = 123;
beta = [133,96,139,118];

x_j = 0:pas_app:1;
sigma = 0.5;
beta_est = [];

for i = 1:nb_tirage
   D_app = [x_j ; bezier_bruitee(beta_0,beta,beta_5,x_j,sigma,n_app)];
   beta_est = [beta_est ; moindres_carres(D_app,beta_0,beta_5,d)'];
end
disp("Moyenne : ")
moy = sum(beta_est)/nb_tirage
disp("equart type : ")
ecart = sum(beta_est - ones(nb_tirage,1)*moy)/nb_tirage
A = [];

% disp("ecart-type théorique :")
% for j = 1:d-1
%     A = [A , nchoosek(d,j)*(x_j').^(j).*((1-(x_j')).^(d-j))];
% end
% ecart_type_theorique = sigma^2*inv(A'*A)
% %disp(y)