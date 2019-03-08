function [g,i_prec,j_prec,score] = alignement(seq1,seq2,distance);
A = zeros(size(seq1,2)+1,size(seq2,2)+1);
A(:,1) = inf;
A(1,:) = inf;
A(1,1) = 0;
i_prec = ones(size(A));
j_prec = ones(size(A));
w = [1 1 1];
for i = 2:size(A,1)
    for j = 2:size(A,2)
        v = [A(i-1,j) A(i-1,j-1) A(i,j-1)].*w;
        [m,ind] = min(v);
        if(ind == 1)
            j_prec(i,j) = 0;
        elseif(ind == 2)
            i_prec(i,j) = 0;
        end
        A(i,j) = distance(seq1,seq2,(i-1),(j-1)) + m;
    end
end
i_prec = i_prec(2:end,2:end);
j_prec = j_prec(2:end,2:end);
g = A(2:end,2:end);

score = 1;


end

