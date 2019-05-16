%--------------------------------------------------------------------------
% ENSEEIHT - 2SN MM - Traitement des donnees audio-visuelles
% TP12 - Realite diminuee
% exercice_2 : traitement des pixels selon un ordre de priorite
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

% Lecture et affichage de l'image originale :
u0 = double(imread('regate.jpg'));
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

% Selection et affichage du domaine D a completer :
disp('Selectionnez un polygone (double-clic pour valider)');
[D,x_D,y_D] = roipoly();
D = double(D);
for k = 1:length(x_D)-1
	line([x_D(k) x_D(k+1)],[y_D(k) y_D(k+1)],'Color','b','LineWidth',2);
end

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

% Initialisation des frontieres de D :
delta_D_int_1 = frontiere(D,-1);
nb_points_delta_D_int_1 = length(find(delta_D_int_1 > 0));
delta_D_ext_2 = frontiere(D,2);

% Initialisation de C :
C = double(~D);

% Parametres :
t = 7;		% Voisinage d'un pixel de taille (2t+1) x (2t+1)
T = 60;		% Fenetre de recherche de taille (2T+1) x (2T+1)

% Calcul de P et C sur la frontiere de D :
[P,C] = priorites(u_k,D,C,delta_D_int_1,delta_D_ext_2,t);    

% Tant que la frontiere de D n'est pas vide :
while nb_points_delta_D_int_1 > 0

	% Calcul du pixel ayant la plus forte priorite :
	[P_trie,indices_tries] = sort(P(:),'descend');
	k = 1;
	existe_q = 0;
	
	while ~existe_q

		% Choix du prochain pixel a traiter :
		indice_p = indices_tries(k);
		[i_p,j_p] = ind2sub(size(P),indice_p);

		% Recherche du pixel q_chapeau :
		[existe_q,bornes_V_p,bornes_V_q_chapeau] = d_min(i_p,j_p,u_k,D,t,T);

		% S'il existe au moins un pixel q eligible :
		if existe_q

			% Rapiecage et mise a jour de D et C :
			[u_k,D,C] = rapiecage_2(bornes_V_p,bornes_V_q_chapeau,u_k,D,C,i_p,j_p);

			% Mise a jour des frontieres de D :
			delta_D_int_1 = frontiere(D,-1);
			nb_points_delta_D_int_1 = length(find(delta_D_int_1 > 0));
			delta_D_ext_2 = frontiere(D,2);

			% Calcul de P et C sur la frontiere de D :
			[P,C] = priorites(u_k,D,C,delta_D_int_1,delta_D_ext_2,t);

			% Affichage de l'image resultat :
			figure(1)
			subplot(1,2,2)
				imagesc(uint8(u_k))
				axis image off
				title('Image resultat','FontSize',20)
				if nb_canaux == 1
					colormap gray
				end
			drawnow nocallbacks	
		else
			k = k+1;	
		end	
	end
end

% Enregistrement du resultat :
imwrite(max(0,min(1,reshape(u_k,[nb_lignes nb_colonnes nb_canaux])/u_max)),...
        'resultat_exercice_2.png')
