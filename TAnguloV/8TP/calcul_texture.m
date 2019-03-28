function texture = calcul_texture(nombre,moyennes,variances)

texture = 0;
somme = 0;
moyennes_carre = moyennes.*moyennes;
for n = 2:256
	if nombre(n)~=0
		texture = texture+variances(n)-(moyennes_carre(n))/nombre(n);
		somme = somme+nombre(n);
	end
end
texture = texture/somme;
