function y = Lagrange_approx(X,Y,x)
% Retourne la valeur de P(x) polynôme de lagrange interpolant les points [xi, yi] 
% En priant pour ne pas se retrouver dans le cas pas cool.
y = 0;
for i = 1:length(X)
    y = y + Lagrange_coef(X,i,x).*Y(i);
end

end

function Li = Lagrange_coef(X,i,x)
    Li = [1];
    A = 1:length(X);
    A(i) =[];
    for k = A
        Li = Li.*(x-X(k))/(X(i)-X(k));
    end
end