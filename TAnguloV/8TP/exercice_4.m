clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

T = 5;
decalage = (T-1)/2;

% Lecture et affichage de l'image a segmenter :
I = imread('Images/village.gif');
I = I(:,1:260);
[nb_lignes,nb_colonnes] = size(I);
I = double(I);
figure('Name','Image a segmenter','Position',[0.2*L,0,0.4*L,0.4*L]);
imagesc(I);
colormap gray;
axis equal;
axis off;
I_carre = I.*I;

moyenne_voisins = zeros(size(I));
for i = 2:nb_lignes-1
	for j = 2:nb_colonnes-1
		moyenne_voisins(i,j) = 0.25*(1+(I(i-1,j)+I(i+1,j)+I(i,j-1)+I(i,j+1)));
	end
end

nb = zeros(256,1);
moyennes = zeros(256,1);
variances = zeros(256,1);
for i = 3:T+2
	for j = 2:T+2
		moyenne_voisins_arrondi = floor(moyenne_voisins(i,j));
		nb(moyenne_voisins_arrondi) = nb(moyenne_voisins_arrondi)+1;
		moyennes(moyenne_voisins_arrondi) = moyennes(moyenne_voisins_arrondi)+I(i,j);
		variances(moyenne_voisins_arrondi) = variances(moyenne_voisins_arrondi)+I_carre(i,j);
	end
end

texture = zeros(size(I));
texture(decalage+3,decalage+3) = calcul_texture(nb,moyennes,variances);
for i = decalage+3:2:nb_lignes-decalage-3
	for j = decalage+4:nb_colonnes-decalage-3
		for k = (-decalage):decalage
			di = i+k;
			dj = j-decalage-1;
			moyenne_voisins_arrondi = floor(moyenne_voisins(di,dj));
			nb(moyenne_voisins_arrondi) = nb(moyenne_voisins_arrondi)-1.;
			moyennes(moyenne_voisins_arrondi) = moyennes(moyenne_voisins_arrondi)-I(di,dj);
			variances(moyenne_voisins_arrondi) = variances(moyenne_voisins_arrondi)-I_carre(di,dj);
			dj = j+decalage;
			moyenne_voisins_arrondi = floor(moyenne_voisins(di,dj));
			nb(moyenne_voisins_arrondi) = nb(moyenne_voisins_arrondi)+1.;
			moyennes(moyenne_voisins_arrondi) = moyennes(moyenne_voisins_arrondi)+I(di,dj);
			variances(moyenne_voisins_arrondi) = variances(moyenne_voisins_arrondi)+I_carre(di,dj);
		end
		texture(i,j) = calcul_texture(nb,moyennes,variances);
	end

	for k = (-decalage):decalage
		di = i-decalage;
		dj = nb_colonnes-decalage-3+k;
		moyenne_voisins_arrondi = floor(moyenne_voisins(di,dj));
		nb(moyenne_voisins_arrondi) = nb(moyenne_voisins_arrondi)-1.; 
		moyennes(moyenne_voisins_arrondi) = moyennes(moyenne_voisins_arrondi)-I(di,dj);
		variances(moyenne_voisins_arrondi) = variances(moyenne_voisins_arrondi)-I_carre(di,dj);
		di = i+1+decalage;
		moyenne_voisins_arrondi = floor(moyenne_voisins(di,dj));
		nb(moyenne_voisins_arrondi) = nb(moyenne_voisins_arrondi)+1.;
		moyennes(moyenne_voisins_arrondi) = moyennes(moyenne_voisins_arrondi)+I(di,dj);
		variances(moyenne_voisins_arrondi) = variances(moyenne_voisins_arrondi)+I_carre(di,dj);
	end
	texture(i+1,nb_colonnes-decalage-3) = calcul_texture(nb,moyennes,variances);

	for j = nb_colonnes-decalage-4:-1:decalage+3
		for k = (-decalage):decalage
			di = i+1+k;
			dj = j+decalage+1;
			moyenne_voisins_arrondi = floor(moyenne_voisins(di,dj));
			nb(moyenne_voisins_arrondi) = nb(moyenne_voisins_arrondi)-1.;
			moyennes(moyenne_voisins_arrondi) = moyennes(moyenne_voisins_arrondi)-I(di,dj);
			variances(moyenne_voisins_arrondi) = variances(moyenne_voisins_arrondi)-I_carre(di,dj);
			dj = j-decalage;
			moyenne_voisins_arrondi = floor(moyenne_voisins(di,dj));
			nb(moyenne_voisins_arrondi) = nb(moyenne_voisins_arrondi)+1.;
			moyennes(moyenne_voisins_arrondi) = moyennes(moyenne_voisins_arrondi)+I(di,dj);
			variances(moyenne_voisins_arrondi) = variances(moyenne_voisins_arrondi)+I_carre(di,dj);
		end
		texture(i+1,j) = calcul_texture(nb,moyennes,variances);
	end

	if (i~=nb_lignes-decalage-4)
		for k = (-decalage):decalage
			di = i+1-decalage;
			dj = decalage+3+k;
			moyenne_voisins_arrondi = floor(moyenne_voisins(di,dj));
			nb(moyenne_voisins_arrondi) = nb(moyenne_voisins_arrondi)-1.;
			moyennes(moyenne_voisins_arrondi) = moyennes(moyenne_voisins_arrondi)-I(di,dj);
			variances(moyenne_voisins_arrondi) = variances(moyenne_voisins_arrondi)-I_carre(di,dj);
			di = i+2+decalage;
			moyenne_voisins_arrondi = floor(moyenne_voisins(di,dj));
			nb(moyenne_voisins_arrondi) = nb(moyenne_voisins_arrondi)+1.;
			moyennes(moyenne_voisins_arrondi) = moyennes(moyenne_voisins_arrondi)+I(di,dj);
			variances(moyenne_voisins_arrondi) = variances(moyenne_voisins_arrondi)+I_carre(di,dj);
		end
		texture(i+2,decalage+4) = calcul_texture(nb,moyennes,variances);
	end  
end
texture = texture(4:nb_lignes-3,5:nb_colonnes-5);

% Affichage du parametre de texture :
figure('Name','Carte de texture','Position',[0.6*L,0,0.4*L,0.4*L]);
max_texture = max(texture(:));
min_texture = min(texture(:));
imagesc(255*(texture-min_texture)/(max_texture-min_texture));
colormap gray;
axis equal;
axis off;
