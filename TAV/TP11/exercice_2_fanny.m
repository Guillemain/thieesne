%--------------------------------------------------------------------------
% ENSEEIHT - 2SN MM - Traitement des donnees audio-visuelles
% TP11 - Restauration d'images
% exercice_1.m : debruitage avec variation totale (niveaux de gris)
%--------------------------------------------------------------------------

clear
close all
clc

% Mise en place de la figure pour affichage :
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Debruitage par variation totale',...
       'Position',[0.06*L,0.1*H,0.9*L,0.7*H]);

% Lecture de l'image :
u0 = double(imread('testSuperPXL.jpg'));
[nb_lignes,nb_colonnes,nb_canaux] = size(u0);
u_max = max(u0(:));

% Affichage de l'image :
subplot(1,2,1)
	imagesc(max(0,min(1,u0/u_max)),[0 1])
	colormap gray
	axis image off
	title('Image bruitee','FontSize',20)   

    
% Affichage de l'image restauree a l'iteration 0 :
subplot(1,2,2)
	imagesc(max(0,min(1,u0/u_max)),[0 1])
	axis image off
	title('Image restauree (iteration 0)','FontSize',20)
drawnow nocallbacks



% Vectorisation de u0 :
nb_pixels = nb_lignes*nb_colonnes;
u0 = reshape(u0,[nb_pixels nb_canaux]);

% Parametre pour garantir la differentiabilite de la variation totale :
epsilon = 0.01;

% Operateur gradient :
nb_pixels = nb_lignes*nb_colonnes;
e = ones(nb_pixels,1);
Dx = spdiags([-e e],[0 nb_lignes],nb_pixels,nb_pixels);
Dx(nb_pixels-nb_lignes+1:nb_pixels,:) = 0;
Dy = spdiags([-e e],[0 1],nb_pixels,nb_pixels);
Dy(nb_lignes:nb_lignes:nb_pixels,:) = 0;


indice = ((u0(:,1)>190).*(u0(:,2)>170).*(u0(:,3)>170).*(u0(:,3)<220).*u0(:,2)<20);

WD = spdiags(indice,0,nb_pixels,nb_pixels);


% Second membre b du systeme :
b = u0;

% Point fixe :
lambda = 10;			% Poids de la regularisation
u_k = u0;
convergence = +Inf;
iteration = 0;
itmax = 20;
while convergence > 1e-3
	
	% Incrementation du nombre d'iterations :
	iteration = iteration + 1;

	% Calcul de la matrice W (cf. equation (6)) :
    temp = 1./sqrt((Dx*u_k).^2+(Dy*u_k).^2+epsilon);
    W = spdiags(temp,0,nb_pixels,nb_pixels);

	% Calcul de la matrice A (cf. equation (6)) :
    A = (WD) - lambda*(-Dx'*W*Dx-Dy'*W*Dy);
	
	% Resolution du systeme A*u = b :
	u_k2 = A\((WD)*u0);
	
	% Test de convergence :
	convergence = norm(u_k2-u_k)/norm(u_k);
	
	% Mise a jour de l'image courante u_k :
	u_k = u_k2;

	% Affichage de l'image restauree a chaque iteration :
	subplot(1,2,2)
		imagesc(max(0,min(1,reshape(u_k,[nb_lignes nb_colonnes nb_canaux])/u_max)),[0 1])
		colormap gray
		axis image off
		title(['Image restauree (iteration ' num2str(iteration) ')'],'FontSize',20)
	drawnow nocallbacks
	pause(0.2)
	
end

% Enregistrement du resultat    
imwrite(max(0,min(1,reshape(u_k,[nb_lignes nb_colonnes nb_canaux])/u_max)),...
        'fanny.png')
