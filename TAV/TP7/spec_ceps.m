function  [spec,ceps] = spec_ceps(signal,L)
S = [];

filtre = 0.54 - 0.46*cos(2 * pi * (1:L)/L); 
% Pour voir le filtre :
% plot((1:L),filtre)

% Dans le cas ou L est impaire
L_2 = floor(L/2)+1;
i_fin= 1; % Utile pour la dernière fenêtre.

for i = 1:L:(size(signal,1)-2*L)
    S = [S signal(i:i+L-1)];
    S = [S signal( i+L_2 : i+L-1+L_2 )];
    i_fin = 1;
end
S = [S signal(i_fin:i_fin+L-1)];
S = S.*filtre';
spec = abs(fft(S));
ceps = real(ifft(log(spec)));

%for i = 1:L:(size(signal,1)-2*L)
%    spec = [spec abs(fft(signal(i:i+L-1).*filtre))];
%    ceps = [ceps real(ifft(log(spec(:,end))))];
%    spec = [spec real(ifft(log(abs(fft(signal( i+L_2 : i+L-1+L_2 ).*filtre)))))];
%    ceps = [ceps real(ifft(log(spec(:,end))))];
%    i_fin = i;
%end
%spec = [spec fft(signal(i_fin:i_fin+L-1).*filtre)];
%ceps = [ceps real(ifft(log(spec(:,end))))];
end

