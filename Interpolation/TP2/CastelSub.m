function p = CastelSub(Pt,nb_t,i)
% Pt : les points tel que [x1 x2 ...;y1 y2 ... ], nombre de points à
% interpoller sur chaque subdivision, i nombre de subdivision.
if(i<=1)
    size(Pt)
    p=CastelJ(Pt,nb_t);
else
    N = size(Pt,2);
    [Qt,Tt] = Pt_control_sub(Pt,0.5);
    p = [CastelSub(Qt,nb_t,i-1),CastelSub(Tt,nb_t,i-1)];
end
end

%function p = justeUnPoint(Pt,