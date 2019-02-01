function y = bezier_bruitee(beta_0,beta,beta_fin,x,sigma,n_app)
%BEZIER calcule la valeur de l’ordonnée d’une courbe
%de Bézier selon le modèle avec un ajout de bruit
y = bezier(beta_0,beta,beta_fin,x) + randn(size(x))*sigma ;

end

