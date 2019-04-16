function squelette = estimation_squelette(BW,contour)

[vx,vy] = voronoin(contour(2,:),contour(1,:));
for i = 1:size(vx,2)
    x1 = ceil(vx(1,i)); y1 = ceil(vx(2,i));
    x2 = ceil(vy(1,i)); y2 = ceil(vy(2,i));
    if BW(x1,y1) == 0 || BW(x2,y2) == 0
        vx(:,i) = [];
        vy(:,i) = [];
    end
end

squelette = reshape([vx;vy],[2,size(vx,2),2]);

end