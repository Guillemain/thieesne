clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Calcul du modele exact (courbe de Bezier de degre 5) :
beta_0 = 115;
beta_5 = 123;
beta = [133,96,139,118];
n_affichage = 200;			% Utilisation de 200 points pour l'affichage
pas_affichage = 1/(n_affichage-1);
x = 0:pas_affichage:1;
y = bezier(beta_0,beta,beta_5,x);

% Trace du modele exact (trait noir) :
figure('Name','Estimation ecretee des parametres','Position',[0.4*L,0.05*H,0.6*L,0.7*H]);
plot(x,y,'-k','LineWidth',2);
set(gca,'FontSize',20);
xlabel('$x$','Interpreter','Latex','FontSize',30);
ylabel('$y$','Interpreter','Latex','FontSize',30);
hold on;

% Calcul des donnees d'apprentissage (bruit blanc sur les ordonnees) :
n_app = 50;
pas_app = 1/(n_app-1);
x_j = 0:pas_app:1;
sigma = 0.5;
y_j = bezier_bruitee(beta_0,beta,beta_5,x_j,sigma);
D_app = [x_j ; y_j];

% Trace des donnees d'apprentissage (croix bleues) :
plot(x_j,y_j,'+b','MarkerSize',10,'LineWidth',3);

% Parametres du modele :
d = 16;				% Testez plusieurs valeurs de d entre 2 et 20
lambda = 0.05;			% Testez plusieurs valeurs de l'intervalle [0,1]

% Estimation des parametres de la courbe de Bezier a partir des donnees bruitees :
beta_estime = moindres_carres_ecretes(D_app,beta_0,beta_5,d,lambda);

% Trace de la courbe de Bezier estimee, de degre d (trait rouge) :
y_estime = bezier(beta_0,beta_estime,beta_5,x);
plot(x,y_estime,'-r','MarkerSize',10,'LineWidth',3);
legend(' Modele exact (d=5)',' Donnees d''apprentissage',...
		[' Modele estime (d=' num2str(d) ', lambda=' num2str(lambda) ')'],'Location','SouthEast');
