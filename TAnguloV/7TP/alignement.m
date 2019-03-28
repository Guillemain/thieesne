function [g,i_prec,j_prec,score] = alignement(sequence_1,sequence_2,distance)

%ALIGNEMENT Summary of this function goes here
%   Detailed explanation goes here
L1 = length(sequence_1);
L2 = length(sequence_2);
g = zeros(L1+1,L2+1);

g(1,:) = inf;
g(:,1) = inf;
g(1,1) = 0;
i_prec = ones(L1,L2);
j_prec = ones(L1,L2);

for i = 2:L1+1
    for j = 2:L2+1
        X = [g(i-1,j-1) g(i-1,j) g(i,j-1)];
        [v,ind] = min(X);
        g(i,j) = feval(distance,sequence_1,sequence_2,i-1,j-1) + v;
        
        if ind(1) == 2
            i_prec(i,j) = 0;
        elseif ind(1) == 3
            j_prec(i,j) = 0;
        end
    end
end

g = g(2:end,2:end);


score = g(L1,L2);
