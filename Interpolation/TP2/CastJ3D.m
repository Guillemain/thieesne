function [M] = CastJ3D(Pt,nb_point)
%CASTJ3D Summary of this function goes here
%   Detailed explanation goes here
M = interpole_col(Pt,nb_point);

M = interpole_col(permute(M,[2,1,3]),nb_point);
M = permute(M,[2,1,3]);
end

function X = interpole_col(M,nb_point)
X = zeros(size(M,1),nb_point,3);
T = linspace(0,1,nb_point);
for i = 1:size(M,1)
for t = 1:nb_point
    P = permute(M(i,:,:),[3,2,1]);
    N = size(P,2);
    for j = 1:N
    for k = 1:N-j
        P(:,k) = T(t)*P(:,k) + (1-T(t))*P(:,k+1);
    end
    end
    X(i,t,:) = P(:,1)';
end
end
end