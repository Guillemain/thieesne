function AD = attache_donnees(I,mu,var)
AD = zeros(size(I,1),size(I,2),6);
for i = 1:size(mu,2)
    AD(:,:,i) = 0.5*log(var(i)) + (I - mu(i)).^2/(2*var(i));
end
end