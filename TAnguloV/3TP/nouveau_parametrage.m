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
figure('Name','parametres adaptes a la regularisation','Position',[0.4*L,0.05*H,0.6*L,0.7*H]);
plot(x,y,'-k','LineWidth',2);
set(gca,'FontSize',20);
xlabel('$x$','Interpreter','Latex','FontSize',30);
ylabel('$y$','Interpreter','Latex','FontSize',30);
hold on;

% Affichage des points de controle (disques noirs) :
d = length(beta)+1;
alpha_0 = 0;
alpha_5 = 1;
alpha = [1:d-1]/d;
plot([alpha_0 alpha alpha_5],[beta_0 beta beta_5],'ok','MarkerFaceColor','k','MarkerSize',10,'LineWidth',3);

% Trace de la droite reliant les points de controle extremes (trait bleu) :
line([alpha_0 alpha_5],[beta_0 beta_5],'Color','b','LineWidth',3);

% Affichage des projections verticales des points de controle sur cette droite (disques bleus) :
beta_tilde = beta_0+(beta_5-beta_0)*alpha;
plot(alpha,beta_tilde,'ob','MarkerFaceColor','b','MarkerSize',10,'LineWidth',3);

% Materialisation des ecarts (pointilles noirs) :
for i = 1:d-1
	plot([alpha(i),alpha(i)],[beta(i),beta_tilde(i)],'--k','LineWidth',2)
end
legend(' Modele exact (d=5)',' Points de controle du modele exact',...
		' Modele simplifie',' Points de controle du modele simplifie','Location','SouthEast');
