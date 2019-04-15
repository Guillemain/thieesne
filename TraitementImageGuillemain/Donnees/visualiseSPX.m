function M = visualiseSPX(im,label)
listeLabel = unique(label);
M = zeros(size(im));
for k = listeLabel'
    indice = (label==k);
    for i = 1:3
        A = M(:,:,i);
        B = im(:,:,i);
        A(indice) = B(find(indice==1,1));
        M(:,:,i) = A;
    end
end
end

