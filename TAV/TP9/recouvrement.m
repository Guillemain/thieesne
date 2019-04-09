function Recou = recouvrement(X,Y,x_d,y_d,R_2)
Recou = Recou + sum( ((x_d - X).^2 + (y_d - Y).^2)) <= R_2*2 );
end

