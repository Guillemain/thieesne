function G = derivees(I)

kernel_Sobel_y =   0.25*[1 2 1;
            0 0 0;
           -1 -2 -1];
kernel_Sobel_x = 0.25*[1 0 -1;
                       2 0 -2;
                       1 0 -1];
Gx = zeros(size(I));
Gy = Gx;
G = zeros(size(I,1),size(I,2));
% calcul des gradients pour chaque canal
for i =1:size(I,3)
    Gx(:,:,i) = conv2(I(:,:,i),kernel_Sobel_x,'same');
    Gy(:,:,i)  = conv2(I(:,:,i),kernel_Sobel_y,'same');
    G = G + Gx(:,:,i).^2 + Gy(:,:,i).^2;
end

G = sqrt(G);

end