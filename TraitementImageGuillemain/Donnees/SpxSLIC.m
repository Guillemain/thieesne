function Msq = SpxSLIC(Image,K)
%
%

m = 0.1;
Seuil = 10;

% Le gradient de notre image.


% Le pas de la grille.
S = floor(sqrt(size(Image,1)*size(Image,2)/K));
I = Image(1:(size(Image,1)-mod(size(Image,1),S)),1:(size(Image,2)-mod(size(Image,2),S))); % on tronque l'image pour que ça se passe bien.

centres = [];
Grad = derivees(I);
for i = 1:S:size(I,1)-S
   for j = 1:S:size(I,2)-S      
       [val,cy] = min(Grad(i:i+S,j:j+S)); % On cherche pour chaque bloc les centre minimiseur du gradient.
       [~,cx] = min(val);
       centres = [centres [cx ; cy]];
   end
end
k_prime = size(centres,2); % vrai nombre de classe
[nx,ny,~] = size(I);

%Initialisation des variables : 
Msq = zeros(nx,ny);
distance = zeros(nx,ny,k_prime);
facteur_spatial = m/Seuil;
Mx = [1:nx].*ones(nx,ny);
My = [1:ny]'.*ones(nx,ny);


%
for k = 1:k_prime
    d_temp = (I-I(centres(1,k),centres(2,k)));
    distance(:,:,k) = sqrt(d_temp(:,:,1).^2 + d_temp(:,:,2).^2 + d_temp(:,:,3).^2) + facteur_spatial* sqrt((centre(1,k) - Mx).^2 + (centre(2,k) - My).^2); 

end
Msq = min(distance,[],3);


end
