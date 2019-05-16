function delta_D = frontiere(D,distance_frontiere)

if distance_frontiere == 0

	error('La distance a la frontiere ne peut etre nulle.')

else

	% Formes pour la transformation morphologique :
	SEmax = strel('diamond',abs(distance_frontiere));
	SEmin = strel('diamond',abs(distance_frontiere)-1);

	% Frontiere a l'interieur de la zone contenant des 1 (i.e. le masque) :
	if distance_frontiere < 0
        delta_D = imerode(D,SEmin) - imerode(D,SEmax);

	% Frontiere a l'exterieur de la zone contenant des 1 :
	else

		delta_D = imdilate(D,SEmax) - imdilate(D,SEmin);

	end

end
