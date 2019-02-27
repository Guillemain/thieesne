function A =  quadrangle(p1,p2,p3,p4)
%QUAD Summary of this function goes here
%   Detailed explanation goes here

Jphi = [(p2(1) - p1(1)) (p4(1) - p1(1));
        (p2(2) - p1(2)) (p4(2) - p1(2))];

det_sys = det(Jphi);

J = (Jphi'*Jphi);
a = J(1,1);
b = J(1,2);
c = J(2,2);
disp((c+a)/3 - b/2)
A =    [(c+a)/3-b/2 (a-2*c)/6 b/2-(a+c)/6 (c -2*a)/6;
        (a-2*c)/6 (c+a)/3+b/2 (c-2*a)/6 b/2-(a+c)/6;
        b/2-(a+c)/6  (c-2*a)/6 (c+a)/3-b/2 (a-2*c)/6;
        (c-2*a)/6 b/2-(a+c)/6 (a-2*c)/6 ((c+a)/3)+b/2];

A = 1/det_sys*A;
disp(A);
end

