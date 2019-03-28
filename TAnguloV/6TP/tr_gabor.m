function TG = tr_gabor(signal,nb_echantillons_par_mesure)
%GABOR Summary of this function goes here
%   Detailed explanation goes here
    
    troncature = mod(length(signal),nb_echantillons_par_mesure);
    signal = signal(1:end-troncature);
    
    signal_r = reshape(signal',nb_echantillons_par_mesure,[]);
    fenetre = num2cell(signal_r, 1);
    TG = [];
    
    for i = 1:length(fenetre)
        TG = [TG fft(fenetre{i})];
    end
end

