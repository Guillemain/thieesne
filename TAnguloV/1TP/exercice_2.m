exercice_1;

% Degre de la courbe de Bezier utilisee comme modele (testez plusieurs valeurs de d entre 2 et 20) :
d = 10;

% Estimation des parametres de la courbe de Bezier (sauf beta_0 et beta_5) :
beta_estime = moindres_carres(D_app,beta_0,beta_5,d);

% Trace de la courbe de Bezier estimee, de degre d (trait rouge) :
y_estime = bezier(beta_0,beta_estime,beta_5,x);
plot(x,y_estime,'-r','MarkerSize',10,'LineWidth',3);
legend(' Modele exact (d=5)',' Donnees d''apprentissage',[' Modele estime (d=' num2str(d) ')'],'Location','Best');
