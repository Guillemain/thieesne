function AD = attache_donnees(I,moyennes,variances)
%ATTACHE_DONNEES Summary of this function goes here
%   Detailed explanation goes here
    [n,m] = size(I);
    N = length(moyennes);
    
    AD = zeros(n,m,N);
    
    for i = 1:N
       for j = 1:n
           for k = 1:m
              AD(j,k,i) =  log(variances(i)^0.5) + (I(j,k)-moyennes(i))^2/(2*variances(i));
           end
       end
    end

end

