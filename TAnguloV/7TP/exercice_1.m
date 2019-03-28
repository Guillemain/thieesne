clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

couleur_1 = [1 0 0];
couleur_2 = [0 0 1];
couleur_3 = [0 1 0];
couleurs = [repmat(couleur_1,3,1) ; repmat(couleur_2,3,1) ; repmat(couleur_3,3,1)];
marques = ['s' ; '+' ; 'd' ; 's' ; '+' ; 'd' ; 's' ; '+' ; 'd'];

duree_fenetre = 20*10^(-3);			% Duree de la fenetre : 20 millisecondes

% Liste des voyelles :
liste_voyelles = {'a','e','e_aigu','e_grave','i','o','o_ouvert','ou','u'};
nb_voyelles = length(liste_voyelles);
nb_essais = 10;					% Nombre d'enregistrements par voyelle
n = nb_voyelles*nb_essais;			% Nombre total d'enregistrements

% Calcul des coefficients spectraux et cepstraux :
[~,f_echantillonnage] = audioread('Voyelles/a_1.wav');
nb_echantillons_par_fenetre = floor(duree_fenetre*f_echantillonnage);

spectre = zeros(nb_echantillons_par_fenetre,n);
cepstre = zeros(nb_echantillons_par_fenetre,n);
spectre_moyen = zeros(nb_echantillons_par_fenetre,nb_voyelles);
cepstre_moyen = zeros(nb_echantillons_par_fenetre,nb_voyelles);
repertoire = 'Voyelles/';
for i = 1:nb_voyelles
	donnees_voyelle_spec = [];
	donnees_voyelle_ceps = [];
	for j = 1:nb_essais

		% Chargement du signal vocal :
		nom_fichier = strcat(repertoire,liste_voyelles{i},'_',num2str(j),'.wav');
		signal = audioread(nom_fichier);

		% Analyse spectrale et cepstrale du signal vocal :
		[spec,ceps] = spec_ceps(signal,nb_echantillons_par_fenetre);

		% Moyenne temporelle des coefficients spectraux et cepstraux :
		indice_colonne = (i-1)*nb_essais+j;
		spectre(:,indice_colonne) = mean(spec,2);
		cepstre(:,indice_colonne) = mean(ceps,2);
	end
	indices_voyelle = (i-1)*nb_essais+1:i*nb_essais;	% Indices des enregistrements correspondant a la voyelle numero i
	spectre_moyen(:,i) = mean(spectre(:,indices_voyelle),2);
	cepstre_moyen(:,i) = mean(cepstre(:,indices_voyelle),2);
end

% Classification des coefficients spectraux et cepstraux par les k-moyennes
% (en initialisant par les moyennes des nb_essais enregistrements de chaque voyelle, on optimise la classification) :
labels_spectre = kmeans(spectre',nb_voyelles,'start',spectre_moyen','emptyaction','error');
labels_cepstre = kmeans(cepstre',nb_voyelles,'start',cepstre_moyen','emptyaction','error');

% Pourcentages de bonnes classifications :
resultats_spectre = [];
resultats_cepstre = [];
for i = 1:nb_voyelles
	indices_voyelle = (i-1)*nb_essais+1:i*nb_essais;
	resultats_spectre = [resultats_spectre length(find(labels_spectre(indices_voyelle)==i))];
	resultats_cepstre = [resultats_cepstre length(find(labels_cepstre(indices_voyelle)==i))];
end

% Resultat de l'analyse spectrale :
pourcentage_spectre = sum(resultats_spectre)/n;
disp(['Pourcentage de reconnaissance par analyse spectrale : ' num2str(100*pourcentage_spectre,'%.1f') '%']);

% Resultat de l'analyse cepstrale :
pourcentage_cepstre = sum(resultats_cepstre)/n;
disp(['Pourcentage de reconnaissance par analyse cepstrale : ' num2str(100*pourcentage_cepstre,'%.1f') '%']);


% Reduction de dimension par ACP sur les coefficients spectraux :
nb_CP = 3;
spectre_centre = spectre-repmat(mean(spectre,2),1,n);
Sigma_spectre = spectre_centre*transpose(spectre_centre)/n;
[V_spectre,D_spectre] = eig(Sigma_spectre);
[~,indices_tries] = sort(diag(D_spectre),'descend');
W_spectre = V_spectre(:,indices_tries);
spectre_ACP = W_spectre(:,1:nb_CP)'*spectre;

% Classification par les k-moyennes des coefficients spectraux apres ACP :
moyenne_spectre_ACP = W_spectre(:,1:nb_CP)'*spectre_moyen;
labels_spectre_ACP = kmeans(spectre_ACP',nb_voyelles,'start',moyenne_spectre_ACP','emptyaction','error');

% Pourcentage de bonnes classifications :
resultats_spectre_ACP = [];
for i = 1:nb_voyelles
	indices_voyelle = (i-1)*nb_essais+1:i*nb_essais;
	resultats_spectre_ACP = [resultats_spectre_ACP length(find(labels_spectre_ACP(indices_voyelle)==i))];
end
pourcentage_spectre_ACP = sum(resultats_spectre_ACP)/n;
disp(['Pourcentage de reconnaissance par analyse spectrale apres ACP : ' num2str(100*pourcentage_spectre_ACP,'%.1f') '%']);


% Reduction de dimension par ACP sur les coefficients cepstraux :
cepstre_centre = cepstre-repmat(mean(cepstre,2),1,n);
Sigma_cepstre = cepstre_centre*transpose(cepstre_centre)/n;
[V_cepstre,D_cepstre] = eig(Sigma_cepstre);
[~,indices_tries] = sort(diag(D_cepstre),'descend');
W_cepstre = V_cepstre(:,indices_tries);
cepstre_ACP = W_cepstre(:,1:nb_CP)'*cepstre;

% Classification par les k-moyennes des coefficients cepstraux apres ACP :
moyenne_cepstre_ACP = W_cepstre(:,1:nb_CP)'*cepstre_moyen;
labels_cepstre_ACP = kmeans(cepstre_ACP',nb_voyelles,'start',moyenne_cepstre_ACP','emptyaction','error');

% Pourcentage de bonnes classifications :
resultats_cepstre_ACP = [];
for i = 1:nb_voyelles
	indices_voyelle = (i-1)*nb_essais+1:i*nb_essais;
	resultats_cepstre_ACP = [resultats_cepstre_ACP length(find(labels_cepstre_ACP(indices_voyelle)==i))];
end
pourcentage_cepstre_ACP = sum(resultats_cepstre_ACP)/n;
disp(['Pourcentage de reconnaissance par analyse cepstrale apres ACP : ' num2str(100*pourcentage_cepstre_ACP,'%.1f') '%']);


% Affichage du classifieur :
figure('Name','Classifieur de voyelles','Position',[0.2*L,0,0.8*L,0.7*L]);
hold on;
bien_classes = zeros(nb_voyelles,nb_essais);
for i = 1:nb_voyelles
	indices_voyelle = (i-1)*nb_essais+1:i*nb_essais;
	plot3(cepstre_ACP(1,indices_voyelle),cepstre_ACP(2,indices_voyelle),cepstre_ACP(3,indices_voyelle),...
		marques(i),'Color',couleurs(i,:),'LineWidth',3,'MarkerSize',15);
end
set(gca,'FontSize',20);
xlabel('CP1','FontSize',30);
ylabel('CP2','FontSize',30);
zlabel('CP3','FontSize',30);
x_min = min(cepstre_ACP(1,:));
x_max = max(cepstre_ACP(1,:));
marge_x = (x_max-x_min)/10;
y_min = min(cepstre_ACP(2,:));
y_max = max(cepstre_ACP(2,:));
marge_y = (y_max-y_min)/10;
axis([x_min-marge_x x_max+marge_x y_min-marge_y y_max+marge_y]);
axis equal;
grid on;
rotate3d;
legend('a','e','e aigu','e grave','i','o','o ouvert','ou','u','Location','NorthEast');
