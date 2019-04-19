function y = Berstein(x,K,n)
y = nchoosek(n,K)*x.^(K).*(1-x).^(n-K);
end