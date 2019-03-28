exercice_2;

% Valeurs initiales des proportions :
prop_1 = size(D_app_1,2)/size(D_app,2);
prop_2 = 1-prop_1;

% Algorithme EM :
difference_score = 1;
seuil = 0.001;
while abs(difference_score)>seuil

	% Calcul des probabilites d'appartenance aux deux classes :
	parametres_estim = [parametres_1_estim ; parametres_2_estim];
	probas = calcul_probas_EM(D_app,parametres_estim,prop_1,prop_2,sigma);
	probas_1 = probas(1,:);
	probas_2 = probas(2,:);

	% Mise a jour des proportions :
	prop_1 = mean(probas_1);
	prop_2 = 1-prop_1;

	% Partition des donnees :
	classe_1 = find(probas_1>=probas_2);
	classe_2 = find(probas_1<probas_2);
	D_app_1 = D_app(:,classe_1);
	D_app_2 = D_app(:,classe_2);

	% Affichage de la partition :
	hold off;
	plot(D_app_1(1,:),D_app_1(2,:),'+b','MarkerSize',10,'LineWidth',2);
	set(gca,'FontSize',20);
	xlabel('$x$','Interpreter','Latex','FontSize',30);
	ylabel('$y$','Interpreter','Latex','FontSize',30);
	axis([-taille taille -taille taille]);
	axis equal;
	hold on;
	plot(D_app_2(1,:),D_app_2(2,:),'+g','MarkerSize',10,'LineWidth',2);

	% Estimation des parametres des ellipses aux moindres carres ponderes :
	X_1 = MC_ponderes(D_app,probas_1);
	parametres_1_estim = conversion(X_1);
	X_2 = MC_ponderes(D_app,probas_2);
	parametres_2_estim = conversion(X_2);

	% Trace des ellipses estimees (traits bleu et vert) :
	[x_1,y_1] = points_ellipse(parametres_1_estim,theta_affichage);
	plot([x_1 x_1(1)],[y_1 y_1(1)],'b-','LineWidth',2);
	[x_2,y_2] = points_ellipse(parametres_2_estim,theta_affichage);
	plot([x_2 x_2(1)],[y_2 y_2(1)],'g-','LineWidth',2);
	legend(' Classe 1',' Classe 2',' Ellipse 1',' Ellipse 2','Location','Best');

	% Calcul du nouveau score :
	score_nouv = calcul_score_2(parametres_1_VT,parametres_2_VT,parametres_1_estim,parametres_2_estim);
	difference_score = score_nouv-score;
	score = score_nouv;

	pause(0.5);
end

% Affichage du score final :
fprintf('Score final : %.3f\n',score);
