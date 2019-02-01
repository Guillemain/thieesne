function y = bezier( beta0,beta,betaFin,x0)
%BEZIER calcule la valeur de l’ordonnée d’une courbe
%de Bézier selon le modèle
x = x0(:)'; % Pour être sûr d'avoir un vecteur ligne.
b = [beta0 beta(:)' betaFin];
d = length(b)-1;
B = zeros(d,length(x));
for i = [0:d]
   B(i+1,:) = nchoosek(d,i)*x.^(i).*((1-x).^(d-i));
end
y =b*B;
end

