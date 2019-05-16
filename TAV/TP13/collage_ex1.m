function u = collage_ex1(r,s,interieur)

% Dimensions de r :
[nb_lignes,nb_colonnes,nb_canaux] = size(r);

% Calcul de l'imagette resultat im, canal par canal :
u = r;

% Calcul de nos opérateur Lapalcien.
nb_pixels = nb_lignes*nb_colonnes;

e = ones(nb_pixels,1);
Dx = spdiags([-e e],[0 nb_lignes],nb_pixels,nb_pixels);
Dx(nb_pixels-nb_lignes+1:nb_pixels,:) = 0;
Dy = spdiags([-e e],[0 1],nb_pixels,nb_pixels);
Dy(nb_lignes:nb_lignes:nb_pixels,:) = 0;
A = (-Dx'*Dx-Dy'*Dy);

% Indice du bord :
carre = zeros(nb_lignes,nb_colonnes);
carre(:,1) = 1;
carre(:,end) = 1;
carre(1,:) = 1;
carre(end,:) = 1;
carre = carre(:);
index = find(carre ==1);
A(index,:) = sparse(1:length(index),index,ones(length(index),1),length(index),nb_pixels);

for k = 1:nb_canaux
    u_k = double(u(:,:,k));
	s_k = double(s(:,:,k));
    % Création de g
	[gx_s,gy_s] = gradient(s_k); % gradient de la soucre
    [gx,gy] = gradient(u_k); % gradient de la cible
    gx(interieur) = gx_s(interieur);
    gy(interieur) = gy_s(interieur);
    gx = gx(:);
    gy = gy(:);
    div_g = Dx*gx + Dy*gy;
    % Condition au bord : 
    
    div_g(index) = u_k(index);
	u(:,:,k) = reshape(A\div_g,nb_lignes,nb_colonnes);
end
