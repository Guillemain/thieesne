function B = b_loc(p1,p2,p3,f)
%B_LOC Summary of this function goes here
%   Detailed explanation goes here
alpha_6 = ((p2(1) - p1(1))*(p3(2) - p1(2)) - (p3(1) - p1(1))*(p2(2) - p1(2)))/6; % Calcul de alpha

Xg = (p1(1) + p2(1) + p3(1))/3;
Yg = (p1(2) + p2(2) + p3(2))/3;
p = [Xg Yg];

b1 = alpha_6*f(p);
b2 = alpha_6*f(p);
b3 = alpha_6*f(p);
B = [b1 b2 b3];

end

