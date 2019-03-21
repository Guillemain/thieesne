function reg = regularisation(i,j,k,classe,beta)
d = size(k);
voisins_i = [i-1,i,i+1];
voisins_j = [j-1,j,j+1];
if(i == 1)
    voisins_i = voisins_i(2:end);
elseif (i == d(1))
    voisins_i = voisins_i(1:2);
end

if(j == 1)
    voisins_j = voisins_j(2:end);
elseif (j == d(2))
    voisins_j = voisins_j(1:2);
end

reg = 0;
for ind = voisins_i
    for jnd = voisins_j
        temp = (classe ~= k(ind,jnd));
        reg = reg + temp;
    end
end
reg = beta * reg;


end

