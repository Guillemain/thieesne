clear;


mu_GVF = 2;
gamma_GVF = 0.2;

close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);


% Lecture et affichage de l'image a segmenter :
I = imread('coins.png');
[nb_lignes,nb_colonnes,nb_canaux] = size(I);
if nb_canaux==3
	I = rgb2gray(I);
end
I = double(I);
I = I/max(I(:));
	
% Champ de force externe :
% Noyau gaussien : 
sigma = 5;
T = 3*sigma;
filtre = fspecial('gaussian',T,sigma);

[Ix,Iy] = gradient(I);
Eext = -(Ix.*Ix+Iy.*Iy);
[Fx,Fy] = gradient(Eext);
F0x = Fx;
F0y = Fy;
norme_ext = (norm(gradient(Eext),2))^2;
for i = 1:300
    Fx = Fx - gamma_GVF*(norme_ext*(Fx-F0x)-mu_GVF*del2(Fx));
    Fy = Fy - gamma_GVF*(norme_ext*(Fy-F0y)-mu_GVF*del2(Fy));
end


% Normalisation du champ de force externe pour l'affichage :
norme = sqrt(Fx.*Fx+Fy.*Fy);
Fx_normalise = Fx./(norme+eps);
Fy_normalise = Fy./(norme+eps);

% Affichage du champ de force externe :

imagesc(I);
colormap gray;
axis image off;
axis xy;
hold on;
pas_fleches = 5;
taille_fleches = 1;
[x,y] = meshgrid(1:pas_fleches:nb_colonnes,1:pas_fleches:nb_lignes);
Fx_normalise_quiver = Fx_normalise(1:pas_fleches:nb_lignes,1:pas_fleches:nb_colonnes);
Fy_normalise_quiver = Fy_normalise(1:pas_fleches:nb_lignes,1:pas_fleches:nb_colonnes);
hq = quiver(x,y,Fx_normalise_quiver,Fy_normalise_quiver,taille_fleches);
set(hq,'LineWidth',1,'Color',[1,0,0]);
fig =  title('Champ de force externe de base','FontSize',20);
saveas(fig,'test.png')

