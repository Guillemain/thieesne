function c = CastelJ(Pt,nb_t)
%  | | T[i][j] = t*T[i+1][j-1] + (1-t)*T[i][j-1]
N = size(Pt,2);
c = [];
for t = linspace(0,1,nb_t)
    P = Pt;
    for j = 1:N
    for i = 1:N-j
        P(:,i) = t*P(:,i) + (1-t)*P(:,i+1);
    end
    end
    v = P(:,1);
    c = [c v(:)];
end
end

% 1 2 3 4
% * * * * j= 1
% * * *   j= 2
% * *     j= 3
% *       j= 4