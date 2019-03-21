function [valeurs_max,indices_max,coef_compression] = mp3(signal,nb_echantillons_par_mesure,n)
%MP3 Summary of this function goes here
%   Detailed explanation goes here
    TG = tr_gabor(signal,nb_echantillons_par_mesure);
    
    valeurs_max = zeros(n,size(TG,2));
    indices_max = zeros(n,size(TG,2));
        
    for i = 1:size(TG,2)
        [v,ind] = sort(abs(TG(:,i)),'descend');
        valeurs_max(i,:) = v(1:n);
        indices_max(i,:) = ind(1:n);
    end
    
    coef_compression = length(signal)/(2*numel(valeurs_max));
    
end

