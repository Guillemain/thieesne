[X,Y]=meshgrid(0:0.25:1,0:0.25:1);
Z=exp(-((X-1/2).^2+(Y-1/2).^2));
figure('name', 'Bonus')
subplot(1,3,1);
surf(X,Y,Z) % permet de visualiser la grille de points 3D
Grille=zeros(size(X,1),size(X,2),3);
Grille(:,:,1)=X;
Grille(:,:,2)=Y;
Grille(:,:,3)=Z;

% Echantillonage
pas = 1/20;
n = size(X,1); %5
tps = 1:n;
echantillon = [1:pas:tps(n)];


valeurs_x = [];
valeurs_y = [];
valeurs_z = [];

for j=1:n
    % fonction polynome de Lagrange
    x = arrayfun(@(x) Lagrange(x,tps,X(j,:)),echantillon); 
    z = arrayfun(@(x) Lagrange(x,tps,Z(j,:)),echantillon); 
   
    %y = Grille(j,1,2)*ones(1,length(x))
    valeurs_x = [valeurs_x ; x];
    valeurs_z = [valeurs_z ; z];
    
    y = Y(j,1)*ones(size(x));
    valeurs_y = [valeurs_y ; y];
    
end

subplot(1,3,2);
surf(valeurs_x,valeurs_y,valeurs_z)
title('Premiere Interpolation');


valeurs2_x = [];
valeurs2_y = [];
valeurs2_z = [];

m = size(valeurs_x,2);


for j=1:m
    % fonction polynome de Lagrange 
    y = arrayfun(@(x) Lagrange(x,tps,valeurs_y(:,j)),echantillon); 
    z = arrayfun(@(x) Lagrange(x,tps,valeurs_z(:,j)),echantillon); 
    
    
    x = valeurs_x(1,j)*ones(size(y));
    valeurs2_x = [valeurs2_x ; x];
    valeurs2_y = [valeurs2_y ; y];
    valeurs2_z = [valeurs2_z ; z];
end

subplot(1,3,3);
surf(valeurs2_x,valeurs2_y,valeurs2_z)
title('Seconde interpolation');


