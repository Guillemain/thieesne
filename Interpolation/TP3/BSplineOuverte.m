function p = BSplineOuverte(XY,nb_subdivi,deg)
bord = [XY(:,1) XY(:,end)];
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
        for k = 1:taille-1
            R = [R (p(:,k)+p(:,k+1))/2];
        end
        p = [bord(:,1) R bord(:,2)];
    end
    resultat = R;
end
end

