function squelette = estimation_squelette(BW,contour)
[n,m] = size(BW);
[vx,vy] = voronoi(contour(:,2),contour(:,1));
hold on
plot(vx,vy);
for i = size(vx,2):-1:1
    y1 = ceil(vx(1,i)); x1 = ceil(vx(2,i));
    y2 = ceil(vy(1,i)); x2 = ceil(vy(2,i));
    
    
    if min([x1 x2 y1 y2]) < 1 || max([x1 x2])>n || max([y1 y2])>m || BW(x1,y1) == 1 || BW(x2,y2) == 1
        vx(:,i) = [];
        vy(:,i) = [];
    end
end

squelette = reshape([vx;vy],[2,size(vx,2),2]);
figure;
imshow(BW);
hold on
plot(vx,vy,'m');
end