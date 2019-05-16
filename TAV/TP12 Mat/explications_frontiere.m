% Explications de la fonction frontiere

clear
close all
clc

% Mise en place de la figure pour affichage :
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Explications sur la fonction "frontiere"',...
	'Position',[0.06*L,0.1*H,0.9*L,0.75*H])

% Lecture du domaine D a completer :
D = imread('masque_randonneur.png') > 0;
D = D(50:300,250:400);

delta_D_int2 = frontiere(D,-2);
to_disp = cat(3,D,D-delta_D_int2,D-delta_D_int2);
    subplot 245
        imagesc(to_disp(20:60,40:95,:))
        axis image off
        title('Frontiere a la distance -2','FontSize',20)

delta_D_int1 = frontiere(D,-1);
to_disp = cat(3,D,D-0.2*delta_D_int1,D-delta_D_int1);
    subplot 246
        imagesc(to_disp(20:60,40:95,:))
        axis image off
        title('Frontiere a la distance -1','FontSize',20)

to_disp = cat(3,D,D,D);
    subplot 211
        imagesc(to_disp(20:60,40:95,:))
        axis image off
        title('Haut du masque du randonneur','FontSize',20)
            
delta_D_ext1 = frontiere(D,1);
to_disp = cat(3,D,D+0.8*delta_D_ext1,D);
    subplot 247
        imagesc(to_disp(20:60,40:95,:))
        axis image off
        title('Frontiere a la distance +1','FontSize',20)
        
delta_D_ext2 = frontiere(D,2);
to_disp = cat(3,D,D+0.8*delta_D_ext2,D+delta_D_ext2);
    subplot 248
        imagesc(to_disp(20:60,40:95,:))
        axis image off
        title('Frontiere a la distance +2','FontSize',20)
        