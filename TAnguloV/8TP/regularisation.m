function reg = regularisation(i,j,k,ks,beta)
%REGULARISATION Summary of this function goes here
%   Detailed explanation goes here
%    coeffs = {[i-1,j-1],[i-1,j],[i-1,j+1],[i,j-1],[i,j+1],[i+1,j-1],[i+1,j],[i+1,j+1]};
 %   [n,m] = size(k);
  %  reg = 0;
    
   % for ind = coeffs
    %    ind = cell2mat(ind);
     %   if (ind(1) >= 1 && ind(1) <= n && ind(2) >= 1 && ind(2) <= m)
      %      reg = reg +beta*(ks~=k(ind(1),ind(2)));
       % end
    %end
    
[nl,nc] = size(k);

somme = 0;


if (i ~= 1 && j ~= 1)
    if (k(i-1,j-1) ~= ks)
        somme = somme + 1;
    end
end

if (i ~= nl && j ~= 1)
    if (k(i+1,j-1) ~= ks)
        somme = somme + 1;
    end
end

if (i ~= 1 && j ~= nc)
    if (k(i-1,j+1) ~= ks)
        somme = somme + 1;
    end
end

if (i ~= nl && j ~= nc)
    if (k(i+1,j+1) ~= ks)
        somme = somme + 1;
    end
end
    

if (j ~= 1)
    if (k(i,j-1) ~= ks)
        somme = somme + 1;
    end
end

if (j ~= nc)
    if (k(i,j+1) ~= ks)
        somme = somme + 1;
    end
end
    
if (i ~= 1)
    if (k(i-1,j) ~= ks)
        somme = somme + 1;
    end
end

if (i ~= nl)
    if (k(i+1,j) ~= ks)
        somme = somme + 1;
    end
end

reg = beta + somme;    
    
    
end

