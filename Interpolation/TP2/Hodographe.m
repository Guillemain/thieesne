function P = Hodographe(Pt,nb_pt)
V = [];
N = size(Pt,2)
for i = 1:N-1
    V = [V (Pt(:,i+1)-Pt(:,i))];
end
V = N*V;
P = CastelJ(V,nb_pt);
end