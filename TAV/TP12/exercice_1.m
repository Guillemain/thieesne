%--------------------------------------------------------------------------
% ENSEEIHT - 2SN MM - Traitement des donnees audio-visuelles
% TP12 - Realite diminuee
% exercice_1 : traitement des pixels par tirage aleatoire
%--------------------------------------------------------------------------

clear
close all
clc

% Mise en place de la figure pour affichage :
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Inpainting par rapiecage',...
	'Position',[0.06*L,0.1*H,0.9*L,0.75*H])

% Lecture de l'image originale :
u0 = double(imread('randonneur.jpg'));
[nb_lignes,nb_colonnes,nb_canaux] = size(u0);
u_max = max(u0(:));

% Affichage de l'image originale :
subplot(1,2,1)
	imagesc(max(0,min(1,u0/u_max)),[0 1])
	axis image off
	title('Image originale','FontSize',20)
	if nb_canaux == 1
		colormap gray
	end

% Lecture du domaine D a completer :
D = imread('masque_randonneur.png') > 0;

% Affichage de l'image resultat :
u_k = u0;
for c = 1:nb_canaux
	u_k(:,:,c) = (~D).*u_k(:,:,c);	
end
subplot(1,2,2)
	imagesc(max(0,min(1,u_k/u_max)),[0 1])
	axis image off
	title('Image resultat','FontSize',20)
	if nb_canaux == 1
		colormap gray
	end
drawnow nocallbacks

% Lancement du traitement :
fprintf('Tapez un caractere pour lancer le traitement !\n');
pause

% Initialisation de la frontiere int�rieure de D :
delta_D_int_1 = frontiere(D,-1);
indices_delta_D_int_1 = find(delta_D_int_1 > 0);
nb_points_delta_D_int_1 = length(indices_delta_D_int_1);

% Parametres :
t = 7;		% Voisinage d'un pixel de taille (2t+1) x (2t+1)
T = 20;		% Fenetre de recherche de taille (2T+1) x (2T+1)
%%
% Tant que la frontiere de D n'est pas vide :
while nb_points_delta_D_int_1 > 0

	% Pixel p de la frontiere de D tire aleatoirement :
	indice_p = indices_delta_D_int_1(randi(nb_points_delta_D_int_1));
	[i_p,j_p] = ind2sub(size(D),indice_p);

	% Recherche du pixel q_chapeau :
	[existe_q,bornes_V_p,bornes_V_q_chapeau] = d_min(i_p,j_p,u_k,D,t,T);

	% S'il existe au moins un pixel q eligible :
	if existe_q

		% Rapiecage et mise a jour de D :
		[u_k,D] = rapiecage_1(bornes_V_p,bornes_V_q_chapeau,u_k,D);

		% Mise a jour de la frontiere de D :
		delta_D_int_1 = frontiere(D,-1);
		indices_delta_D_int_1 = find(delta_D_int_1 > 0);
		nb_points_delta_D_int_1 = length(indices_delta_D_int_1);

		% Affichage de l'image resultat :
		subplot(1,2,2)
		imagesc(max(0,min(1,u_k/u_max)),[0 1])
		axis image off
		title('Image resultat','FontSize',20)
		if nb_canaux == 1
			colormap gray
		end
		drawnow nocallbacks
	end
end

% Enregistrement du resultat :
imwrite(max(0,min(1,reshape(u_k,[nb_lignes nb_colonnes nb_canaux])/u_max)),...
        'resultat_exercice_1.png')
