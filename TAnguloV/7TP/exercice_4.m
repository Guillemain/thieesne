clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Locutions verbales :
liste_locutions = {'arretetoi','avance','droite','faisunflip','gauche','recule'};
nb_locutions = length(liste_locutions);

% Locutions de reference :
load exercice_3;

nb_locuteurs = 13;

I = imread('drone.jpg');
position = [0.33*L,0.33*H,0.33*L,0.33*H];

figure('Position',position);
imagesc(I);
axis equal;
axis off;
colormap gray;

while true
	pause(1);

	indice_locution = randi(nb_locutions);
	locution = liste_locutions{indice_locution};
	indice_locuteur = randi(nb_locuteurs);
	nom_fichier = strcat('Corpus/M',num2str(indice_locuteur,'%.2d'),'_',locution,'.wav');
	signal = audioread(nom_fichier);
	[~,cepstre_test] = spec_ceps(signal,nb_echantillons_par_fenetre);
	sound(signal,f_echantillonnage);

	indice_locution_reconnue = reconnaissance_vocale(cepstre_test,cepstre_ref);
	fprintf('Locution reconnue : %s\n',liste_locutions{indice_locution_reconnue});
	close;
	switch indice_locution_reconnue
		case 1
			position = position;
		case 2
			position = position+[0,0.1*H,0,0];
		case 3
			position = position+[0.1*L,0,0,0];
		case 4
			I = flip(I);
		case 5
			position = position-[0.1*L,0,0,0];
		case 6
			position = position-[0,0.1*H,0,0];
	end
	figure('Position',position);
	imagesc(I);
	axis image off;
	colormap gray;
end
