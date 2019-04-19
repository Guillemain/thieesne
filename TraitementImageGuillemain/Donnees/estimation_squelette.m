function squelette = estimation_squelette(BW,contour)
[n,m] = size(BW);
[vx,vy] = voronoi(contour(:,1),contour(:,2));
for i = size(vx,2):-1:1
    x1 = ceil(vx(1,i)); x2 = ceil(vx(2,i));
    y1 = ceil(vy(1,i)); y2 = ceil(vy(2,i));
    
    
    if min([x1 x2 y1 y2]) < 1 || max([x1 x2])>m || max([y1 y2])>n || proche_surf(BW,x1,y1)  || proche_surf(BW,x2,y2)
        vx(:,i) = [];
        vy(:,i) = [];
    end
end

% [V,C] = voronoin(contour,[]);
% ind = [];
% for i = 1:length(V)
%     x = floor(V(i,1)); y = floor(V(i,2));
%     if min([x y]) < 1 || x > m || y > n ||proche_surf(BW,x,y)
%         ind = [ind i];
%     end
% end
% Adj = zeros(length(V));
% 
% for i =1:length(C)    
%     for j = 2:length(C{i})
%         Adj(C{i}(j-1),C{i}(j)) = 1;
%         Adj(C{i}(j),C{i}(j-1)) = 1;
%     end
% end
% Adj(ind,:) = 0;
% Adj(:,ind) = 0;
squelette = reshape([vx;vy],[2,size(vx,2),2]);
%V(:,[1 2]) = V(:,[2 1]);
figure;
imshow(BW);
hold on;
plot(vx,vy,'-*r');
% gplot(Adj,V,'-*r');
% hold off;
% squelette = {V C};
end