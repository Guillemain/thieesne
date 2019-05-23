function y = Berstein(x,K,n)
% Note K peut être un vecteur
y = nchoosek(n,K)*x.^(K).*(1-x).^(n-K);
end