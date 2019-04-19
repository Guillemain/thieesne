[X,Y] = saisi_points();
plot(X,Y,'+r');
XY = [X;Y];
interpole = CastelJ(XY,100);
hold on
plot(interpole(1,:),interpole(2,:));
axis([0,1,0,1]);
%%
%[X,Y] = saisi_points();
%plot(X,Y,'+r');
%XY = [X;Y];
interpole = CastelSub(XY,50,2);
hold on
plot(interpole(1,:),interpole(2,:));
axis([0,1,0,1]);