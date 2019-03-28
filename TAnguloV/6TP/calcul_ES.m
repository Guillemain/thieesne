function ES = calcul_ES( S,indices_partition,valeurs_t,valeurs_f_S )
%CALCUL_ES Summary of this function goes here
%   Detailed explanation goes here

ES = [];
%for i = 1:length(valeurs_t) % balayage temporel
    %maxima = [];
    %indices = [];
    % balayage par sous_
    for j = 1:length(indices_partition)-1
        [maxima,ind] = max(abs(S(indices_partition(j):(indices_partition(j+1)-1),:)));
        %maxima = [maxima maxi];
        %indices = [indices ind];
    
        ind_max = find(maxima > mean(maxima)+std(maxima));
    
        ES = [ES; valeurs_t(ind_max)',valeurs_f_S(indices_partition(j)+ind(ind_max))'];
    end
%end

