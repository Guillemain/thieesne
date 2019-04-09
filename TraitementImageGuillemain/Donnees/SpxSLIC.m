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
