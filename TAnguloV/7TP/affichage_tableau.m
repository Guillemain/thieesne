function affichage_tableau(s_1,s_2,g,i_prec,j_prec)

% Affichage des lignes horizontales et de la sequence 1 :
[nb_lignes,nb_colonnes] = size(g);
for i = 1:nb_lignes
	y = i-0.5;
	line([0.5 nb_colonnes+0.5],[y y],'Color','k','LineWidth',2);
	text(-0.1,i,s_1(i),'FontSize',20);
end
y = nb_lignes+0.5;
line([0.5 nb_colonnes+0.5],[y y],'Color','k','LineWidth',2);
axis ij;
axis image off;

% Affichage des lignes verticales et de la sequence 2 :
for j = 1:nb_colonnes
	x = j-0.5;
	line([x x],[0.5 nb_lignes+0.5],'Color','k','LineWidth',2);
	text(j-0.1,0.1,s_2(j),'FontSize',20);
end
x = nb_colonnes+0.5;
line([x x],[0.5 nb_lignes+0.5],'Color','k','LineWidth',2);

% Affichage des fleches :
for i = 1:nb_lignes
	for j = 1:nb_colonnes
		line([j-j_prec(i,j) j],[i-i_prec(i,j) i],'Color','r');
	end
end

% Affichage du chemin optimal :
i = nb_lignes;
j = nb_colonnes;
while i>0 & j>0
	line([j-j_prec(i,j) j],[i-i_prec(i,j) i],'Color','r','LineWidth',2);
	i = i-i_prec(i,j);
	if i>0
		j = j-j_prec(i,j);
	end
end		

% Affichage des valeurs de g :
for i = 1:nb_lignes
	for j = 1:nb_colonnes
		text(j-0.1,i,num2str(g(i,j)),'BackgroundColor',0.94*ones(1,3),'Color','b','FontSize',20);
	end
end
