function [xs,ys] = iteration(x,y,Fx,Fy,gamma,A)
indice = sub2ind(size(Fx),round(y),round(x));
Bx = Fx(indice);
By = Fy(indice);
xs = (-gamma*Bx) + A*x;
ys = (-gamma*By) + A*y;
end