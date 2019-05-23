[X,Y] = saisi_points();
plot(X,Y,'+r');
plot(X,Y,'--b');
XY = [X;Y];
interpole = CastelJ(XY,100);
hold on
plot(interpole(1,:),interpole(2,:),'-');
axis([0,1,0,1]);
%%
%[X,Y] = saisi_points();
%plot(X,Y,'+r');
%XY = [X;Y];
interpole = CastelSub(XY,10,4);
hold on
plot(interpole(1,:),interpole(2,:),'r');
axis([0,1,0,1]);
plot(interpole(1,:),interpole(2,:),'r');
figure(2)
hold on
H = Hodographe(XY,10);
axis([-3,3,-3,3]);
plot(H(1,:),H(2,:),'-');
