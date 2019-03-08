clear;
close all;

% Calcul de parametres :
duree_fenetre = 20*10^(-3);			% Duree de la fenetre : 20 millisecondes
[~,f_echantillonnage] = audioread('Corpus/M01_droite.wav');
nb_echantillons_par_fenetre = floor(duree_fenetre*f_echantillonnage);

% Locutions verbales :
liste_locutions = {'arretetoi','avance','droite','faisunflip','gauche','recule'};
nb_locutions = length(liste_locutions);

% Cepstres de reference (locuteur numero 1) :
for i = 1:nb_locutions
	nom_fichier = strcat('Corpus/M01_',liste_locutions{i},'.wav');
	[~,cepstre_ref{i}] = spec_ceps(audioread(nom_fichier),nb_echantillons_par_fenetre);
end

% Calcul de la matrice de confusion :
M_confusion = zeros(nb_locutions);
nb_locuteurs = 13;
for i = 1:nb_locutions
	for j = 1:nb_locuteurs
		nom_fichier = strcat('Corpus/M',num2str(j,'%.2d'),'_',liste_locutions{i},'.wav');
		[~,cepstre_test] = spec_ceps(audioread(nom_fichier),nb_echantillons_par_fenetre);
		distances = zeros(1,nb_locutions);
		for k = 1:nb_locutions
			[~,~,~,distances(k)] = alignement(cepstre_ref{k},cepstre_test,'distance_locutions');
		end
		[~,arg_min] = min(distances);
		M_confusion(i,arg_min) = M_confusion(i,arg_min)+1;
	end
end
M_confusion

save exercice_3 f_echantillonnage nb_echantillons_par_fenetre cepstre_ref;
