function B = b_loc_q(p1,p2,p3,p4,f)
Jphi = [(p2(1) - p1(1)) (p4(1) - p1(1));
        (p2(2) - p1(2)) (p4(2) - p1(2))];

det_sys = det(Jphi)/4;
Xg = (p1(1) + p2(1) + p3(1) + p4(1))/4;
Yg = (p1(2) + p2(2) + p3(2) + p4(2))/4;
p = [Xg Yg];

b = det_sys*f(p);
B = [b b b b];
end

