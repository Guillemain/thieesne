function M = visualiseSPX(im,label,c)
listeLabel = unique(label);
M = zeros(size(label,1),size(label,2),3);
for k = listeLabel'
    indice = (label==k);
    for i = 1:3
        A = M(:,:,i);
        B = im(:,:,i);
        couleur = B(c(1,k),c(2,k));
        A(indice) = couleur;
        M(:,:,i) = A;
    end
end
M = uint8(M);
end

