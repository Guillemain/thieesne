clear;
close all;

% Mise en place de la figure pour affichage :
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Filtrage frequentiel','Position',[0,0,L,H]);

% Lecture et affichage de l'image originale u :
u = double(imread('Barbara.png'));
[nb_lignes,nb_colonnes] = size(u);
subplot(1,3,1);
imagesc(u);
axis image off;
colormap gray;
title('Image originale','FontSize',20);

% Frequences en x et en y (axes = repere matriciel) :
[n_x,n_y] = meshgrid(1:nb_lignes,1:nb_colonnes);
n_x = n_x/nb_lignes-0.5;	% Frequences dans l'intervalle [-0.5,0.5]
n_y = n_y/nb_colonnes-0.5;

% Filtrage passe-bas :
n_c = 0.09;			% Frequence de coupure (faire varier ce parametre)
passe_bas = 1./(1+(n_x.^2+n_y.^2)/n_c);
%%% Ma partie:
lambda = 1000;
Gamma = 0.0001;
% Parametre pour garantir la differentiabilite de la variation totale :
epsilon = 0.5;
nb_pixels = nb_lignes*nb_colonnes;
e = ones(nb_pixels,1);
Dx = spdiags([-e e],[0 nb_lignes],nb_pixels,nb_pixels);
Dx(nb_pixels-nb_lignes+1:nb_pixels,:) = 0;
Dy = spdiags([-e e],[0 1],nb_pixels,nb_pixels);
Dy(nb_lignes:nb_lignes:nb_pixels,:) = 0;
% Point fixe :
u0 = u(:);
u_k = u0;
convergence = +Inf;
iteration = 0;
u_chap = real(fftshift(fft2(u)));
while iteration < 1000%convergence > 1e-3
    iteration = iteration + 1;
    
    cx = Dx*u_k;
    cy = Dy*u_k;
    cxx = -Dx'*Dx*u_k;
    cxy = -Dx'*Dy*u_k;
    cyy = -Dy'*Dy*u_k;
    
    c_chap = real(fftshift(fft2(reshape(u_k,nb_lignes,nb_colonnes))));
    truc = real(ifft2(ifftshift(passe_bas.*(c_chap - u_chap))));
    truc = truc(:);
    
    gros_truc = lambda*(cxx.*(cy.^2 + epsilon) ...
                        + cyy.*(cx.^2+epsilon) ...
                        - 2*cx.*cy.*cxy)...
                        ./(cx.^2 +cy.^2+epsilon).^(3/2);
%     temp = 1./sqrt((Dx*u_k).^2+(Dy*u_k).^2+epsilon);
%     W = spdiags(temp,0,nb_pixels,nb_pixels);
%     A = speye(nb_pixels) - lambda*(-Dx'*W*Dx-Dy'*W*Dy);
    u_k2 = u_k-Gamma*(truc - gros_truc);
    
    % Test de convergence :
	%convergence = norm(u_k2-u_k)/norm(u_k);
	% Mise a jour de l'image courante u_k :
	u_k = u_k2;
end



u_c = reshape(u_k,nb_lignes,nb_colonnes);
% Affichage du logarithme du module du spectre de c :
subplot(1,3,2);
imagesc((u_c));
axis image off;
colormap gray;
title('Basses frequences','FontSize',20);
% Filtrage passe-haut :
u_t = u-u_c;
% Affichage du logarithme du module du spectre de t :
subplot(1,3,3);
imagesc((u_t));
axis image off;
colormap gray;
title('Hautes frequences','FontSize',20);
