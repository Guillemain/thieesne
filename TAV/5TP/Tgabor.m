function TG = Tgabor(signal,n)
TG = [];
for i = 1:n:(size(signal,1)-n)
    TG = [TG fft(signal(i:i+n-1))];
end

disp('Perte sur la seule partie réelle :');
signal_perdu = real(ifft(real(TG)));	
signal_perdu = signal_perdu(:);
perte = sum((signal(1:size(signal_perdu,1))-signal_perdu).^2)/size(signal_perdu,1);
%sound(signal_perdu,11025);
disp(perte)
%perte = sum((signal(1:size(signal_restitue,1)-signal_signal_restitue).^2);
% signal_restitue = real(ifft((TG)));		% signal_restitue doit etre reel
% signal_restitue = signal_restitue(:);		% signal_restitue doit etre un vecteur

end

