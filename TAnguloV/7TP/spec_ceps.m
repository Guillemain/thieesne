function [spec,ceps] = spec_ceps(signal,L)
%GABOR Summary of this function goes here
%   Detailed explanation goes here


%     window = hamming(L);
%     Ldemi = floor(L/2);
%     troncature = mod(length(signal),L);
%     signal = signal(1:end-troncature);
%     
%     signal_r = reshape(signal',Ldemi,[]);
%     fenetre = num2cell(signal_r, 1);
%     spec = [];
%     
%     for i = 1:length(fenetre)
%           spec = [spec fft(fenetre{i}).*window];
% %         spec = [spec fft(fenetre{i}(1:Ldemi)).*window];
% %         spec = [spec fft(fenetre{i}(Ldemi+1:end)).*window];
%     end
%     
%     ceps = ifft(log(spec));

Coef = [];
TG = [];
filtre = 0.54 - 0.46*cos(2 * pi * (1:L)/L); 


% Dans le cas ou L est impaire
L_2 = floor(L/2)+1;
i_fin; % Utile pour la dernière fenêtre.
for i = 1:L:(size(signal,1)-2*L)
    TG = [TG fft(signal(i:i+L-1))];
    Coef = [Coef log(abs(fft(signal(i:i+L-1).*filtre)))];
    Coef = [Coef log(abs(fft(signal( i+L_2 : i+L-1+L_2 ).*filtre)))];
    i_fin = i;
end
TG = 
Coef = [Coef log(abs(fft(signal(i_fin:i_fin + L -1))))];



end

