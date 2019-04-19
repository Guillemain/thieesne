function [indice,M,Mnb,Teinte] = binariseIM(im,label,c)
listeLabel = unique(label);
M = zeros(size(label,1),size(label,2),3);
for k = listeLabel'
    indice = (label==k);
    for i = 1:3
        A = M(:,:,i);
        B = im(:,:,i);
        couleur = B(c(1,k),c(2,k));
        A(indice) = uint8(couleur);
        M(:,:,i) = A;
    end
end
T = rgb2hsv(M); % Un mode de couleur plus cohérent ici.
Teinte = T(:,:,1); %voila.
Teinte = Teinte(:);
% Rotation vers le referenciel violet (parce que les angles c'est pas
% linéaire
%Teinte = mod(Teinte +20,360);

%indice = kmeans(Teinte,2,'Replicates',10,'Start','cluster');
indice = (Teinte < 0.4)+(Teinte > 0.9);
for i = 1:3
    A = M(:,:,i);
    A(indice==1) = uint8(255);
    A(indice~=1) = uint8(0);
    M(:,:,i) = A;
end
Mnb = M(:,:,1);
Mnb(Mnb==255)=1;
end