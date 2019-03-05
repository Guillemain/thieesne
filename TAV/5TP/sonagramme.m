function [SG,coef_compression] = sonagramme(signal,n,proportion);
TG = [];
for i = 1:n:(size(signal,1)-n)
    TG = [TG fft(signal(i:i+n-1))];
end
frqMax = size(TG,1)/2; % Par deux parcequ'il y a aussi la partie négative
SG = []
for i = 1:size(TG,2)
   SG = [SG TG(1:round(proportion*min(frqMax,1)),i)];
end
coef_compression = n/(size(SG(:),1));

end

