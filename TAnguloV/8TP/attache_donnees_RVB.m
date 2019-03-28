function AD_RVB = attache_donnees_RVB(I,moyennes,var_cov)

%ATTACHE_DONNEES_RVB Summary of this function goes here
%   Detailed explanation goes here
    [n,m,d] = size(I);
    N = size(moyennes,2);
    
    AD_RVB = zeros(n,m,N);
    
    for i = 1:N
       for j = 1:n
           for k = 1:m
              x = reshape(I(j,k,:),d,1);
              AD_RVB(j,k,i) =  log(det(var_cov(:,:,i))) + (x-moyennes(:,i))'*inv(var_cov(:,:,i))*(x-moyennes(:,i));
           end
       end
    end


end

