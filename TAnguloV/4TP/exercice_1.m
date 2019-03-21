donnees_1;
drawnow;

% Trace des donnees d'apprentissage (croix bleues) :
figure('Name','Estimation d''une ellipse','Position',[0.5*L,0,0.5*L,0.67*H]);
plot(D_app(1,:),D_app(2,:),'+b','MarkerSize',10,'LineWidth',2);
set(gca,'FontSize',20);
xlabel('$x$','Interpreter','Latex','FontSize',30);
ylabel('$y$','Interpreter','Latex','FontSize',30);
axis([-taille taille -taille taille]);
axis equal;
hold on;

% Estimation de l'ellipse par les moindres carres :
X = MC(D_app);
parametres_MC = conversion(X);

% Trace de l'ellipse estimee aux moindres carres (trait vert) :
[x_MC,y_MC] = points_ellipse(parametres_MC,theta_affichage);
plot([x_MC x_MC(1)],[y_MC y_MC(1)],'g-','LineWidth',2);
legend(' Donnees d''apprentissage',' Ellipse estimee','Location','Best');

% Calcul et affichage du score :
parametres_VT = [a,e,x_C,y_C,theta];
score_MC = calcul_score(parametres_VT,parametres_MC);
fprintf('Score des moindres carres : %.3f\n',score_MC);

% Tirages aleatoires de parametres pour l'ellipse :
nb_tirages = 10000;
parametres_test = zeros(nb_tirages,5);
parametres_test(:,1) = 2*taille/5*(rand(nb_tirages,1)+1);		% Demi-grand axe
parametres_test(:,2) = 0.5+0.5*rand(nb_tirages,1);			% Excentricite
parametres_test(:,3) = (3*taille/5)*(2*rand(nb_tirages,1)-1);		% Abscisse du centre
parametres_test(:,4) = (3*taille/5)*(2*rand(nb_tirages,1)-1);		% Ordonnee du centre
parametres_test(:,5) = 2*pi*rand(nb_tirages,1);				% Angle du grand axe

% Estimation de l'ellipse par maximum de vraisemblance :
parametres_MV = MV(D_app,parametres_test);

% Trace de l'ellipse estimee par maximum de vraisemblance (trait rouge) :
[x_MV,y_MV] = points_ellipse(parametres_MV,theta_affichage);
plot([x_MV x_MV(1)],[y_MV y_MV(1)],'r-','LineWidth',2);
legend(' Donnees d''apprentissage',' Moindres carres',' Maximum de vraisemblance','Location','Best');

% Calcul et affichage du score :
score_MV = calcul_score(parametres_VT,parametres_MV);
fprintf('Score du maximum de vraisemblance : %.3f\n',score_MV);
