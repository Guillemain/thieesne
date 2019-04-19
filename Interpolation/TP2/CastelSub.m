function p = CastelSub(Pt,nb_t,i)
% Pt : les points tel que [x1 x2 ...;y1 y2 ... ], nombre de points à
% interpoller sur chaque subdivision, i nombre de subdivision.
if(i<=1)
    p=CastelJ(Pt,nb_t);
else
    N = size(Pt,2);
    c = 
    N2 = floor(N/2);
    if (mod(N,2) == 0)
        p = [CastelSub([Pt(:,1:N2-1) c],nb_t,i-1)]%, CastelSub([c Pt(:,N2:end)],nb_t,i-1)];
    else
        p = [CastelSub([Pt(:,1:N2) c],nb_t,i-1)]%, CastelSub([c Pt(:,N2:end)],nb_t,i-1)];
    end
end
end

function p = justeUnPoint(Pt,