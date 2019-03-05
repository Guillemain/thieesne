function [valeurs_max,indices_max,coef_compression] = mp3(signal,nb,n)
%MP3 Summary of this function goes here
%   Detailed explanation goes here
[TG,~] = sonagramme(signal,nb,1.0);
[valeurs_max,indices_max] = sort(abs((TG)),1);
valeurs_max = valeurs_max(1:n,:);
indices_max = indices_max(1:n,:);
coef_compression = n*nb*size(valeurs_max,2);

end

