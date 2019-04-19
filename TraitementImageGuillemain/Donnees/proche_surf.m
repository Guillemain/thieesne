function p = proche_surf(BW,x,y)
% Détermine si un pixel est proche (en choisissant arbitrairement le seuil)
% du contour de la surface
p = false;
s = 2;
dx = [s 0 -s ];
dy = [s 0 -s];
for i = dx
    for j = dy
        p = p || BW(y+j,x+i) == 0;
    end
end

