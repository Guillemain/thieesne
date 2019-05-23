function p = subdivise(XY,nb_subdivi,deg)
resultat = XY;
% On double le nbr de points :
for i = 1:nb_subdivi
    p = [];
    for j = 1:length(resultat)
        p = [p resultat(:,j) resultat(:,j)];
    end
    for n = 1:deg
        taille = length(p);
        R=[];
        for k = 1:taille
            R = [R (p(:,k)+p(:,mod(k,taille)+1))/2];
        end
        p = R;
    end
    resultat = R;
end
end

