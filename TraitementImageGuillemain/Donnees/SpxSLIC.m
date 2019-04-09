function Msq = SpxSLIC(I,K)
%
%

% Le gradient de notre image.
Grad = derivees(I);

% Le pas de la grille.
sy = floor(size(I,2)/K); sx = floor(size(I,1)/K);

for i = 1:sx:size(I,1)-sx
   for j = 1:sy:size(I,2)-xy
      
       [~,centre_minimiseur] = min(Grad(i:i+sx,j:j+sy)); % On cherche pour chaque bloc les centre minimiseur du gradient.
       
   end
end
end

function G = derivees(I)
kernel_Sobel_y =   0.25*[1 2 1;
            0 0 0;
           -1 -2 -1];
kernel_Sobel_x = 0.25*[1 0 -1;
                       2 0 -2;
                       1 0 -1];
       
Gx = conv(I,kernel_Sobel_x,'same');
Gy = conv(I,kernel_Sobel_y,'same');

G = sqrt(Gx.^2 + Gy^2);
    
end