function ES = calcul_ES(S,indices_partition,valeurs_t,valeurs_f_S)

ES = [];
for i = 2:size(indices_partition,2)
    Maxima = [];

    [modules,indices] = max(abs(S(indices_partition(i-1):indices_partition(i)-1,:)));
    Maxima = [modules' valeurs_t' (valeurs_f_S( indices_partition(i-1) + indices -1))'];
    % [|val_f| f ti]
    
    Seuil = mean(Maxima(:,1)) + std(Maxima(:,1));
    f_a_ajouter = Maxima((Maxima(:,1) > Seuil), 2:3);
    ES = [ES ; f_a_ajouter];
end
end

