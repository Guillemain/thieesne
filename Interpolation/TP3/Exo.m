clear all; close all;
[X,Y] = saisi_points();
XY = [X;Y];
Sxy = subdivise(XY,3,3);
plot([X X(1)],[Y Y(1)],'--');
hold on 
plot([Sxy(1,:) Sxy(1,1)],[Sxy(2,:) Sxy(2,1)],'-');

hold on

[X,Y] = saisi_points();
XY = [X;Y];
Sxy = BSplineOuverte(XY,2,3);
plot([X],[Y],'--');
hold on 
plot([Sxy(1,:)],[Sxy(2,:)],'o');
plot([Sxy(1,:)],[Sxy(2,:)],'-');

