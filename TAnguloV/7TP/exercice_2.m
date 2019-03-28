clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

distance = 'distance_ADN';

% Alignement de deux sequences d'ADN :
sequence_1 = 'AAGTAGGC';
sequence_2 = 'ATGGTACGTC';
[g,i_prec,j_prec,score] = alignement(sequence_1,sequence_2,distance);

% Affichage du resultat :
figure('Name','Alignement de sequences d''ADN','Position',[0.5*L,0,0.5*L,0.6*H]);
hold on;
affichage_tableau(sequence_1,sequence_2,g(2:end,2:end),i_prec,j_prec);

% Affichage du score optimal :
fprintf('Score de l''alignement : %.2f\n',score);
