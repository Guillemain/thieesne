function squelette = estimation_squelette(BW,contour)
[n,m] = size(BW);
[vx,vy] = voronoi(contour(:,1),contour(:,2));
for i = size(vx,2):-1:1
    x1 = ceil(vx(1,i)); x2 = ceil(vx(2,i));
    y1 = ceil(vy(1,i)); y2 = ceil(vy(2,i));
    
    
    if min([x1 x2 y1 y2]) < 1 || max([x1 x2])>m || max([y1 y2])>n || BW(y1,x1) == 0  || BW(y2,x2) == 0
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