clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

load bords;
figure('Name','Silhouettes normalisees','Position',[0.4*L,0.05*H,0.6*L,0.7*H]);

[m,~,n] = size(bords);
x_min = min(bords(:));
x_max = max(bords(:));
largeur = x_max-x_min;
y = transpose(0:1/(m-1):1);
limites = [0 1.05 x_min-0.5*largeur x_max+0.5*largeur];

beta_0 = 86;
gamma_0 = 123;

% Affichage des silhouettes normalisees :
for q = 1:n
	plot(y,bords(:,1,q),'k','LineWidth',2);
	axis(limites);
	axis ij;
	set(gca,'FontSize',20);
	xlabel('$y$','FontSize',30,'Interpreter','Latex');
	ylabel('$x$','FontSize',30,'Interpreter','Latex','Rotation',0);
	hold on;
	plot(y,bords(:,2,q),'k','LineWidth',2);
	legend(' Donnees d''apprentissage');
	pause(0.5);
	hold off;
end

save donnees;
