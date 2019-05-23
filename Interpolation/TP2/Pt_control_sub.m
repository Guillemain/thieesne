function  [Qt,Tt] = Pt_control_sub(Pt,t)
%  | | T[i][j] = t*T[i+1][j-1] + (1-t)*T[i][j-1]
N = size(Pt,2);
Qt = [Pt(:,1)];
Tt = [Pt(:,end)];
P = Pt;
for j = 1:N
    for i = 1:N-j
        P(:,i) = t*P(:,i) + (1-t)*P(:,i+1);
    end
    Qt = [P(:,1) Qt];
    Tt = [Tt P(:,N+1-j)];
end
end

% 1 2 3 4
% * * * * j= 1
% * * *   j= 2
% * *     j= 3
% *       j= 4