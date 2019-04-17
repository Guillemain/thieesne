%% Fonctionelle
[X,Y] = saisi_points();
subplot(1,2,1);
resolution = 0:0.01:1;
inter = Lagrange_approx(X,Y,resolution);
plot(X,Y,'+r');
hold on
plot(resolution,inter);
axis([0,1,0,1]);
%% Param
% [X,Y] = saisi_points();
% XY = [X;Y];
% resolution = 0:0.00001:1;
% inter2 = inter_parametrique(XY,resolution);
% figure(2)
% plot(X,Y,'+r');
% hold on
% plot(inter(1,:),inter(2,:));
% axis([0,1,0,1])
%% Param
subplot(1,2,2);
XY = [X;Y];
hold on
resolution = 0:0.00001:1;
plot(X,Y,'or');
inter = inter_parametrique(XY,resolution);
plot(inter(1,:),inter(2,:));
inter = inter_parametrique_ti(XY,1000,2);
plot(inter(1,:),inter(2,:));
inter = inter_parametrique_ti(XY,1000,3);
plot(inter(1,:),inter(2,:));
inter = inter_parametrique_ti(XY,1000,1);
plot(inter(1,:),inter(2,:));
axis([0,1,0,1])
legend('point','ti [0,1]','ti norme2','ti norme 1','ti Tchebytchev','Location','best');

%%