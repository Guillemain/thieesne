function [SG,coef_compression] = sonagramme(signal,nb_echantillons_par_mesure,proportion)
%SONAGRAMME Summary of this function goes here
%   Detailed explanation goes here
    TG = tr_gabor(signal,nb_echantillons_par_mesure);
    SG = TG(1:round(size(TG,1)*0.5*proportion),:);
    coef_compression = length(signal)/numel(SG);

end

